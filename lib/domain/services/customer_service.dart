import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../data/database/app_database.dart';
import '../../data/repositories/customer_repository.dart';
import 'audit_log_service.dart';

class CustomerListEntry {
  const CustomerListEntry({
    required this.customer,
    required this.addressCount,
    this.defaultAddress,
  });

  final Customer customer;
  final int addressCount;
  final CustomerAddressesData? defaultAddress;
}

class CustomerDetail {
  const CustomerDetail({required this.customer, required this.addresses});

  final Customer customer;
  final List<CustomerAddressesData> addresses;
}

class CreateCustomerInput {
  const CreateCustomerInput({
    this.uuid,
    required this.customerName,
    this.phone,
    this.companyName,
    this.department,
    this.customerType = 'default',
    this.wechat,
    this.email,
    this.remark,
    this.operatorName,
    this.deviceId,
  });

  final String? uuid;
  final String customerName;
  final String? phone;
  final String? companyName;
  final String? department;
  final String customerType;
  final String? wechat;
  final String? email;
  final String? remark;
  final String? operatorName;
  final String? deviceId;
}

class UpdateCustomerInput {
  const UpdateCustomerInput({
    required this.customerName,
    this.phone,
    this.companyName,
    this.department,
    this.customerType = 'default',
    this.wechat,
    this.email,
    this.remark,
    this.operatorName,
    this.deviceId,
  });

  final String customerName;
  final String? phone;
  final String? companyName;
  final String? department;
  final String customerType;
  final String? wechat;
  final String? email;
  final String? remark;
  final String? operatorName;
  final String? deviceId;
}

class CreateCustomerAddressInput {
  const CreateCustomerAddressInput({
    this.uuid,
    required this.customerUuid,
    this.recipientName,
    this.phone,
    this.province,
    this.city,
    this.district,
    this.detailAddress,
    this.recipientCompany,
    this.isDefault = false,
    this.remark,
    this.operatorName,
    this.deviceId,
  });

  final String? uuid;
  final String customerUuid;
  final String? recipientName;
  final String? phone;
  final String? province;
  final String? city;
  final String? district;
  final String? detailAddress;
  final String? recipientCompany;
  final bool isDefault;
  final String? remark;
  final String? operatorName;
  final String? deviceId;
}

class UpdateCustomerAddressInput {
  const UpdateCustomerAddressInput({
    this.recipientName,
    this.phone,
    this.province,
    this.city,
    this.district,
    this.detailAddress,
    this.recipientCompany,
    this.isDefault = false,
    this.remark,
    this.operatorName,
    this.deviceId,
  });

  final String? recipientName;
  final String? phone;
  final String? province;
  final String? city;
  final String? district;
  final String? detailAddress;
  final String? recipientCompany;
  final bool isDefault;
  final String? remark;
  final String? operatorName;
  final String? deviceId;
}

class CustomerService {
  CustomerService({
    required CustomerRepository customerRepository,
    AuditLogService? auditLogService,
    Uuid? uuidGenerator,
  }) : _customerRepository = customerRepository,
       _auditLogService = auditLogService,
       _uuid = uuidGenerator ?? const Uuid();

  final CustomerRepository _customerRepository;
  final AuditLogService? _auditLogService;
  final Uuid _uuid;

  Future<List<CustomerListEntry>> listCustomers({
    String keyword = '',
    int limit = 50,
    int offset = 0,
  }) async {
    final customers = keyword.trim().isEmpty
        ? await _customerRepository.list(limit: limit, offset: offset)
        : await _customerRepository.search(
            keyword,
            limit: limit,
            offset: offset,
          );

    return Future.wait(customers.map(_buildListEntry));
  }

  Future<CustomerDetail?> getCustomerDetail(String customerUuid) async {
    final customer = await _customerRepository.getByUuid(customerUuid);
    if (customer == null) {
      return null;
    }

    return CustomerDetail(
      customer: customer,
      addresses: await _customerRepository.listAddressesByCustomerUuid(
        customerUuid,
      ),
    );
  }

  Future<CustomerAddressesData?> getAddressByUuid(String addressUuid) {
    return _customerRepository.getAddressByUuid(addressUuid);
  }

  Future<Customer?> createCustomer(CreateCustomerInput input) async {
    final customerUuid = input.uuid ?? _uuid.v4();

    await _customerRepository.create(
      CustomersCompanion.insert(
        uuid: customerUuid,
        customerName: input.customerName.trim(),
        companyName: Value(_blankToNull(input.companyName)),
        department: Value(_blankToNull(input.department)),
        phone: Value(_blankToNull(input.phone)),
        wechat: Value(_blankToNull(input.wechat)),
        email: Value(_blankToNull(input.email)),
        customerType: Value(_normalCustomerType(input.customerType)),
        remark: Value(_blankToNull(input.remark)),
        deviceId: Value(_blankToNull(input.deviceId)),
      ),
    );

    await _auditLogService?.recordCreate(
      entityType: 'customer',
      entityUuid: customerUuid,
      newValue: {'customer_name': input.customerName.trim()},
      operatorName: input.operatorName,
      deviceId: input.deviceId,
      remark: 'Create customer',
    );

    return _customerRepository.getByUuid(customerUuid);
  }

  Future<bool> updateCustomer(
    String customerUuid,
    UpdateCustomerInput input,
  ) async {
    final oldCustomer = await _customerRepository.getByUuid(customerUuid);
    final updated = await _customerRepository.update(
      customerUuid,
      CustomersCompanion(
        customerName: Value(input.customerName.trim()),
        companyName: Value(_blankToNull(input.companyName)),
        department: Value(_blankToNull(input.department)),
        phone: Value(_blankToNull(input.phone)),
        wechat: Value(_blankToNull(input.wechat)),
        email: Value(_blankToNull(input.email)),
        customerType: Value(_normalCustomerType(input.customerType)),
        remark: Value(_blankToNull(input.remark)),
        deviceId: Value(_blankToNull(input.deviceId)),
      ),
    );

    if (updated) {
      await _auditLogService?.recordUpdate(
        entityType: 'customer',
        entityUuid: customerUuid,
        oldValue: _customerSnapshot(oldCustomer),
        newValue: _customerInputSnapshot(input),
        operatorName: input.operatorName,
        deviceId: input.deviceId,
        remark: 'Update customer',
      );
    }

    return updated;
  }

  Future<bool> softDeleteCustomer(
    String customerUuid, {
    String? operatorName,
    String? deviceId,
  }) async {
    final oldCustomer = await _customerRepository.getByUuid(customerUuid);
    final deleted = await _customerRepository.softDelete(customerUuid);

    if (deleted) {
      await _auditLogService?.recordDelete(
        entityType: 'customer',
        entityUuid: customerUuid,
        oldValue: _customerSnapshot(oldCustomer),
        operatorName: operatorName,
        deviceId: deviceId,
        remark: 'Soft delete customer',
      );
    }

    return deleted;
  }

  Future<CustomerAddressesData?> createAddress(
    CreateCustomerAddressInput input,
  ) async {
    final addressUuid = input.uuid ?? _uuid.v4();
    final existingAddresses = await _customerRepository
        .listAddressesByCustomerUuid(input.customerUuid);
    final shouldBeDefault = input.isDefault || existingAddresses.isEmpty;

    if (shouldBeDefault) {
      await _clearDefaultAddresses(input.customerUuid);
    }

    await _customerRepository.createAddress(
      CustomerAddressesCompanion.insert(
        uuid: addressUuid,
        customerUuid: input.customerUuid,
        recipientName: Value(_blankToNull(input.recipientName)),
        phone: Value(_blankToNull(input.phone)),
        province: Value(_blankToNull(input.province)),
        city: Value(_blankToNull(input.city)),
        district: Value(_blankToNull(input.district)),
        detailAddress: Value(_blankToNull(input.detailAddress)),
        recipientCompany: Value(_blankToNull(input.recipientCompany)),
        fullAddress: Value(
          _buildFullAddress(
            province: input.province,
            city: input.city,
            district: input.district,
            detailAddress: input.detailAddress,
          ),
        ),
        isDefault: Value(shouldBeDefault),
        remark: Value(_blankToNull(input.remark)),
        deviceId: Value(_blankToNull(input.deviceId)),
      ),
    );

    await _auditLogService?.recordCreate(
      entityType: 'customer_address',
      entityUuid: addressUuid,
      newValue: {'customer_uuid': input.customerUuid},
      operatorName: input.operatorName,
      deviceId: input.deviceId,
      remark: 'Create customer address',
    );

    return _customerRepository.getAddressByUuid(addressUuid);
  }

  Future<bool> updateAddress(
    String addressUuid,
    UpdateCustomerAddressInput input,
  ) async {
    final oldAddress = await _customerRepository.getAddressByUuid(addressUuid);
    if (oldAddress == null) {
      return false;
    }

    if (input.isDefault) {
      await _clearDefaultAddresses(oldAddress.customerUuid);
    }

    final updated = await _customerRepository.updateAddress(
      addressUuid,
      CustomerAddressesCompanion(
        recipientName: Value(_blankToNull(input.recipientName)),
        phone: Value(_blankToNull(input.phone)),
        province: Value(_blankToNull(input.province)),
        city: Value(_blankToNull(input.city)),
        district: Value(_blankToNull(input.district)),
        detailAddress: Value(_blankToNull(input.detailAddress)),
        recipientCompany: Value(_blankToNull(input.recipientCompany)),
        fullAddress: Value(
          _buildFullAddress(
            province: input.province,
            city: input.city,
            district: input.district,
            detailAddress: input.detailAddress,
          ),
        ),
        isDefault: Value(input.isDefault),
        remark: Value(_blankToNull(input.remark)),
        deviceId: Value(_blankToNull(input.deviceId)),
      ),
    );

    if (updated) {
      await _auditLogService?.recordUpdate(
        entityType: 'customer_address',
        entityUuid: addressUuid,
        oldValue: _addressSnapshot(oldAddress),
        newValue: _addressInputSnapshot(input),
        operatorName: input.operatorName,
        deviceId: input.deviceId,
        remark: 'Update customer address',
      );
    }

    return updated;
  }

  Future<bool> setDefaultAddress(
    String customerUuid,
    String addressUuid, {
    String? operatorName,
    String? deviceId,
  }) async {
    final address = await _customerRepository.getAddressByUuid(addressUuid);
    if (address == null || address.customerUuid != customerUuid) {
      return false;
    }

    await _clearDefaultAddresses(customerUuid);
    final updated = await _customerRepository.updateAddress(
      addressUuid,
      CustomerAddressesCompanion(isDefault: const Value(true)),
    );

    if (updated) {
      await _auditLogService?.recordUpdate(
        entityType: 'customer_address',
        entityUuid: addressUuid,
        oldValue: {'is_default': address.isDefault},
        newValue: {'is_default': true},
        operatorName: operatorName,
        deviceId: deviceId,
        remark: 'Set default customer address',
      );
    }

    return updated;
  }

  Future<bool> softDeleteAddress(
    String addressUuid, {
    String? operatorName,
    String? deviceId,
  }) async {
    final oldAddress = await _customerRepository.getAddressByUuid(addressUuid);
    final deleted = await _customerRepository.softDeleteAddress(addressUuid);

    if (deleted) {
      await _auditLogService?.recordDelete(
        entityType: 'customer_address',
        entityUuid: addressUuid,
        oldValue: _addressSnapshot(oldAddress),
        operatorName: operatorName,
        deviceId: deviceId,
        remark: 'Soft delete customer address',
      );
    }

    return deleted;
  }

  Future<void> _clearDefaultAddresses(String customerUuid) async {
    final addresses = await _customerRepository.listAddressesByCustomerUuid(
      customerUuid,
    );
    for (final address in addresses) {
      if (address.isDefault) {
        await _customerRepository.updateAddress(
          address.uuid,
          CustomerAddressesCompanion(isDefault: const Value(false)),
        );
      }
    }
  }

  Future<CustomerListEntry> _buildListEntry(Customer customer) async {
    final addresses = await _customerRepository.listAddressesByCustomerUuid(
      customer.uuid,
    );

    return CustomerListEntry(
      customer: customer,
      addressCount: addresses.length,
      defaultAddress: _findDefaultAddress(addresses),
    );
  }

  CustomerAddressesData? _findDefaultAddress(
    List<CustomerAddressesData> addresses,
  ) {
    for (final address in addresses) {
      if (address.isDefault) {
        return address;
      }
    }

    return null;
  }

  String _normalCustomerType(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? 'default' : trimmed;
  }

  String? _blankToNull(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  String? _buildFullAddress({
    String? province,
    String? city,
    String? district,
    String? detailAddress,
  }) {
    final parts = [
      province,
      city,
      district,
      detailAddress,
    ].map(_blankToNull).whereType<String>().toList();

    return parts.isEmpty ? null : parts.join(' ');
  }

  Map<String, Object?>? _customerSnapshot(Customer? customer) {
    if (customer == null) {
      return null;
    }

    return {
      'uuid': customer.uuid,
      'customer_name': customer.customerName,
      'phone': customer.phone,
      'company_name': customer.companyName,
      'department': customer.department,
      'customer_type': customer.customerType,
      'wechat': customer.wechat,
      'email': customer.email,
      'remark': customer.remark,
    };
  }

  Map<String, Object?> _customerInputSnapshot(UpdateCustomerInput input) {
    return {
      'customer_name': input.customerName,
      'phone': input.phone,
      'company_name': input.companyName,
      'department': input.department,
      'customer_type': input.customerType,
      'wechat': input.wechat,
      'email': input.email,
      'remark': input.remark,
    };
  }

  Map<String, Object?>? _addressSnapshot(CustomerAddressesData? address) {
    if (address == null) {
      return null;
    }

    return {
      'uuid': address.uuid,
      'customer_uuid': address.customerUuid,
      'recipient_name': address.recipientName,
      'phone': address.phone,
      'province': address.province,
      'city': address.city,
      'district': address.district,
      'detail_address': address.detailAddress,
      'recipient_company': address.recipientCompany,
      'is_default': address.isDefault,
      'remark': address.remark,
    };
  }

  Map<String, Object?> _addressInputSnapshot(UpdateCustomerAddressInput input) {
    return {
      'recipient_name': input.recipientName,
      'phone': input.phone,
      'province': input.province,
      'city': input.city,
      'district': input.district,
      'detail_address': input.detailAddress,
      'recipient_company': input.recipientCompany,
      'is_default': input.isDefault,
      'remark': input.remark,
    };
  }
}
