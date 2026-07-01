// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _customerNameMeta = const VerificationMeta(
    'customerName',
  );
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
    'customer_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 128,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _companyNameMeta = const VerificationMeta(
    'companyName',
  );
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
    'company_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contactNameMeta = const VerificationMeta(
    'contactName',
  );
  @override
  late final GeneratedColumn<String> contactName = GeneratedColumn<String>(
    'contact_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _departmentMeta = const VerificationMeta(
    'department',
  );
  @override
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
    'department',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _wechatMeta = const VerificationMeta('wechat');
  @override
  late final GeneratedColumn<String> wechat = GeneratedColumn<String>(
    'wechat',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _customerTypeMeta = const VerificationMeta(
    'customerType',
  );
  @override
  late final GeneratedColumn<String> customerType = GeneratedColumn<String>(
    'customer_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('default'),
  );
  static const VerificationMeta _taxNoMeta = const VerificationMeta('taxNo');
  @override
  late final GeneratedColumn<String> taxNo = GeneratedColumn<String>(
    'tax_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    customerName,
    companyName,
    contactName,
    department,
    phone,
    wechat,
    email,
    customerType,
    taxNo,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Customer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('customer_name')) {
      context.handle(
        _customerNameMeta,
        customerName.isAcceptableOrUnknown(
          data['customer_name']!,
          _customerNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_customerNameMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
        _companyNameMeta,
        companyName.isAcceptableOrUnknown(
          data['company_name']!,
          _companyNameMeta,
        ),
      );
    }
    if (data.containsKey('contact_name')) {
      context.handle(
        _contactNameMeta,
        contactName.isAcceptableOrUnknown(
          data['contact_name']!,
          _contactNameMeta,
        ),
      );
    }
    if (data.containsKey('department')) {
      context.handle(
        _departmentMeta,
        department.isAcceptableOrUnknown(data['department']!, _departmentMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('wechat')) {
      context.handle(
        _wechatMeta,
        wechat.isAcceptableOrUnknown(data['wechat']!, _wechatMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('customer_type')) {
      context.handle(
        _customerTypeMeta,
        customerType.isAcceptableOrUnknown(
          data['customer_type']!,
          _customerTypeMeta,
        ),
      );
    }
    if (data.containsKey('tax_no')) {
      context.handle(
        _taxNoMeta,
        taxNo.isAcceptableOrUnknown(data['tax_no']!, _taxNoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Customer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      customerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_name'],
      )!,
      companyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company_name'],
      ),
      contactName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_name'],
      ),
      department: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}department'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      wechat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wechat'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      customerType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_type'],
      )!,
      taxNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tax_no'],
      ),
    );
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class Customer extends DataClass implements Insertable<Customer> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String customerName;
  final String? companyName;
  final String? contactName;
  final String? department;
  final String? phone;
  final String? wechat;
  final String? email;
  final String customerType;
  final String? taxNo;
  const Customer({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.customerName,
    this.companyName,
    this.contactName,
    this.department,
    this.phone,
    this.wechat,
    this.email,
    required this.customerType,
    this.taxNo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['customer_name'] = Variable<String>(customerName);
    if (!nullToAbsent || companyName != null) {
      map['company_name'] = Variable<String>(companyName);
    }
    if (!nullToAbsent || contactName != null) {
      map['contact_name'] = Variable<String>(contactName);
    }
    if (!nullToAbsent || department != null) {
      map['department'] = Variable<String>(department);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || wechat != null) {
      map['wechat'] = Variable<String>(wechat);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['customer_type'] = Variable<String>(customerType);
    if (!nullToAbsent || taxNo != null) {
      map['tax_no'] = Variable<String>(taxNo);
    }
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      customerName: Value(customerName),
      companyName: companyName == null && nullToAbsent
          ? const Value.absent()
          : Value(companyName),
      contactName: contactName == null && nullToAbsent
          ? const Value.absent()
          : Value(contactName),
      department: department == null && nullToAbsent
          ? const Value.absent()
          : Value(department),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      wechat: wechat == null && nullToAbsent
          ? const Value.absent()
          : Value(wechat),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      customerType: Value(customerType),
      taxNo: taxNo == null && nullToAbsent
          ? const Value.absent()
          : Value(taxNo),
    );
  }

  factory Customer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Customer(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      customerName: serializer.fromJson<String>(json['customerName']),
      companyName: serializer.fromJson<String?>(json['companyName']),
      contactName: serializer.fromJson<String?>(json['contactName']),
      department: serializer.fromJson<String?>(json['department']),
      phone: serializer.fromJson<String?>(json['phone']),
      wechat: serializer.fromJson<String?>(json['wechat']),
      email: serializer.fromJson<String?>(json['email']),
      customerType: serializer.fromJson<String>(json['customerType']),
      taxNo: serializer.fromJson<String?>(json['taxNo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'customerName': serializer.toJson<String>(customerName),
      'companyName': serializer.toJson<String?>(companyName),
      'contactName': serializer.toJson<String?>(contactName),
      'department': serializer.toJson<String?>(department),
      'phone': serializer.toJson<String?>(phone),
      'wechat': serializer.toJson<String?>(wechat),
      'email': serializer.toJson<String?>(email),
      'customerType': serializer.toJson<String>(customerType),
      'taxNo': serializer.toJson<String?>(taxNo),
    };
  }

  Customer copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? customerName,
    Value<String?> companyName = const Value.absent(),
    Value<String?> contactName = const Value.absent(),
    Value<String?> department = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> wechat = const Value.absent(),
    Value<String?> email = const Value.absent(),
    String? customerType,
    Value<String?> taxNo = const Value.absent(),
  }) => Customer(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    customerName: customerName ?? this.customerName,
    companyName: companyName.present ? companyName.value : this.companyName,
    contactName: contactName.present ? contactName.value : this.contactName,
    department: department.present ? department.value : this.department,
    phone: phone.present ? phone.value : this.phone,
    wechat: wechat.present ? wechat.value : this.wechat,
    email: email.present ? email.value : this.email,
    customerType: customerType ?? this.customerType,
    taxNo: taxNo.present ? taxNo.value : this.taxNo,
  );
  Customer copyWithCompanion(CustomersCompanion data) {
    return Customer(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      customerName: data.customerName.present
          ? data.customerName.value
          : this.customerName,
      companyName: data.companyName.present
          ? data.companyName.value
          : this.companyName,
      contactName: data.contactName.present
          ? data.contactName.value
          : this.contactName,
      department: data.department.present
          ? data.department.value
          : this.department,
      phone: data.phone.present ? data.phone.value : this.phone,
      wechat: data.wechat.present ? data.wechat.value : this.wechat,
      email: data.email.present ? data.email.value : this.email,
      customerType: data.customerType.present
          ? data.customerType.value
          : this.customerType,
      taxNo: data.taxNo.present ? data.taxNo.value : this.taxNo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('customerName: $customerName, ')
          ..write('companyName: $companyName, ')
          ..write('contactName: $contactName, ')
          ..write('department: $department, ')
          ..write('phone: $phone, ')
          ..write('wechat: $wechat, ')
          ..write('email: $email, ')
          ..write('customerType: $customerType, ')
          ..write('taxNo: $taxNo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    customerName,
    companyName,
    contactName,
    department,
    phone,
    wechat,
    email,
    customerType,
    taxNo,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.customerName == this.customerName &&
          other.companyName == this.companyName &&
          other.contactName == this.contactName &&
          other.department == this.department &&
          other.phone == this.phone &&
          other.wechat == this.wechat &&
          other.email == this.email &&
          other.customerType == this.customerType &&
          other.taxNo == this.taxNo);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> customerName;
  final Value<String?> companyName;
  final Value<String?> contactName;
  final Value<String?> department;
  final Value<String?> phone;
  final Value<String?> wechat;
  final Value<String?> email;
  final Value<String> customerType;
  final Value<String?> taxNo;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.customerName = const Value.absent(),
    this.companyName = const Value.absent(),
    this.contactName = const Value.absent(),
    this.department = const Value.absent(),
    this.phone = const Value.absent(),
    this.wechat = const Value.absent(),
    this.email = const Value.absent(),
    this.customerType = const Value.absent(),
    this.taxNo = const Value.absent(),
  });
  CustomersCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String customerName,
    this.companyName = const Value.absent(),
    this.contactName = const Value.absent(),
    this.department = const Value.absent(),
    this.phone = const Value.absent(),
    this.wechat = const Value.absent(),
    this.email = const Value.absent(),
    this.customerType = const Value.absent(),
    this.taxNo = const Value.absent(),
  }) : uuid = Value(uuid),
       customerName = Value(customerName);
  static Insertable<Customer> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? customerName,
    Expression<String>? companyName,
    Expression<String>? contactName,
    Expression<String>? department,
    Expression<String>? phone,
    Expression<String>? wechat,
    Expression<String>? email,
    Expression<String>? customerType,
    Expression<String>? taxNo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (customerName != null) 'customer_name': customerName,
      if (companyName != null) 'company_name': companyName,
      if (contactName != null) 'contact_name': contactName,
      if (department != null) 'department': department,
      if (phone != null) 'phone': phone,
      if (wechat != null) 'wechat': wechat,
      if (email != null) 'email': email,
      if (customerType != null) 'customer_type': customerType,
      if (taxNo != null) 'tax_no': taxNo,
    });
  }

  CustomersCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? customerName,
    Value<String?>? companyName,
    Value<String?>? contactName,
    Value<String?>? department,
    Value<String?>? phone,
    Value<String?>? wechat,
    Value<String?>? email,
    Value<String>? customerType,
    Value<String?>? taxNo,
  }) {
    return CustomersCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      customerName: customerName ?? this.customerName,
      companyName: companyName ?? this.companyName,
      contactName: contactName ?? this.contactName,
      department: department ?? this.department,
      phone: phone ?? this.phone,
      wechat: wechat ?? this.wechat,
      email: email ?? this.email,
      customerType: customerType ?? this.customerType,
      taxNo: taxNo ?? this.taxNo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (contactName.present) {
      map['contact_name'] = Variable<String>(contactName.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (wechat.present) {
      map['wechat'] = Variable<String>(wechat.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (customerType.present) {
      map['customer_type'] = Variable<String>(customerType.value);
    }
    if (taxNo.present) {
      map['tax_no'] = Variable<String>(taxNo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('customerName: $customerName, ')
          ..write('companyName: $companyName, ')
          ..write('contactName: $contactName, ')
          ..write('department: $department, ')
          ..write('phone: $phone, ')
          ..write('wechat: $wechat, ')
          ..write('email: $email, ')
          ..write('customerType: $customerType, ')
          ..write('taxNo: $taxNo')
          ..write(')'))
        .toString();
  }
}

class $CustomerAddressesTable extends CustomerAddresses
    with TableInfo<$CustomerAddressesTable, CustomerAddressesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerAddressesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _customerUuidMeta = const VerificationMeta(
    'customerUuid',
  );
  @override
  late final GeneratedColumn<String> customerUuid = GeneratedColumn<String>(
    'customer_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recipientNameMeta = const VerificationMeta(
    'recipientName',
  );
  @override
  late final GeneratedColumn<String> recipientName = GeneratedColumn<String>(
    'recipient_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _provinceMeta = const VerificationMeta(
    'province',
  );
  @override
  late final GeneratedColumn<String> province = GeneratedColumn<String>(
    'province',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _districtMeta = const VerificationMeta(
    'district',
  );
  @override
  late final GeneratedColumn<String> district = GeneratedColumn<String>(
    'district',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _detailAddressMeta = const VerificationMeta(
    'detailAddress',
  );
  @override
  late final GeneratedColumn<String> detailAddress = GeneratedColumn<String>(
    'detail_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recipientCompanyMeta = const VerificationMeta(
    'recipientCompany',
  );
  @override
  late final GeneratedColumn<String> recipientCompany = GeneratedColumn<String>(
    'recipient_company',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fullAddressMeta = const VerificationMeta(
    'fullAddress',
  );
  @override
  late final GeneratedColumn<String> fullAddress = GeneratedColumn<String>(
    'full_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isDefaultMeta = const VerificationMeta(
    'isDefault',
  );
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
    'is_default',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_default" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    customerUuid,
    recipientName,
    phone,
    province,
    city,
    district,
    detailAddress,
    recipientCompany,
    fullAddress,
    isDefault,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customer_addresses';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomerAddressesData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('customer_uuid')) {
      context.handle(
        _customerUuidMeta,
        customerUuid.isAcceptableOrUnknown(
          data['customer_uuid']!,
          _customerUuidMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_customerUuidMeta);
    }
    if (data.containsKey('recipient_name')) {
      context.handle(
        _recipientNameMeta,
        recipientName.isAcceptableOrUnknown(
          data['recipient_name']!,
          _recipientNameMeta,
        ),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('province')) {
      context.handle(
        _provinceMeta,
        province.isAcceptableOrUnknown(data['province']!, _provinceMeta),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('district')) {
      context.handle(
        _districtMeta,
        district.isAcceptableOrUnknown(data['district']!, _districtMeta),
      );
    }
    if (data.containsKey('detail_address')) {
      context.handle(
        _detailAddressMeta,
        detailAddress.isAcceptableOrUnknown(
          data['detail_address']!,
          _detailAddressMeta,
        ),
      );
    }
    if (data.containsKey('recipient_company')) {
      context.handle(
        _recipientCompanyMeta,
        recipientCompany.isAcceptableOrUnknown(
          data['recipient_company']!,
          _recipientCompanyMeta,
        ),
      );
    }
    if (data.containsKey('full_address')) {
      context.handle(
        _fullAddressMeta,
        fullAddress.isAcceptableOrUnknown(
          data['full_address']!,
          _fullAddressMeta,
        ),
      );
    }
    if (data.containsKey('is_default')) {
      context.handle(
        _isDefaultMeta,
        isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerAddressesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerAddressesData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      customerUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_uuid'],
      )!,
      recipientName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipient_name'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      province: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}province'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      district: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}district'],
      ),
      detailAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}detail_address'],
      ),
      recipientCompany: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipient_company'],
      ),
      fullAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_address'],
      ),
      isDefault: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_default'],
      )!,
    );
  }

  @override
  $CustomerAddressesTable createAlias(String alias) {
    return $CustomerAddressesTable(attachedDatabase, alias);
  }
}

class CustomerAddressesData extends DataClass
    implements Insertable<CustomerAddressesData> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String customerUuid;
  final String? recipientName;
  final String? phone;
  final String? province;
  final String? city;
  final String? district;
  final String? detailAddress;
  final String? recipientCompany;
  final String? fullAddress;
  final bool isDefault;
  const CustomerAddressesData({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.customerUuid,
    this.recipientName,
    this.phone,
    this.province,
    this.city,
    this.district,
    this.detailAddress,
    this.recipientCompany,
    this.fullAddress,
    required this.isDefault,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['customer_uuid'] = Variable<String>(customerUuid);
    if (!nullToAbsent || recipientName != null) {
      map['recipient_name'] = Variable<String>(recipientName);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || province != null) {
      map['province'] = Variable<String>(province);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || district != null) {
      map['district'] = Variable<String>(district);
    }
    if (!nullToAbsent || detailAddress != null) {
      map['detail_address'] = Variable<String>(detailAddress);
    }
    if (!nullToAbsent || recipientCompany != null) {
      map['recipient_company'] = Variable<String>(recipientCompany);
    }
    if (!nullToAbsent || fullAddress != null) {
      map['full_address'] = Variable<String>(fullAddress);
    }
    map['is_default'] = Variable<bool>(isDefault);
    return map;
  }

  CustomerAddressesCompanion toCompanion(bool nullToAbsent) {
    return CustomerAddressesCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      customerUuid: Value(customerUuid),
      recipientName: recipientName == null && nullToAbsent
          ? const Value.absent()
          : Value(recipientName),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      province: province == null && nullToAbsent
          ? const Value.absent()
          : Value(province),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      district: district == null && nullToAbsent
          ? const Value.absent()
          : Value(district),
      detailAddress: detailAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(detailAddress),
      recipientCompany: recipientCompany == null && nullToAbsent
          ? const Value.absent()
          : Value(recipientCompany),
      fullAddress: fullAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(fullAddress),
      isDefault: Value(isDefault),
    );
  }

  factory CustomerAddressesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerAddressesData(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      customerUuid: serializer.fromJson<String>(json['customerUuid']),
      recipientName: serializer.fromJson<String?>(json['recipientName']),
      phone: serializer.fromJson<String?>(json['phone']),
      province: serializer.fromJson<String?>(json['province']),
      city: serializer.fromJson<String?>(json['city']),
      district: serializer.fromJson<String?>(json['district']),
      detailAddress: serializer.fromJson<String?>(json['detailAddress']),
      recipientCompany: serializer.fromJson<String?>(json['recipientCompany']),
      fullAddress: serializer.fromJson<String?>(json['fullAddress']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'customerUuid': serializer.toJson<String>(customerUuid),
      'recipientName': serializer.toJson<String?>(recipientName),
      'phone': serializer.toJson<String?>(phone),
      'province': serializer.toJson<String?>(province),
      'city': serializer.toJson<String?>(city),
      'district': serializer.toJson<String?>(district),
      'detailAddress': serializer.toJson<String?>(detailAddress),
      'recipientCompany': serializer.toJson<String?>(recipientCompany),
      'fullAddress': serializer.toJson<String?>(fullAddress),
      'isDefault': serializer.toJson<bool>(isDefault),
    };
  }

  CustomerAddressesData copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? customerUuid,
    Value<String?> recipientName = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> province = const Value.absent(),
    Value<String?> city = const Value.absent(),
    Value<String?> district = const Value.absent(),
    Value<String?> detailAddress = const Value.absent(),
    Value<String?> recipientCompany = const Value.absent(),
    Value<String?> fullAddress = const Value.absent(),
    bool? isDefault,
  }) => CustomerAddressesData(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    customerUuid: customerUuid ?? this.customerUuid,
    recipientName: recipientName.present
        ? recipientName.value
        : this.recipientName,
    phone: phone.present ? phone.value : this.phone,
    province: province.present ? province.value : this.province,
    city: city.present ? city.value : this.city,
    district: district.present ? district.value : this.district,
    detailAddress: detailAddress.present
        ? detailAddress.value
        : this.detailAddress,
    recipientCompany: recipientCompany.present
        ? recipientCompany.value
        : this.recipientCompany,
    fullAddress: fullAddress.present ? fullAddress.value : this.fullAddress,
    isDefault: isDefault ?? this.isDefault,
  );
  CustomerAddressesData copyWithCompanion(CustomerAddressesCompanion data) {
    return CustomerAddressesData(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      customerUuid: data.customerUuid.present
          ? data.customerUuid.value
          : this.customerUuid,
      recipientName: data.recipientName.present
          ? data.recipientName.value
          : this.recipientName,
      phone: data.phone.present ? data.phone.value : this.phone,
      province: data.province.present ? data.province.value : this.province,
      city: data.city.present ? data.city.value : this.city,
      district: data.district.present ? data.district.value : this.district,
      detailAddress: data.detailAddress.present
          ? data.detailAddress.value
          : this.detailAddress,
      recipientCompany: data.recipientCompany.present
          ? data.recipientCompany.value
          : this.recipientCompany,
      fullAddress: data.fullAddress.present
          ? data.fullAddress.value
          : this.fullAddress,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerAddressesData(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('customerUuid: $customerUuid, ')
          ..write('recipientName: $recipientName, ')
          ..write('phone: $phone, ')
          ..write('province: $province, ')
          ..write('city: $city, ')
          ..write('district: $district, ')
          ..write('detailAddress: $detailAddress, ')
          ..write('recipientCompany: $recipientCompany, ')
          ..write('fullAddress: $fullAddress, ')
          ..write('isDefault: $isDefault')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    customerUuid,
    recipientName,
    phone,
    province,
    city,
    district,
    detailAddress,
    recipientCompany,
    fullAddress,
    isDefault,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerAddressesData &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.customerUuid == this.customerUuid &&
          other.recipientName == this.recipientName &&
          other.phone == this.phone &&
          other.province == this.province &&
          other.city == this.city &&
          other.district == this.district &&
          other.detailAddress == this.detailAddress &&
          other.recipientCompany == this.recipientCompany &&
          other.fullAddress == this.fullAddress &&
          other.isDefault == this.isDefault);
}

class CustomerAddressesCompanion
    extends UpdateCompanion<CustomerAddressesData> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> customerUuid;
  final Value<String?> recipientName;
  final Value<String?> phone;
  final Value<String?> province;
  final Value<String?> city;
  final Value<String?> district;
  final Value<String?> detailAddress;
  final Value<String?> recipientCompany;
  final Value<String?> fullAddress;
  final Value<bool> isDefault;
  const CustomerAddressesCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.customerUuid = const Value.absent(),
    this.recipientName = const Value.absent(),
    this.phone = const Value.absent(),
    this.province = const Value.absent(),
    this.city = const Value.absent(),
    this.district = const Value.absent(),
    this.detailAddress = const Value.absent(),
    this.recipientCompany = const Value.absent(),
    this.fullAddress = const Value.absent(),
    this.isDefault = const Value.absent(),
  });
  CustomerAddressesCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String customerUuid,
    this.recipientName = const Value.absent(),
    this.phone = const Value.absent(),
    this.province = const Value.absent(),
    this.city = const Value.absent(),
    this.district = const Value.absent(),
    this.detailAddress = const Value.absent(),
    this.recipientCompany = const Value.absent(),
    this.fullAddress = const Value.absent(),
    this.isDefault = const Value.absent(),
  }) : uuid = Value(uuid),
       customerUuid = Value(customerUuid);
  static Insertable<CustomerAddressesData> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? customerUuid,
    Expression<String>? recipientName,
    Expression<String>? phone,
    Expression<String>? province,
    Expression<String>? city,
    Expression<String>? district,
    Expression<String>? detailAddress,
    Expression<String>? recipientCompany,
    Expression<String>? fullAddress,
    Expression<bool>? isDefault,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (customerUuid != null) 'customer_uuid': customerUuid,
      if (recipientName != null) 'recipient_name': recipientName,
      if (phone != null) 'phone': phone,
      if (province != null) 'province': province,
      if (city != null) 'city': city,
      if (district != null) 'district': district,
      if (detailAddress != null) 'detail_address': detailAddress,
      if (recipientCompany != null) 'recipient_company': recipientCompany,
      if (fullAddress != null) 'full_address': fullAddress,
      if (isDefault != null) 'is_default': isDefault,
    });
  }

  CustomerAddressesCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? customerUuid,
    Value<String?>? recipientName,
    Value<String?>? phone,
    Value<String?>? province,
    Value<String?>? city,
    Value<String?>? district,
    Value<String?>? detailAddress,
    Value<String?>? recipientCompany,
    Value<String?>? fullAddress,
    Value<bool>? isDefault,
  }) {
    return CustomerAddressesCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      customerUuid: customerUuid ?? this.customerUuid,
      recipientName: recipientName ?? this.recipientName,
      phone: phone ?? this.phone,
      province: province ?? this.province,
      city: city ?? this.city,
      district: district ?? this.district,
      detailAddress: detailAddress ?? this.detailAddress,
      recipientCompany: recipientCompany ?? this.recipientCompany,
      fullAddress: fullAddress ?? this.fullAddress,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (customerUuid.present) {
      map['customer_uuid'] = Variable<String>(customerUuid.value);
    }
    if (recipientName.present) {
      map['recipient_name'] = Variable<String>(recipientName.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (province.present) {
      map['province'] = Variable<String>(province.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (district.present) {
      map['district'] = Variable<String>(district.value);
    }
    if (detailAddress.present) {
      map['detail_address'] = Variable<String>(detailAddress.value);
    }
    if (recipientCompany.present) {
      map['recipient_company'] = Variable<String>(recipientCompany.value);
    }
    if (fullAddress.present) {
      map['full_address'] = Variable<String>(fullAddress.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerAddressesCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('customerUuid: $customerUuid, ')
          ..write('recipientName: $recipientName, ')
          ..write('phone: $phone, ')
          ..write('province: $province, ')
          ..write('city: $city, ')
          ..write('district: $district, ')
          ..write('detailAddress: $detailAddress, ')
          ..write('recipientCompany: $recipientCompany, ')
          ..write('fullAddress: $fullAddress, ')
          ..write('isDefault: $isDefault')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productNameMeta = const VerificationMeta(
    'productName',
  );
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
    'product_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 160,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productCodeMeta = const VerificationMeta(
    'productCode',
  );
  @override
  late final GeneratedColumn<String> productCode = GeneratedColumn<String>(
    'product_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productTypeMeta = const VerificationMeta(
    'productType',
  );
  @override
  late final GeneratedColumn<String> productType = GeneratedColumn<String>(
    'product_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('material'),
  );
  static const VerificationMeta _specificationMeta = const VerificationMeta(
    'specification',
  );
  @override
  late final GeneratedColumn<String> specification = GeneratedColumn<String>(
    'specification',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityUnitMeta = const VerificationMeta(
    'quantityUnit',
  );
  @override
  late final GeneratedColumn<String> quantityUnit = GeneratedColumn<String>(
    'quantity_unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _materialCategoryMeta = const VerificationMeta(
    'materialCategory',
  );
  @override
  late final GeneratedColumn<String> materialCategory = GeneratedColumn<String>(
    'material_category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    productName,
    productCode,
    productType,
    specification,
    quantityUnit,
    materialCategory,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('product_name')) {
      context.handle(
        _productNameMeta,
        productName.isAcceptableOrUnknown(
          data['product_name']!,
          _productNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('product_code')) {
      context.handle(
        _productCodeMeta,
        productCode.isAcceptableOrUnknown(
          data['product_code']!,
          _productCodeMeta,
        ),
      );
    }
    if (data.containsKey('product_type')) {
      context.handle(
        _productTypeMeta,
        productType.isAcceptableOrUnknown(
          data['product_type']!,
          _productTypeMeta,
        ),
      );
    }
    if (data.containsKey('specification')) {
      context.handle(
        _specificationMeta,
        specification.isAcceptableOrUnknown(
          data['specification']!,
          _specificationMeta,
        ),
      );
    }
    if (data.containsKey('quantity_unit')) {
      context.handle(
        _quantityUnitMeta,
        quantityUnit.isAcceptableOrUnknown(
          data['quantity_unit']!,
          _quantityUnitMeta,
        ),
      );
    }
    if (data.containsKey('material_category')) {
      context.handle(
        _materialCategoryMeta,
        materialCategory.isAcceptableOrUnknown(
          data['material_category']!,
          _materialCategoryMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      productName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_name'],
      )!,
      productCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_code'],
      ),
      productType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_type'],
      )!,
      specification: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specification'],
      ),
      quantityUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quantity_unit'],
      ),
      materialCategory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material_category'],
      ),
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String productName;
  final String? productCode;
  final String productType;
  final String? specification;
  final String? quantityUnit;
  final String? materialCategory;
  const Product({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.productName,
    this.productCode,
    required this.productType,
    this.specification,
    this.quantityUnit,
    this.materialCategory,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['product_name'] = Variable<String>(productName);
    if (!nullToAbsent || productCode != null) {
      map['product_code'] = Variable<String>(productCode);
    }
    map['product_type'] = Variable<String>(productType);
    if (!nullToAbsent || specification != null) {
      map['specification'] = Variable<String>(specification);
    }
    if (!nullToAbsent || quantityUnit != null) {
      map['quantity_unit'] = Variable<String>(quantityUnit);
    }
    if (!nullToAbsent || materialCategory != null) {
      map['material_category'] = Variable<String>(materialCategory);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      productName: Value(productName),
      productCode: productCode == null && nullToAbsent
          ? const Value.absent()
          : Value(productCode),
      productType: Value(productType),
      specification: specification == null && nullToAbsent
          ? const Value.absent()
          : Value(specification),
      quantityUnit: quantityUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(quantityUnit),
      materialCategory: materialCategory == null && nullToAbsent
          ? const Value.absent()
          : Value(materialCategory),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      productName: serializer.fromJson<String>(json['productName']),
      productCode: serializer.fromJson<String?>(json['productCode']),
      productType: serializer.fromJson<String>(json['productType']),
      specification: serializer.fromJson<String?>(json['specification']),
      quantityUnit: serializer.fromJson<String?>(json['quantityUnit']),
      materialCategory: serializer.fromJson<String?>(json['materialCategory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'productName': serializer.toJson<String>(productName),
      'productCode': serializer.toJson<String?>(productCode),
      'productType': serializer.toJson<String>(productType),
      'specification': serializer.toJson<String?>(specification),
      'quantityUnit': serializer.toJson<String?>(quantityUnit),
      'materialCategory': serializer.toJson<String?>(materialCategory),
    };
  }

  Product copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? productName,
    Value<String?> productCode = const Value.absent(),
    String? productType,
    Value<String?> specification = const Value.absent(),
    Value<String?> quantityUnit = const Value.absent(),
    Value<String?> materialCategory = const Value.absent(),
  }) => Product(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    productName: productName ?? this.productName,
    productCode: productCode.present ? productCode.value : this.productCode,
    productType: productType ?? this.productType,
    specification: specification.present
        ? specification.value
        : this.specification,
    quantityUnit: quantityUnit.present ? quantityUnit.value : this.quantityUnit,
    materialCategory: materialCategory.present
        ? materialCategory.value
        : this.materialCategory,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      productName: data.productName.present
          ? data.productName.value
          : this.productName,
      productCode: data.productCode.present
          ? data.productCode.value
          : this.productCode,
      productType: data.productType.present
          ? data.productType.value
          : this.productType,
      specification: data.specification.present
          ? data.specification.value
          : this.specification,
      quantityUnit: data.quantityUnit.present
          ? data.quantityUnit.value
          : this.quantityUnit,
      materialCategory: data.materialCategory.present
          ? data.materialCategory.value
          : this.materialCategory,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('productName: $productName, ')
          ..write('productCode: $productCode, ')
          ..write('productType: $productType, ')
          ..write('specification: $specification, ')
          ..write('quantityUnit: $quantityUnit, ')
          ..write('materialCategory: $materialCategory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    productName,
    productCode,
    productType,
    specification,
    quantityUnit,
    materialCategory,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.productName == this.productName &&
          other.productCode == this.productCode &&
          other.productType == this.productType &&
          other.specification == this.specification &&
          other.quantityUnit == this.quantityUnit &&
          other.materialCategory == this.materialCategory);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> productName;
  final Value<String?> productCode;
  final Value<String> productType;
  final Value<String?> specification;
  final Value<String?> quantityUnit;
  final Value<String?> materialCategory;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.productName = const Value.absent(),
    this.productCode = const Value.absent(),
    this.productType = const Value.absent(),
    this.specification = const Value.absent(),
    this.quantityUnit = const Value.absent(),
    this.materialCategory = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String productName,
    this.productCode = const Value.absent(),
    this.productType = const Value.absent(),
    this.specification = const Value.absent(),
    this.quantityUnit = const Value.absent(),
    this.materialCategory = const Value.absent(),
  }) : uuid = Value(uuid),
       productName = Value(productName);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? productName,
    Expression<String>? productCode,
    Expression<String>? productType,
    Expression<String>? specification,
    Expression<String>? quantityUnit,
    Expression<String>? materialCategory,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (productName != null) 'product_name': productName,
      if (productCode != null) 'product_code': productCode,
      if (productType != null) 'product_type': productType,
      if (specification != null) 'specification': specification,
      if (quantityUnit != null) 'quantity_unit': quantityUnit,
      if (materialCategory != null) 'material_category': materialCategory,
    });
  }

  ProductsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? productName,
    Value<String?>? productCode,
    Value<String>? productType,
    Value<String?>? specification,
    Value<String?>? quantityUnit,
    Value<String?>? materialCategory,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      productName: productName ?? this.productName,
      productCode: productCode ?? this.productCode,
      productType: productType ?? this.productType,
      specification: specification ?? this.specification,
      quantityUnit: quantityUnit ?? this.quantityUnit,
      materialCategory: materialCategory ?? this.materialCategory,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (productCode.present) {
      map['product_code'] = Variable<String>(productCode.value);
    }
    if (productType.present) {
      map['product_type'] = Variable<String>(productType.value);
    }
    if (specification.present) {
      map['specification'] = Variable<String>(specification.value);
    }
    if (quantityUnit.present) {
      map['quantity_unit'] = Variable<String>(quantityUnit.value);
    }
    if (materialCategory.present) {
      map['material_category'] = Variable<String>(materialCategory.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('productName: $productName, ')
          ..write('productCode: $productCode, ')
          ..write('productType: $productType, ')
          ..write('specification: $specification, ')
          ..write('quantityUnit: $quantityUnit, ')
          ..write('materialCategory: $materialCategory')
          ..write(')'))
        .toString();
  }
}

class $ProductElementsTable extends ProductElements
    with TableInfo<$ProductElementsTable, ProductElement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductElementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productUuidMeta = const VerificationMeta(
    'productUuid',
  );
  @override
  late final GeneratedColumn<String> productUuid = GeneratedColumn<String>(
    'product_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _elementSymbolMeta = const VerificationMeta(
    'elementSymbol',
  );
  @override
  late final GeneratedColumn<String> elementSymbol = GeneratedColumn<String>(
    'element_symbol',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _elementNameMeta = const VerificationMeta(
    'elementName',
  );
  @override
  late final GeneratedColumn<String> elementName = GeneratedColumn<String>(
    'element_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ratioTextMeta = const VerificationMeta(
    'ratioText',
  );
  @override
  late final GeneratedColumn<String> ratioText = GeneratedColumn<String>(
    'ratio_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    productUuid,
    elementSymbol,
    elementName,
    ratioText,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_elements';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductElement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('product_uuid')) {
      context.handle(
        _productUuidMeta,
        productUuid.isAcceptableOrUnknown(
          data['product_uuid']!,
          _productUuidMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productUuidMeta);
    }
    if (data.containsKey('element_symbol')) {
      context.handle(
        _elementSymbolMeta,
        elementSymbol.isAcceptableOrUnknown(
          data['element_symbol']!,
          _elementSymbolMeta,
        ),
      );
    }
    if (data.containsKey('element_name')) {
      context.handle(
        _elementNameMeta,
        elementName.isAcceptableOrUnknown(
          data['element_name']!,
          _elementNameMeta,
        ),
      );
    }
    if (data.containsKey('ratio_text')) {
      context.handle(
        _ratioTextMeta,
        ratioText.isAcceptableOrUnknown(data['ratio_text']!, _ratioTextMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductElement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductElement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      productUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_uuid'],
      )!,
      elementSymbol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}element_symbol'],
      ),
      elementName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}element_name'],
      ),
      ratioText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ratio_text'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $ProductElementsTable createAlias(String alias) {
    return $ProductElementsTable(attachedDatabase, alias);
  }
}

class ProductElement extends DataClass implements Insertable<ProductElement> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String productUuid;
  final String? elementSymbol;
  final String? elementName;
  final String? ratioText;
  final int sortOrder;
  const ProductElement({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.productUuid,
    this.elementSymbol,
    this.elementName,
    this.ratioText,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['product_uuid'] = Variable<String>(productUuid);
    if (!nullToAbsent || elementSymbol != null) {
      map['element_symbol'] = Variable<String>(elementSymbol);
    }
    if (!nullToAbsent || elementName != null) {
      map['element_name'] = Variable<String>(elementName);
    }
    if (!nullToAbsent || ratioText != null) {
      map['ratio_text'] = Variable<String>(ratioText);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  ProductElementsCompanion toCompanion(bool nullToAbsent) {
    return ProductElementsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      productUuid: Value(productUuid),
      elementSymbol: elementSymbol == null && nullToAbsent
          ? const Value.absent()
          : Value(elementSymbol),
      elementName: elementName == null && nullToAbsent
          ? const Value.absent()
          : Value(elementName),
      ratioText: ratioText == null && nullToAbsent
          ? const Value.absent()
          : Value(ratioText),
      sortOrder: Value(sortOrder),
    );
  }

  factory ProductElement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductElement(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      productUuid: serializer.fromJson<String>(json['productUuid']),
      elementSymbol: serializer.fromJson<String?>(json['elementSymbol']),
      elementName: serializer.fromJson<String?>(json['elementName']),
      ratioText: serializer.fromJson<String?>(json['ratioText']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'productUuid': serializer.toJson<String>(productUuid),
      'elementSymbol': serializer.toJson<String?>(elementSymbol),
      'elementName': serializer.toJson<String?>(elementName),
      'ratioText': serializer.toJson<String?>(ratioText),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  ProductElement copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? productUuid,
    Value<String?> elementSymbol = const Value.absent(),
    Value<String?> elementName = const Value.absent(),
    Value<String?> ratioText = const Value.absent(),
    int? sortOrder,
  }) => ProductElement(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    productUuid: productUuid ?? this.productUuid,
    elementSymbol: elementSymbol.present
        ? elementSymbol.value
        : this.elementSymbol,
    elementName: elementName.present ? elementName.value : this.elementName,
    ratioText: ratioText.present ? ratioText.value : this.ratioText,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  ProductElement copyWithCompanion(ProductElementsCompanion data) {
    return ProductElement(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      productUuid: data.productUuid.present
          ? data.productUuid.value
          : this.productUuid,
      elementSymbol: data.elementSymbol.present
          ? data.elementSymbol.value
          : this.elementSymbol,
      elementName: data.elementName.present
          ? data.elementName.value
          : this.elementName,
      ratioText: data.ratioText.present ? data.ratioText.value : this.ratioText,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductElement(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('productUuid: $productUuid, ')
          ..write('elementSymbol: $elementSymbol, ')
          ..write('elementName: $elementName, ')
          ..write('ratioText: $ratioText, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    productUuid,
    elementSymbol,
    elementName,
    ratioText,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductElement &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.productUuid == this.productUuid &&
          other.elementSymbol == this.elementSymbol &&
          other.elementName == this.elementName &&
          other.ratioText == this.ratioText &&
          other.sortOrder == this.sortOrder);
}

class ProductElementsCompanion extends UpdateCompanion<ProductElement> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> productUuid;
  final Value<String?> elementSymbol;
  final Value<String?> elementName;
  final Value<String?> ratioText;
  final Value<int> sortOrder;
  const ProductElementsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.elementSymbol = const Value.absent(),
    this.elementName = const Value.absent(),
    this.ratioText = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  ProductElementsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String productUuid,
    this.elementSymbol = const Value.absent(),
    this.elementName = const Value.absent(),
    this.ratioText = const Value.absent(),
    this.sortOrder = const Value.absent(),
  }) : uuid = Value(uuid),
       productUuid = Value(productUuid);
  static Insertable<ProductElement> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? productUuid,
    Expression<String>? elementSymbol,
    Expression<String>? elementName,
    Expression<String>? ratioText,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (productUuid != null) 'product_uuid': productUuid,
      if (elementSymbol != null) 'element_symbol': elementSymbol,
      if (elementName != null) 'element_name': elementName,
      if (ratioText != null) 'ratio_text': ratioText,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  ProductElementsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? productUuid,
    Value<String?>? elementSymbol,
    Value<String?>? elementName,
    Value<String?>? ratioText,
    Value<int>? sortOrder,
  }) {
    return ProductElementsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      productUuid: productUuid ?? this.productUuid,
      elementSymbol: elementSymbol ?? this.elementSymbol,
      elementName: elementName ?? this.elementName,
      ratioText: ratioText ?? this.ratioText,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (productUuid.present) {
      map['product_uuid'] = Variable<String>(productUuid.value);
    }
    if (elementSymbol.present) {
      map['element_symbol'] = Variable<String>(elementSymbol.value);
    }
    if (elementName.present) {
      map['element_name'] = Variable<String>(elementName.value);
    }
    if (ratioText.present) {
      map['ratio_text'] = Variable<String>(ratioText.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductElementsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('productUuid: $productUuid, ')
          ..write('elementSymbol: $elementSymbol, ')
          ..write('elementName: $elementName, ')
          ..write('ratioText: $ratioText, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

class $SuppliersTable extends Suppliers
    with TableInfo<$SuppliersTable, Supplier> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SuppliersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _supplierNameMeta = const VerificationMeta(
    'supplierName',
  );
  @override
  late final GeneratedColumn<String> supplierName = GeneratedColumn<String>(
    'supplier_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 160,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supplierTypeMeta = const VerificationMeta(
    'supplierType',
  );
  @override
  late final GeneratedColumn<String> supplierType = GeneratedColumn<String>(
    'supplier_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('default'),
  );
  static const VerificationMeta _contactNameMeta = const VerificationMeta(
    'contactName',
  );
  @override
  late final GeneratedColumn<String> contactName = GeneratedColumn<String>(
    'contact_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    supplierName,
    supplierType,
    contactName,
    phone,
    email,
    address,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'suppliers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Supplier> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('supplier_name')) {
      context.handle(
        _supplierNameMeta,
        supplierName.isAcceptableOrUnknown(
          data['supplier_name']!,
          _supplierNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_supplierNameMeta);
    }
    if (data.containsKey('supplier_type')) {
      context.handle(
        _supplierTypeMeta,
        supplierType.isAcceptableOrUnknown(
          data['supplier_type']!,
          _supplierTypeMeta,
        ),
      );
    }
    if (data.containsKey('contact_name')) {
      context.handle(
        _contactNameMeta,
        contactName.isAcceptableOrUnknown(
          data['contact_name']!,
          _contactNameMeta,
        ),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Supplier map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Supplier(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      supplierName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supplier_name'],
      )!,
      supplierType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supplier_type'],
      )!,
      contactName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_name'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
    );
  }

  @override
  $SuppliersTable createAlias(String alias) {
    return $SuppliersTable(attachedDatabase, alias);
  }
}

class Supplier extends DataClass implements Insertable<Supplier> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String supplierName;
  final String supplierType;
  final String? contactName;
  final String? phone;
  final String? email;
  final String? address;
  const Supplier({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.supplierName,
    required this.supplierType,
    this.contactName,
    this.phone,
    this.email,
    this.address,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['supplier_name'] = Variable<String>(supplierName);
    map['supplier_type'] = Variable<String>(supplierType);
    if (!nullToAbsent || contactName != null) {
      map['contact_name'] = Variable<String>(contactName);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    return map;
  }

  SuppliersCompanion toCompanion(bool nullToAbsent) {
    return SuppliersCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      supplierName: Value(supplierName),
      supplierType: Value(supplierType),
      contactName: contactName == null && nullToAbsent
          ? const Value.absent()
          : Value(contactName),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
    );
  }

  factory Supplier.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Supplier(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      supplierName: serializer.fromJson<String>(json['supplierName']),
      supplierType: serializer.fromJson<String>(json['supplierType']),
      contactName: serializer.fromJson<String?>(json['contactName']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      address: serializer.fromJson<String?>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'supplierName': serializer.toJson<String>(supplierName),
      'supplierType': serializer.toJson<String>(supplierType),
      'contactName': serializer.toJson<String?>(contactName),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'address': serializer.toJson<String?>(address),
    };
  }

  Supplier copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? supplierName,
    String? supplierType,
    Value<String?> contactName = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> address = const Value.absent(),
  }) => Supplier(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    supplierName: supplierName ?? this.supplierName,
    supplierType: supplierType ?? this.supplierType,
    contactName: contactName.present ? contactName.value : this.contactName,
    phone: phone.present ? phone.value : this.phone,
    email: email.present ? email.value : this.email,
    address: address.present ? address.value : this.address,
  );
  Supplier copyWithCompanion(SuppliersCompanion data) {
    return Supplier(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      supplierName: data.supplierName.present
          ? data.supplierName.value
          : this.supplierName,
      supplierType: data.supplierType.present
          ? data.supplierType.value
          : this.supplierType,
      contactName: data.contactName.present
          ? data.contactName.value
          : this.contactName,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      address: data.address.present ? data.address.value : this.address,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Supplier(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('supplierName: $supplierName, ')
          ..write('supplierType: $supplierType, ')
          ..write('contactName: $contactName, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    supplierName,
    supplierType,
    contactName,
    phone,
    email,
    address,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Supplier &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.supplierName == this.supplierName &&
          other.supplierType == this.supplierType &&
          other.contactName == this.contactName &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.address == this.address);
}

class SuppliersCompanion extends UpdateCompanion<Supplier> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> supplierName;
  final Value<String> supplierType;
  final Value<String?> contactName;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> address;
  const SuppliersCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.supplierName = const Value.absent(),
    this.supplierType = const Value.absent(),
    this.contactName = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
  });
  SuppliersCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String supplierName,
    this.supplierType = const Value.absent(),
    this.contactName = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
  }) : uuid = Value(uuid),
       supplierName = Value(supplierName);
  static Insertable<Supplier> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? supplierName,
    Expression<String>? supplierType,
    Expression<String>? contactName,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? address,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (supplierName != null) 'supplier_name': supplierName,
      if (supplierType != null) 'supplier_type': supplierType,
      if (contactName != null) 'contact_name': contactName,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
    });
  }

  SuppliersCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? supplierName,
    Value<String>? supplierType,
    Value<String?>? contactName,
    Value<String?>? phone,
    Value<String?>? email,
    Value<String?>? address,
  }) {
    return SuppliersCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      supplierName: supplierName ?? this.supplierName,
      supplierType: supplierType ?? this.supplierType,
      contactName: contactName ?? this.contactName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (supplierName.present) {
      map['supplier_name'] = Variable<String>(supplierName.value);
    }
    if (supplierType.present) {
      map['supplier_type'] = Variable<String>(supplierType.value);
    }
    if (contactName.present) {
      map['contact_name'] = Variable<String>(contactName.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SuppliersCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('supplierName: $supplierName, ')
          ..write('supplierType: $supplierType, ')
          ..write('contactName: $contactName, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }
}

class $SalesOrdersTable extends SalesOrders
    with TableInfo<$SalesOrdersTable, SalesOrder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesOrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderNoMeta = const VerificationMeta(
    'orderNo',
  );
  @override
  late final GeneratedColumn<String> orderNo = GeneratedColumn<String>(
    'order_no',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 96,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _customerUuidMeta = const VerificationMeta(
    'customerUuid',
  );
  @override
  late final GeneratedColumn<String> customerUuid = GeneratedColumn<String>(
    'customer_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderDateMeta = const VerificationMeta(
    'orderDate',
  );
  @override
  late final GeneratedColumn<DateTime> orderDate = GeneratedColumn<DateTime>(
    'order_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderStatusMeta = const VerificationMeta(
    'orderStatus',
  );
  @override
  late final GeneratedColumn<String> orderStatus = GeneratedColumn<String>(
    'order_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  static const VerificationMeta _paymentStatusMeta = const VerificationMeta(
    'paymentStatus',
  );
  @override
  late final GeneratedColumn<String> paymentStatus = GeneratedColumn<String>(
    'payment_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unpaid'),
  );
  static const VerificationMeta _invoiceStatusMeta = const VerificationMeta(
    'invoiceStatus',
  );
  @override
  late final GeneratedColumn<String> invoiceStatus = GeneratedColumn<String>(
    'invoice_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('none'),
  );
  static const VerificationMeta _totalSaleAmountMeta = const VerificationMeta(
    'totalSaleAmount',
  );
  @override
  late final GeneratedColumn<int> totalSaleAmount = GeneratedColumn<int>(
    'total_sale_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalCostAmountMeta = const VerificationMeta(
    'totalCostAmount',
  );
  @override
  late final GeneratedColumn<int> totalCostAmount = GeneratedColumn<int>(
    'total_cost_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalProfitAmountMeta = const VerificationMeta(
    'totalProfitAmount',
  );
  @override
  late final GeneratedColumn<int> totalProfitAmount = GeneratedColumn<int>(
    'total_profit_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    orderNo,
    customerUuid,
    orderDate,
    orderStatus,
    paymentStatus,
    invoiceStatus,
    totalSaleAmount,
    totalCostAmount,
    totalProfitAmount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales_orders';
  @override
  VerificationContext validateIntegrity(
    Insertable<SalesOrder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('order_no')) {
      context.handle(
        _orderNoMeta,
        orderNo.isAcceptableOrUnknown(data['order_no']!, _orderNoMeta),
      );
    } else if (isInserting) {
      context.missing(_orderNoMeta);
    }
    if (data.containsKey('customer_uuid')) {
      context.handle(
        _customerUuidMeta,
        customerUuid.isAcceptableOrUnknown(
          data['customer_uuid']!,
          _customerUuidMeta,
        ),
      );
    }
    if (data.containsKey('order_date')) {
      context.handle(
        _orderDateMeta,
        orderDate.isAcceptableOrUnknown(data['order_date']!, _orderDateMeta),
      );
    }
    if (data.containsKey('order_status')) {
      context.handle(
        _orderStatusMeta,
        orderStatus.isAcceptableOrUnknown(
          data['order_status']!,
          _orderStatusMeta,
        ),
      );
    }
    if (data.containsKey('payment_status')) {
      context.handle(
        _paymentStatusMeta,
        paymentStatus.isAcceptableOrUnknown(
          data['payment_status']!,
          _paymentStatusMeta,
        ),
      );
    }
    if (data.containsKey('invoice_status')) {
      context.handle(
        _invoiceStatusMeta,
        invoiceStatus.isAcceptableOrUnknown(
          data['invoice_status']!,
          _invoiceStatusMeta,
        ),
      );
    }
    if (data.containsKey('total_sale_amount')) {
      context.handle(
        _totalSaleAmountMeta,
        totalSaleAmount.isAcceptableOrUnknown(
          data['total_sale_amount']!,
          _totalSaleAmountMeta,
        ),
      );
    }
    if (data.containsKey('total_cost_amount')) {
      context.handle(
        _totalCostAmountMeta,
        totalCostAmount.isAcceptableOrUnknown(
          data['total_cost_amount']!,
          _totalCostAmountMeta,
        ),
      );
    }
    if (data.containsKey('total_profit_amount')) {
      context.handle(
        _totalProfitAmountMeta,
        totalProfitAmount.isAcceptableOrUnknown(
          data['total_profit_amount']!,
          _totalProfitAmountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesOrder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalesOrder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      orderNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_no'],
      )!,
      customerUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_uuid'],
      ),
      orderDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}order_date'],
      ),
      orderStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_status'],
      )!,
      paymentStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_status'],
      )!,
      invoiceStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_status'],
      )!,
      totalSaleAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_sale_amount'],
      )!,
      totalCostAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_cost_amount'],
      )!,
      totalProfitAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_profit_amount'],
      )!,
    );
  }

  @override
  $SalesOrdersTable createAlias(String alias) {
    return $SalesOrdersTable(attachedDatabase, alias);
  }
}

class SalesOrder extends DataClass implements Insertable<SalesOrder> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String orderNo;
  final String? customerUuid;
  final DateTime? orderDate;
  final String orderStatus;
  final String paymentStatus;
  final String invoiceStatus;
  final int totalSaleAmount;
  final int totalCostAmount;
  final int totalProfitAmount;
  const SalesOrder({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.orderNo,
    this.customerUuid,
    this.orderDate,
    required this.orderStatus,
    required this.paymentStatus,
    required this.invoiceStatus,
    required this.totalSaleAmount,
    required this.totalCostAmount,
    required this.totalProfitAmount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['order_no'] = Variable<String>(orderNo);
    if (!nullToAbsent || customerUuid != null) {
      map['customer_uuid'] = Variable<String>(customerUuid);
    }
    if (!nullToAbsent || orderDate != null) {
      map['order_date'] = Variable<DateTime>(orderDate);
    }
    map['order_status'] = Variable<String>(orderStatus);
    map['payment_status'] = Variable<String>(paymentStatus);
    map['invoice_status'] = Variable<String>(invoiceStatus);
    map['total_sale_amount'] = Variable<int>(totalSaleAmount);
    map['total_cost_amount'] = Variable<int>(totalCostAmount);
    map['total_profit_amount'] = Variable<int>(totalProfitAmount);
    return map;
  }

  SalesOrdersCompanion toCompanion(bool nullToAbsent) {
    return SalesOrdersCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      orderNo: Value(orderNo),
      customerUuid: customerUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(customerUuid),
      orderDate: orderDate == null && nullToAbsent
          ? const Value.absent()
          : Value(orderDate),
      orderStatus: Value(orderStatus),
      paymentStatus: Value(paymentStatus),
      invoiceStatus: Value(invoiceStatus),
      totalSaleAmount: Value(totalSaleAmount),
      totalCostAmount: Value(totalCostAmount),
      totalProfitAmount: Value(totalProfitAmount),
    );
  }

  factory SalesOrder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesOrder(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      orderNo: serializer.fromJson<String>(json['orderNo']),
      customerUuid: serializer.fromJson<String?>(json['customerUuid']),
      orderDate: serializer.fromJson<DateTime?>(json['orderDate']),
      orderStatus: serializer.fromJson<String>(json['orderStatus']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
      invoiceStatus: serializer.fromJson<String>(json['invoiceStatus']),
      totalSaleAmount: serializer.fromJson<int>(json['totalSaleAmount']),
      totalCostAmount: serializer.fromJson<int>(json['totalCostAmount']),
      totalProfitAmount: serializer.fromJson<int>(json['totalProfitAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'orderNo': serializer.toJson<String>(orderNo),
      'customerUuid': serializer.toJson<String?>(customerUuid),
      'orderDate': serializer.toJson<DateTime?>(orderDate),
      'orderStatus': serializer.toJson<String>(orderStatus),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
      'invoiceStatus': serializer.toJson<String>(invoiceStatus),
      'totalSaleAmount': serializer.toJson<int>(totalSaleAmount),
      'totalCostAmount': serializer.toJson<int>(totalCostAmount),
      'totalProfitAmount': serializer.toJson<int>(totalProfitAmount),
    };
  }

  SalesOrder copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? orderNo,
    Value<String?> customerUuid = const Value.absent(),
    Value<DateTime?> orderDate = const Value.absent(),
    String? orderStatus,
    String? paymentStatus,
    String? invoiceStatus,
    int? totalSaleAmount,
    int? totalCostAmount,
    int? totalProfitAmount,
  }) => SalesOrder(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    orderNo: orderNo ?? this.orderNo,
    customerUuid: customerUuid.present ? customerUuid.value : this.customerUuid,
    orderDate: orderDate.present ? orderDate.value : this.orderDate,
    orderStatus: orderStatus ?? this.orderStatus,
    paymentStatus: paymentStatus ?? this.paymentStatus,
    invoiceStatus: invoiceStatus ?? this.invoiceStatus,
    totalSaleAmount: totalSaleAmount ?? this.totalSaleAmount,
    totalCostAmount: totalCostAmount ?? this.totalCostAmount,
    totalProfitAmount: totalProfitAmount ?? this.totalProfitAmount,
  );
  SalesOrder copyWithCompanion(SalesOrdersCompanion data) {
    return SalesOrder(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      orderNo: data.orderNo.present ? data.orderNo.value : this.orderNo,
      customerUuid: data.customerUuid.present
          ? data.customerUuid.value
          : this.customerUuid,
      orderDate: data.orderDate.present ? data.orderDate.value : this.orderDate,
      orderStatus: data.orderStatus.present
          ? data.orderStatus.value
          : this.orderStatus,
      paymentStatus: data.paymentStatus.present
          ? data.paymentStatus.value
          : this.paymentStatus,
      invoiceStatus: data.invoiceStatus.present
          ? data.invoiceStatus.value
          : this.invoiceStatus,
      totalSaleAmount: data.totalSaleAmount.present
          ? data.totalSaleAmount.value
          : this.totalSaleAmount,
      totalCostAmount: data.totalCostAmount.present
          ? data.totalCostAmount.value
          : this.totalCostAmount,
      totalProfitAmount: data.totalProfitAmount.present
          ? data.totalProfitAmount.value
          : this.totalProfitAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalesOrder(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('orderNo: $orderNo, ')
          ..write('customerUuid: $customerUuid, ')
          ..write('orderDate: $orderDate, ')
          ..write('orderStatus: $orderStatus, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('invoiceStatus: $invoiceStatus, ')
          ..write('totalSaleAmount: $totalSaleAmount, ')
          ..write('totalCostAmount: $totalCostAmount, ')
          ..write('totalProfitAmount: $totalProfitAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    orderNo,
    customerUuid,
    orderDate,
    orderStatus,
    paymentStatus,
    invoiceStatus,
    totalSaleAmount,
    totalCostAmount,
    totalProfitAmount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesOrder &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.orderNo == this.orderNo &&
          other.customerUuid == this.customerUuid &&
          other.orderDate == this.orderDate &&
          other.orderStatus == this.orderStatus &&
          other.paymentStatus == this.paymentStatus &&
          other.invoiceStatus == this.invoiceStatus &&
          other.totalSaleAmount == this.totalSaleAmount &&
          other.totalCostAmount == this.totalCostAmount &&
          other.totalProfitAmount == this.totalProfitAmount);
}

class SalesOrdersCompanion extends UpdateCompanion<SalesOrder> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> orderNo;
  final Value<String?> customerUuid;
  final Value<DateTime?> orderDate;
  final Value<String> orderStatus;
  final Value<String> paymentStatus;
  final Value<String> invoiceStatus;
  final Value<int> totalSaleAmount;
  final Value<int> totalCostAmount;
  final Value<int> totalProfitAmount;
  const SalesOrdersCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.orderNo = const Value.absent(),
    this.customerUuid = const Value.absent(),
    this.orderDate = const Value.absent(),
    this.orderStatus = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.invoiceStatus = const Value.absent(),
    this.totalSaleAmount = const Value.absent(),
    this.totalCostAmount = const Value.absent(),
    this.totalProfitAmount = const Value.absent(),
  });
  SalesOrdersCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String orderNo,
    this.customerUuid = const Value.absent(),
    this.orderDate = const Value.absent(),
    this.orderStatus = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.invoiceStatus = const Value.absent(),
    this.totalSaleAmount = const Value.absent(),
    this.totalCostAmount = const Value.absent(),
    this.totalProfitAmount = const Value.absent(),
  }) : uuid = Value(uuid),
       orderNo = Value(orderNo);
  static Insertable<SalesOrder> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? orderNo,
    Expression<String>? customerUuid,
    Expression<DateTime>? orderDate,
    Expression<String>? orderStatus,
    Expression<String>? paymentStatus,
    Expression<String>? invoiceStatus,
    Expression<int>? totalSaleAmount,
    Expression<int>? totalCostAmount,
    Expression<int>? totalProfitAmount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (orderNo != null) 'order_no': orderNo,
      if (customerUuid != null) 'customer_uuid': customerUuid,
      if (orderDate != null) 'order_date': orderDate,
      if (orderStatus != null) 'order_status': orderStatus,
      if (paymentStatus != null) 'payment_status': paymentStatus,
      if (invoiceStatus != null) 'invoice_status': invoiceStatus,
      if (totalSaleAmount != null) 'total_sale_amount': totalSaleAmount,
      if (totalCostAmount != null) 'total_cost_amount': totalCostAmount,
      if (totalProfitAmount != null) 'total_profit_amount': totalProfitAmount,
    });
  }

  SalesOrdersCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? orderNo,
    Value<String?>? customerUuid,
    Value<DateTime?>? orderDate,
    Value<String>? orderStatus,
    Value<String>? paymentStatus,
    Value<String>? invoiceStatus,
    Value<int>? totalSaleAmount,
    Value<int>? totalCostAmount,
    Value<int>? totalProfitAmount,
  }) {
    return SalesOrdersCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      orderNo: orderNo ?? this.orderNo,
      customerUuid: customerUuid ?? this.customerUuid,
      orderDate: orderDate ?? this.orderDate,
      orderStatus: orderStatus ?? this.orderStatus,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      invoiceStatus: invoiceStatus ?? this.invoiceStatus,
      totalSaleAmount: totalSaleAmount ?? this.totalSaleAmount,
      totalCostAmount: totalCostAmount ?? this.totalCostAmount,
      totalProfitAmount: totalProfitAmount ?? this.totalProfitAmount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (orderNo.present) {
      map['order_no'] = Variable<String>(orderNo.value);
    }
    if (customerUuid.present) {
      map['customer_uuid'] = Variable<String>(customerUuid.value);
    }
    if (orderDate.present) {
      map['order_date'] = Variable<DateTime>(orderDate.value);
    }
    if (orderStatus.present) {
      map['order_status'] = Variable<String>(orderStatus.value);
    }
    if (paymentStatus.present) {
      map['payment_status'] = Variable<String>(paymentStatus.value);
    }
    if (invoiceStatus.present) {
      map['invoice_status'] = Variable<String>(invoiceStatus.value);
    }
    if (totalSaleAmount.present) {
      map['total_sale_amount'] = Variable<int>(totalSaleAmount.value);
    }
    if (totalCostAmount.present) {
      map['total_cost_amount'] = Variable<int>(totalCostAmount.value);
    }
    if (totalProfitAmount.present) {
      map['total_profit_amount'] = Variable<int>(totalProfitAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesOrdersCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('orderNo: $orderNo, ')
          ..write('customerUuid: $customerUuid, ')
          ..write('orderDate: $orderDate, ')
          ..write('orderStatus: $orderStatus, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('invoiceStatus: $invoiceStatus, ')
          ..write('totalSaleAmount: $totalSaleAmount, ')
          ..write('totalCostAmount: $totalCostAmount, ')
          ..write('totalProfitAmount: $totalProfitAmount')
          ..write(')'))
        .toString();
  }
}

class $SalesOrderItemsTable extends SalesOrderItems
    with TableInfo<$SalesOrderItemsTable, SalesOrderItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesOrderItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderUuidMeta = const VerificationMeta(
    'orderUuid',
  );
  @override
  late final GeneratedColumn<String> orderUuid = GeneratedColumn<String>(
    'order_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productUuidMeta = const VerificationMeta(
    'productUuid',
  );
  @override
  late final GeneratedColumn<String> productUuid = GeneratedColumn<String>(
    'product_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productNameSnapshotMeta =
      const VerificationMeta('productNameSnapshot');
  @override
  late final GeneratedColumn<String> productNameSnapshot =
      GeneratedColumn<String>(
        'product_name_snapshot',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _productCodeSnapshotMeta =
      const VerificationMeta('productCodeSnapshot');
  @override
  late final GeneratedColumn<String> productCodeSnapshot =
      GeneratedColumn<String>(
        'product_code_snapshot',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _specificationSnapshotMeta =
      const VerificationMeta('specificationSnapshot');
  @override
  late final GeneratedColumn<String> specificationSnapshot =
      GeneratedColumn<String>(
        'specification_snapshot',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _quantityValueMeta = const VerificationMeta(
    'quantityValue',
  );
  @override
  late final GeneratedColumn<double> quantityValue = GeneratedColumn<double>(
    'quantity_value',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityUnitMeta = const VerificationMeta(
    'quantityUnit',
  );
  @override
  late final GeneratedColumn<String> quantityUnit = GeneratedColumn<String>(
    'quantity_unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _saleAmountMeta = const VerificationMeta(
    'saleAmount',
  );
  @override
  late final GeneratedColumn<int> saleAmount = GeneratedColumn<int>(
    'sale_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _costAmountMeta = const VerificationMeta(
    'costAmount',
  );
  @override
  late final GeneratedColumn<int> costAmount = GeneratedColumn<int>(
    'cost_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _itemStatusMeta = const VerificationMeta(
    'itemStatus',
  );
  @override
  late final GeneratedColumn<String> itemStatus = GeneratedColumn<String>(
    'item_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  static const VerificationMeta _supplierUuidMeta = const VerificationMeta(
    'supplierUuid',
  );
  @override
  late final GeneratedColumn<String> supplierUuid = GeneratedColumn<String>(
    'supplier_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    orderUuid,
    productUuid,
    productNameSnapshot,
    productCodeSnapshot,
    specificationSnapshot,
    quantityValue,
    quantityUnit,
    saleAmount,
    costAmount,
    itemStatus,
    supplierUuid,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales_order_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<SalesOrderItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('order_uuid')) {
      context.handle(
        _orderUuidMeta,
        orderUuid.isAcceptableOrUnknown(data['order_uuid']!, _orderUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_orderUuidMeta);
    }
    if (data.containsKey('product_uuid')) {
      context.handle(
        _productUuidMeta,
        productUuid.isAcceptableOrUnknown(
          data['product_uuid']!,
          _productUuidMeta,
        ),
      );
    }
    if (data.containsKey('product_name_snapshot')) {
      context.handle(
        _productNameSnapshotMeta,
        productNameSnapshot.isAcceptableOrUnknown(
          data['product_name_snapshot']!,
          _productNameSnapshotMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productNameSnapshotMeta);
    }
    if (data.containsKey('product_code_snapshot')) {
      context.handle(
        _productCodeSnapshotMeta,
        productCodeSnapshot.isAcceptableOrUnknown(
          data['product_code_snapshot']!,
          _productCodeSnapshotMeta,
        ),
      );
    }
    if (data.containsKey('specification_snapshot')) {
      context.handle(
        _specificationSnapshotMeta,
        specificationSnapshot.isAcceptableOrUnknown(
          data['specification_snapshot']!,
          _specificationSnapshotMeta,
        ),
      );
    }
    if (data.containsKey('quantity_value')) {
      context.handle(
        _quantityValueMeta,
        quantityValue.isAcceptableOrUnknown(
          data['quantity_value']!,
          _quantityValueMeta,
        ),
      );
    }
    if (data.containsKey('quantity_unit')) {
      context.handle(
        _quantityUnitMeta,
        quantityUnit.isAcceptableOrUnknown(
          data['quantity_unit']!,
          _quantityUnitMeta,
        ),
      );
    }
    if (data.containsKey('sale_amount')) {
      context.handle(
        _saleAmountMeta,
        saleAmount.isAcceptableOrUnknown(data['sale_amount']!, _saleAmountMeta),
      );
    }
    if (data.containsKey('cost_amount')) {
      context.handle(
        _costAmountMeta,
        costAmount.isAcceptableOrUnknown(data['cost_amount']!, _costAmountMeta),
      );
    }
    if (data.containsKey('item_status')) {
      context.handle(
        _itemStatusMeta,
        itemStatus.isAcceptableOrUnknown(data['item_status']!, _itemStatusMeta),
      );
    }
    if (data.containsKey('supplier_uuid')) {
      context.handle(
        _supplierUuidMeta,
        supplierUuid.isAcceptableOrUnknown(
          data['supplier_uuid']!,
          _supplierUuidMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesOrderItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalesOrderItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      orderUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_uuid'],
      )!,
      productUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_uuid'],
      ),
      productNameSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_name_snapshot'],
      )!,
      productCodeSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_code_snapshot'],
      ),
      specificationSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specification_snapshot'],
      ),
      quantityValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity_value'],
      ),
      quantityUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quantity_unit'],
      ),
      saleAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sale_amount'],
      )!,
      costAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cost_amount'],
      )!,
      itemStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_status'],
      )!,
      supplierUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supplier_uuid'],
      ),
    );
  }

  @override
  $SalesOrderItemsTable createAlias(String alias) {
    return $SalesOrderItemsTable(attachedDatabase, alias);
  }
}

class SalesOrderItem extends DataClass implements Insertable<SalesOrderItem> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String orderUuid;
  final String? productUuid;
  final String productNameSnapshot;
  final String? productCodeSnapshot;
  final String? specificationSnapshot;
  final double? quantityValue;
  final String? quantityUnit;
  final int saleAmount;
  final int costAmount;
  final String itemStatus;
  final String? supplierUuid;
  const SalesOrderItem({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.orderUuid,
    this.productUuid,
    required this.productNameSnapshot,
    this.productCodeSnapshot,
    this.specificationSnapshot,
    this.quantityValue,
    this.quantityUnit,
    required this.saleAmount,
    required this.costAmount,
    required this.itemStatus,
    this.supplierUuid,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['order_uuid'] = Variable<String>(orderUuid);
    if (!nullToAbsent || productUuid != null) {
      map['product_uuid'] = Variable<String>(productUuid);
    }
    map['product_name_snapshot'] = Variable<String>(productNameSnapshot);
    if (!nullToAbsent || productCodeSnapshot != null) {
      map['product_code_snapshot'] = Variable<String>(productCodeSnapshot);
    }
    if (!nullToAbsent || specificationSnapshot != null) {
      map['specification_snapshot'] = Variable<String>(specificationSnapshot);
    }
    if (!nullToAbsent || quantityValue != null) {
      map['quantity_value'] = Variable<double>(quantityValue);
    }
    if (!nullToAbsent || quantityUnit != null) {
      map['quantity_unit'] = Variable<String>(quantityUnit);
    }
    map['sale_amount'] = Variable<int>(saleAmount);
    map['cost_amount'] = Variable<int>(costAmount);
    map['item_status'] = Variable<String>(itemStatus);
    if (!nullToAbsent || supplierUuid != null) {
      map['supplier_uuid'] = Variable<String>(supplierUuid);
    }
    return map;
  }

  SalesOrderItemsCompanion toCompanion(bool nullToAbsent) {
    return SalesOrderItemsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      orderUuid: Value(orderUuid),
      productUuid: productUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(productUuid),
      productNameSnapshot: Value(productNameSnapshot),
      productCodeSnapshot: productCodeSnapshot == null && nullToAbsent
          ? const Value.absent()
          : Value(productCodeSnapshot),
      specificationSnapshot: specificationSnapshot == null && nullToAbsent
          ? const Value.absent()
          : Value(specificationSnapshot),
      quantityValue: quantityValue == null && nullToAbsent
          ? const Value.absent()
          : Value(quantityValue),
      quantityUnit: quantityUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(quantityUnit),
      saleAmount: Value(saleAmount),
      costAmount: Value(costAmount),
      itemStatus: Value(itemStatus),
      supplierUuid: supplierUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierUuid),
    );
  }

  factory SalesOrderItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesOrderItem(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      orderUuid: serializer.fromJson<String>(json['orderUuid']),
      productUuid: serializer.fromJson<String?>(json['productUuid']),
      productNameSnapshot: serializer.fromJson<String>(
        json['productNameSnapshot'],
      ),
      productCodeSnapshot: serializer.fromJson<String?>(
        json['productCodeSnapshot'],
      ),
      specificationSnapshot: serializer.fromJson<String?>(
        json['specificationSnapshot'],
      ),
      quantityValue: serializer.fromJson<double?>(json['quantityValue']),
      quantityUnit: serializer.fromJson<String?>(json['quantityUnit']),
      saleAmount: serializer.fromJson<int>(json['saleAmount']),
      costAmount: serializer.fromJson<int>(json['costAmount']),
      itemStatus: serializer.fromJson<String>(json['itemStatus']),
      supplierUuid: serializer.fromJson<String?>(json['supplierUuid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'orderUuid': serializer.toJson<String>(orderUuid),
      'productUuid': serializer.toJson<String?>(productUuid),
      'productNameSnapshot': serializer.toJson<String>(productNameSnapshot),
      'productCodeSnapshot': serializer.toJson<String?>(productCodeSnapshot),
      'specificationSnapshot': serializer.toJson<String?>(
        specificationSnapshot,
      ),
      'quantityValue': serializer.toJson<double?>(quantityValue),
      'quantityUnit': serializer.toJson<String?>(quantityUnit),
      'saleAmount': serializer.toJson<int>(saleAmount),
      'costAmount': serializer.toJson<int>(costAmount),
      'itemStatus': serializer.toJson<String>(itemStatus),
      'supplierUuid': serializer.toJson<String?>(supplierUuid),
    };
  }

  SalesOrderItem copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? orderUuid,
    Value<String?> productUuid = const Value.absent(),
    String? productNameSnapshot,
    Value<String?> productCodeSnapshot = const Value.absent(),
    Value<String?> specificationSnapshot = const Value.absent(),
    Value<double?> quantityValue = const Value.absent(),
    Value<String?> quantityUnit = const Value.absent(),
    int? saleAmount,
    int? costAmount,
    String? itemStatus,
    Value<String?> supplierUuid = const Value.absent(),
  }) => SalesOrderItem(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    orderUuid: orderUuid ?? this.orderUuid,
    productUuid: productUuid.present ? productUuid.value : this.productUuid,
    productNameSnapshot: productNameSnapshot ?? this.productNameSnapshot,
    productCodeSnapshot: productCodeSnapshot.present
        ? productCodeSnapshot.value
        : this.productCodeSnapshot,
    specificationSnapshot: specificationSnapshot.present
        ? specificationSnapshot.value
        : this.specificationSnapshot,
    quantityValue: quantityValue.present
        ? quantityValue.value
        : this.quantityValue,
    quantityUnit: quantityUnit.present ? quantityUnit.value : this.quantityUnit,
    saleAmount: saleAmount ?? this.saleAmount,
    costAmount: costAmount ?? this.costAmount,
    itemStatus: itemStatus ?? this.itemStatus,
    supplierUuid: supplierUuid.present ? supplierUuid.value : this.supplierUuid,
  );
  SalesOrderItem copyWithCompanion(SalesOrderItemsCompanion data) {
    return SalesOrderItem(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      orderUuid: data.orderUuid.present ? data.orderUuid.value : this.orderUuid,
      productUuid: data.productUuid.present
          ? data.productUuid.value
          : this.productUuid,
      productNameSnapshot: data.productNameSnapshot.present
          ? data.productNameSnapshot.value
          : this.productNameSnapshot,
      productCodeSnapshot: data.productCodeSnapshot.present
          ? data.productCodeSnapshot.value
          : this.productCodeSnapshot,
      specificationSnapshot: data.specificationSnapshot.present
          ? data.specificationSnapshot.value
          : this.specificationSnapshot,
      quantityValue: data.quantityValue.present
          ? data.quantityValue.value
          : this.quantityValue,
      quantityUnit: data.quantityUnit.present
          ? data.quantityUnit.value
          : this.quantityUnit,
      saleAmount: data.saleAmount.present
          ? data.saleAmount.value
          : this.saleAmount,
      costAmount: data.costAmount.present
          ? data.costAmount.value
          : this.costAmount,
      itemStatus: data.itemStatus.present
          ? data.itemStatus.value
          : this.itemStatus,
      supplierUuid: data.supplierUuid.present
          ? data.supplierUuid.value
          : this.supplierUuid,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalesOrderItem(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('productUuid: $productUuid, ')
          ..write('productNameSnapshot: $productNameSnapshot, ')
          ..write('productCodeSnapshot: $productCodeSnapshot, ')
          ..write('specificationSnapshot: $specificationSnapshot, ')
          ..write('quantityValue: $quantityValue, ')
          ..write('quantityUnit: $quantityUnit, ')
          ..write('saleAmount: $saleAmount, ')
          ..write('costAmount: $costAmount, ')
          ..write('itemStatus: $itemStatus, ')
          ..write('supplierUuid: $supplierUuid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    orderUuid,
    productUuid,
    productNameSnapshot,
    productCodeSnapshot,
    specificationSnapshot,
    quantityValue,
    quantityUnit,
    saleAmount,
    costAmount,
    itemStatus,
    supplierUuid,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesOrderItem &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.orderUuid == this.orderUuid &&
          other.productUuid == this.productUuid &&
          other.productNameSnapshot == this.productNameSnapshot &&
          other.productCodeSnapshot == this.productCodeSnapshot &&
          other.specificationSnapshot == this.specificationSnapshot &&
          other.quantityValue == this.quantityValue &&
          other.quantityUnit == this.quantityUnit &&
          other.saleAmount == this.saleAmount &&
          other.costAmount == this.costAmount &&
          other.itemStatus == this.itemStatus &&
          other.supplierUuid == this.supplierUuid);
}

class SalesOrderItemsCompanion extends UpdateCompanion<SalesOrderItem> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> orderUuid;
  final Value<String?> productUuid;
  final Value<String> productNameSnapshot;
  final Value<String?> productCodeSnapshot;
  final Value<String?> specificationSnapshot;
  final Value<double?> quantityValue;
  final Value<String?> quantityUnit;
  final Value<int> saleAmount;
  final Value<int> costAmount;
  final Value<String> itemStatus;
  final Value<String?> supplierUuid;
  const SalesOrderItemsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.orderUuid = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.productNameSnapshot = const Value.absent(),
    this.productCodeSnapshot = const Value.absent(),
    this.specificationSnapshot = const Value.absent(),
    this.quantityValue = const Value.absent(),
    this.quantityUnit = const Value.absent(),
    this.saleAmount = const Value.absent(),
    this.costAmount = const Value.absent(),
    this.itemStatus = const Value.absent(),
    this.supplierUuid = const Value.absent(),
  });
  SalesOrderItemsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String orderUuid,
    this.productUuid = const Value.absent(),
    required String productNameSnapshot,
    this.productCodeSnapshot = const Value.absent(),
    this.specificationSnapshot = const Value.absent(),
    this.quantityValue = const Value.absent(),
    this.quantityUnit = const Value.absent(),
    this.saleAmount = const Value.absent(),
    this.costAmount = const Value.absent(),
    this.itemStatus = const Value.absent(),
    this.supplierUuid = const Value.absent(),
  }) : uuid = Value(uuid),
       orderUuid = Value(orderUuid),
       productNameSnapshot = Value(productNameSnapshot);
  static Insertable<SalesOrderItem> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? orderUuid,
    Expression<String>? productUuid,
    Expression<String>? productNameSnapshot,
    Expression<String>? productCodeSnapshot,
    Expression<String>? specificationSnapshot,
    Expression<double>? quantityValue,
    Expression<String>? quantityUnit,
    Expression<int>? saleAmount,
    Expression<int>? costAmount,
    Expression<String>? itemStatus,
    Expression<String>? supplierUuid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (orderUuid != null) 'order_uuid': orderUuid,
      if (productUuid != null) 'product_uuid': productUuid,
      if (productNameSnapshot != null)
        'product_name_snapshot': productNameSnapshot,
      if (productCodeSnapshot != null)
        'product_code_snapshot': productCodeSnapshot,
      if (specificationSnapshot != null)
        'specification_snapshot': specificationSnapshot,
      if (quantityValue != null) 'quantity_value': quantityValue,
      if (quantityUnit != null) 'quantity_unit': quantityUnit,
      if (saleAmount != null) 'sale_amount': saleAmount,
      if (costAmount != null) 'cost_amount': costAmount,
      if (itemStatus != null) 'item_status': itemStatus,
      if (supplierUuid != null) 'supplier_uuid': supplierUuid,
    });
  }

  SalesOrderItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? orderUuid,
    Value<String?>? productUuid,
    Value<String>? productNameSnapshot,
    Value<String?>? productCodeSnapshot,
    Value<String?>? specificationSnapshot,
    Value<double?>? quantityValue,
    Value<String?>? quantityUnit,
    Value<int>? saleAmount,
    Value<int>? costAmount,
    Value<String>? itemStatus,
    Value<String?>? supplierUuid,
  }) {
    return SalesOrderItemsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      orderUuid: orderUuid ?? this.orderUuid,
      productUuid: productUuid ?? this.productUuid,
      productNameSnapshot: productNameSnapshot ?? this.productNameSnapshot,
      productCodeSnapshot: productCodeSnapshot ?? this.productCodeSnapshot,
      specificationSnapshot:
          specificationSnapshot ?? this.specificationSnapshot,
      quantityValue: quantityValue ?? this.quantityValue,
      quantityUnit: quantityUnit ?? this.quantityUnit,
      saleAmount: saleAmount ?? this.saleAmount,
      costAmount: costAmount ?? this.costAmount,
      itemStatus: itemStatus ?? this.itemStatus,
      supplierUuid: supplierUuid ?? this.supplierUuid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (orderUuid.present) {
      map['order_uuid'] = Variable<String>(orderUuid.value);
    }
    if (productUuid.present) {
      map['product_uuid'] = Variable<String>(productUuid.value);
    }
    if (productNameSnapshot.present) {
      map['product_name_snapshot'] = Variable<String>(
        productNameSnapshot.value,
      );
    }
    if (productCodeSnapshot.present) {
      map['product_code_snapshot'] = Variable<String>(
        productCodeSnapshot.value,
      );
    }
    if (specificationSnapshot.present) {
      map['specification_snapshot'] = Variable<String>(
        specificationSnapshot.value,
      );
    }
    if (quantityValue.present) {
      map['quantity_value'] = Variable<double>(quantityValue.value);
    }
    if (quantityUnit.present) {
      map['quantity_unit'] = Variable<String>(quantityUnit.value);
    }
    if (saleAmount.present) {
      map['sale_amount'] = Variable<int>(saleAmount.value);
    }
    if (costAmount.present) {
      map['cost_amount'] = Variable<int>(costAmount.value);
    }
    if (itemStatus.present) {
      map['item_status'] = Variable<String>(itemStatus.value);
    }
    if (supplierUuid.present) {
      map['supplier_uuid'] = Variable<String>(supplierUuid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesOrderItemsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('productUuid: $productUuid, ')
          ..write('productNameSnapshot: $productNameSnapshot, ')
          ..write('productCodeSnapshot: $productCodeSnapshot, ')
          ..write('specificationSnapshot: $specificationSnapshot, ')
          ..write('quantityValue: $quantityValue, ')
          ..write('quantityUnit: $quantityUnit, ')
          ..write('saleAmount: $saleAmount, ')
          ..write('costAmount: $costAmount, ')
          ..write('itemStatus: $itemStatus, ')
          ..write('supplierUuid: $supplierUuid')
          ..write(')'))
        .toString();
  }
}

class $PurchaseOrdersTable extends PurchaseOrders
    with TableInfo<$PurchaseOrdersTable, PurchaseOrder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseOrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _purchaseNoMeta = const VerificationMeta(
    'purchaseNo',
  );
  @override
  late final GeneratedColumn<String> purchaseNo = GeneratedColumn<String>(
    'purchase_no',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 96,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _supplierUuidMeta = const VerificationMeta(
    'supplierUuid',
  );
  @override
  late final GeneratedColumn<String> supplierUuid = GeneratedColumn<String>(
    'supplier_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _relatedOrderUuidMeta = const VerificationMeta(
    'relatedOrderUuid',
  );
  @override
  late final GeneratedColumn<String> relatedOrderUuid = GeneratedColumn<String>(
    'related_order_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _purchaseTypeMeta = const VerificationMeta(
    'purchaseType',
  );
  @override
  late final GeneratedColumn<String> purchaseType = GeneratedColumn<String>(
    'purchase_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('purchase'),
  );
  static const VerificationMeta _purchaseStatusMeta = const VerificationMeta(
    'purchaseStatus',
  );
  @override
  late final GeneratedColumn<String> purchaseStatus = GeneratedColumn<String>(
    'purchase_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  static const VerificationMeta _orderDateMeta = const VerificationMeta(
    'orderDate',
  );
  @override
  late final GeneratedColumn<DateTime> orderDate = GeneratedColumn<DateTime>(
    'order_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<int> totalAmount = GeneratedColumn<int>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    purchaseNo,
    supplierUuid,
    relatedOrderUuid,
    purchaseType,
    purchaseStatus,
    orderDate,
    totalAmount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_orders';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchaseOrder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('purchase_no')) {
      context.handle(
        _purchaseNoMeta,
        purchaseNo.isAcceptableOrUnknown(data['purchase_no']!, _purchaseNoMeta),
      );
    } else if (isInserting) {
      context.missing(_purchaseNoMeta);
    }
    if (data.containsKey('supplier_uuid')) {
      context.handle(
        _supplierUuidMeta,
        supplierUuid.isAcceptableOrUnknown(
          data['supplier_uuid']!,
          _supplierUuidMeta,
        ),
      );
    }
    if (data.containsKey('related_order_uuid')) {
      context.handle(
        _relatedOrderUuidMeta,
        relatedOrderUuid.isAcceptableOrUnknown(
          data['related_order_uuid']!,
          _relatedOrderUuidMeta,
        ),
      );
    }
    if (data.containsKey('purchase_type')) {
      context.handle(
        _purchaseTypeMeta,
        purchaseType.isAcceptableOrUnknown(
          data['purchase_type']!,
          _purchaseTypeMeta,
        ),
      );
    }
    if (data.containsKey('purchase_status')) {
      context.handle(
        _purchaseStatusMeta,
        purchaseStatus.isAcceptableOrUnknown(
          data['purchase_status']!,
          _purchaseStatusMeta,
        ),
      );
    }
    if (data.containsKey('order_date')) {
      context.handle(
        _orderDateMeta,
        orderDate.isAcceptableOrUnknown(data['order_date']!, _orderDateMeta),
      );
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseOrder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseOrder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      purchaseNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purchase_no'],
      )!,
      supplierUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supplier_uuid'],
      ),
      relatedOrderUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_order_uuid'],
      ),
      purchaseType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purchase_type'],
      )!,
      purchaseStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purchase_status'],
      )!,
      orderDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}order_date'],
      ),
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_amount'],
      )!,
    );
  }

  @override
  $PurchaseOrdersTable createAlias(String alias) {
    return $PurchaseOrdersTable(attachedDatabase, alias);
  }
}

class PurchaseOrder extends DataClass implements Insertable<PurchaseOrder> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String purchaseNo;
  final String? supplierUuid;
  final String? relatedOrderUuid;
  final String purchaseType;
  final String purchaseStatus;
  final DateTime? orderDate;
  final int totalAmount;
  const PurchaseOrder({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.purchaseNo,
    this.supplierUuid,
    this.relatedOrderUuid,
    required this.purchaseType,
    required this.purchaseStatus,
    this.orderDate,
    required this.totalAmount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['purchase_no'] = Variable<String>(purchaseNo);
    if (!nullToAbsent || supplierUuid != null) {
      map['supplier_uuid'] = Variable<String>(supplierUuid);
    }
    if (!nullToAbsent || relatedOrderUuid != null) {
      map['related_order_uuid'] = Variable<String>(relatedOrderUuid);
    }
    map['purchase_type'] = Variable<String>(purchaseType);
    map['purchase_status'] = Variable<String>(purchaseStatus);
    if (!nullToAbsent || orderDate != null) {
      map['order_date'] = Variable<DateTime>(orderDate);
    }
    map['total_amount'] = Variable<int>(totalAmount);
    return map;
  }

  PurchaseOrdersCompanion toCompanion(bool nullToAbsent) {
    return PurchaseOrdersCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      purchaseNo: Value(purchaseNo),
      supplierUuid: supplierUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierUuid),
      relatedOrderUuid: relatedOrderUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedOrderUuid),
      purchaseType: Value(purchaseType),
      purchaseStatus: Value(purchaseStatus),
      orderDate: orderDate == null && nullToAbsent
          ? const Value.absent()
          : Value(orderDate),
      totalAmount: Value(totalAmount),
    );
  }

  factory PurchaseOrder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseOrder(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      purchaseNo: serializer.fromJson<String>(json['purchaseNo']),
      supplierUuid: serializer.fromJson<String?>(json['supplierUuid']),
      relatedOrderUuid: serializer.fromJson<String?>(json['relatedOrderUuid']),
      purchaseType: serializer.fromJson<String>(json['purchaseType']),
      purchaseStatus: serializer.fromJson<String>(json['purchaseStatus']),
      orderDate: serializer.fromJson<DateTime?>(json['orderDate']),
      totalAmount: serializer.fromJson<int>(json['totalAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'purchaseNo': serializer.toJson<String>(purchaseNo),
      'supplierUuid': serializer.toJson<String?>(supplierUuid),
      'relatedOrderUuid': serializer.toJson<String?>(relatedOrderUuid),
      'purchaseType': serializer.toJson<String>(purchaseType),
      'purchaseStatus': serializer.toJson<String>(purchaseStatus),
      'orderDate': serializer.toJson<DateTime?>(orderDate),
      'totalAmount': serializer.toJson<int>(totalAmount),
    };
  }

  PurchaseOrder copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? purchaseNo,
    Value<String?> supplierUuid = const Value.absent(),
    Value<String?> relatedOrderUuid = const Value.absent(),
    String? purchaseType,
    String? purchaseStatus,
    Value<DateTime?> orderDate = const Value.absent(),
    int? totalAmount,
  }) => PurchaseOrder(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    purchaseNo: purchaseNo ?? this.purchaseNo,
    supplierUuid: supplierUuid.present ? supplierUuid.value : this.supplierUuid,
    relatedOrderUuid: relatedOrderUuid.present
        ? relatedOrderUuid.value
        : this.relatedOrderUuid,
    purchaseType: purchaseType ?? this.purchaseType,
    purchaseStatus: purchaseStatus ?? this.purchaseStatus,
    orderDate: orderDate.present ? orderDate.value : this.orderDate,
    totalAmount: totalAmount ?? this.totalAmount,
  );
  PurchaseOrder copyWithCompanion(PurchaseOrdersCompanion data) {
    return PurchaseOrder(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      purchaseNo: data.purchaseNo.present
          ? data.purchaseNo.value
          : this.purchaseNo,
      supplierUuid: data.supplierUuid.present
          ? data.supplierUuid.value
          : this.supplierUuid,
      relatedOrderUuid: data.relatedOrderUuid.present
          ? data.relatedOrderUuid.value
          : this.relatedOrderUuid,
      purchaseType: data.purchaseType.present
          ? data.purchaseType.value
          : this.purchaseType,
      purchaseStatus: data.purchaseStatus.present
          ? data.purchaseStatus.value
          : this.purchaseStatus,
      orderDate: data.orderDate.present ? data.orderDate.value : this.orderDate,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseOrder(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('purchaseNo: $purchaseNo, ')
          ..write('supplierUuid: $supplierUuid, ')
          ..write('relatedOrderUuid: $relatedOrderUuid, ')
          ..write('purchaseType: $purchaseType, ')
          ..write('purchaseStatus: $purchaseStatus, ')
          ..write('orderDate: $orderDate, ')
          ..write('totalAmount: $totalAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    purchaseNo,
    supplierUuid,
    relatedOrderUuid,
    purchaseType,
    purchaseStatus,
    orderDate,
    totalAmount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseOrder &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.purchaseNo == this.purchaseNo &&
          other.supplierUuid == this.supplierUuid &&
          other.relatedOrderUuid == this.relatedOrderUuid &&
          other.purchaseType == this.purchaseType &&
          other.purchaseStatus == this.purchaseStatus &&
          other.orderDate == this.orderDate &&
          other.totalAmount == this.totalAmount);
}

class PurchaseOrdersCompanion extends UpdateCompanion<PurchaseOrder> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> purchaseNo;
  final Value<String?> supplierUuid;
  final Value<String?> relatedOrderUuid;
  final Value<String> purchaseType;
  final Value<String> purchaseStatus;
  final Value<DateTime?> orderDate;
  final Value<int> totalAmount;
  const PurchaseOrdersCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.purchaseNo = const Value.absent(),
    this.supplierUuid = const Value.absent(),
    this.relatedOrderUuid = const Value.absent(),
    this.purchaseType = const Value.absent(),
    this.purchaseStatus = const Value.absent(),
    this.orderDate = const Value.absent(),
    this.totalAmount = const Value.absent(),
  });
  PurchaseOrdersCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String purchaseNo,
    this.supplierUuid = const Value.absent(),
    this.relatedOrderUuid = const Value.absent(),
    this.purchaseType = const Value.absent(),
    this.purchaseStatus = const Value.absent(),
    this.orderDate = const Value.absent(),
    this.totalAmount = const Value.absent(),
  }) : uuid = Value(uuid),
       purchaseNo = Value(purchaseNo);
  static Insertable<PurchaseOrder> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? purchaseNo,
    Expression<String>? supplierUuid,
    Expression<String>? relatedOrderUuid,
    Expression<String>? purchaseType,
    Expression<String>? purchaseStatus,
    Expression<DateTime>? orderDate,
    Expression<int>? totalAmount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (purchaseNo != null) 'purchase_no': purchaseNo,
      if (supplierUuid != null) 'supplier_uuid': supplierUuid,
      if (relatedOrderUuid != null) 'related_order_uuid': relatedOrderUuid,
      if (purchaseType != null) 'purchase_type': purchaseType,
      if (purchaseStatus != null) 'purchase_status': purchaseStatus,
      if (orderDate != null) 'order_date': orderDate,
      if (totalAmount != null) 'total_amount': totalAmount,
    });
  }

  PurchaseOrdersCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? purchaseNo,
    Value<String?>? supplierUuid,
    Value<String?>? relatedOrderUuid,
    Value<String>? purchaseType,
    Value<String>? purchaseStatus,
    Value<DateTime?>? orderDate,
    Value<int>? totalAmount,
  }) {
    return PurchaseOrdersCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      purchaseNo: purchaseNo ?? this.purchaseNo,
      supplierUuid: supplierUuid ?? this.supplierUuid,
      relatedOrderUuid: relatedOrderUuid ?? this.relatedOrderUuid,
      purchaseType: purchaseType ?? this.purchaseType,
      purchaseStatus: purchaseStatus ?? this.purchaseStatus,
      orderDate: orderDate ?? this.orderDate,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (purchaseNo.present) {
      map['purchase_no'] = Variable<String>(purchaseNo.value);
    }
    if (supplierUuid.present) {
      map['supplier_uuid'] = Variable<String>(supplierUuid.value);
    }
    if (relatedOrderUuid.present) {
      map['related_order_uuid'] = Variable<String>(relatedOrderUuid.value);
    }
    if (purchaseType.present) {
      map['purchase_type'] = Variable<String>(purchaseType.value);
    }
    if (purchaseStatus.present) {
      map['purchase_status'] = Variable<String>(purchaseStatus.value);
    }
    if (orderDate.present) {
      map['order_date'] = Variable<DateTime>(orderDate.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<int>(totalAmount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseOrdersCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('purchaseNo: $purchaseNo, ')
          ..write('supplierUuid: $supplierUuid, ')
          ..write('relatedOrderUuid: $relatedOrderUuid, ')
          ..write('purchaseType: $purchaseType, ')
          ..write('purchaseStatus: $purchaseStatus, ')
          ..write('orderDate: $orderDate, ')
          ..write('totalAmount: $totalAmount')
          ..write(')'))
        .toString();
  }
}

class $PurchaseOrderItemsTable extends PurchaseOrderItems
    with TableInfo<$PurchaseOrderItemsTable, PurchaseOrderItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseOrderItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _purchaseOrderUuidMeta = const VerificationMeta(
    'purchaseOrderUuid',
  );
  @override
  late final GeneratedColumn<String> purchaseOrderUuid =
      GeneratedColumn<String>(
        'purchase_order_uuid',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _salesOrderItemUuidMeta =
      const VerificationMeta('salesOrderItemUuid');
  @override
  late final GeneratedColumn<String> salesOrderItemUuid =
      GeneratedColumn<String>(
        'sales_order_item_uuid',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _productUuidMeta = const VerificationMeta(
    'productUuid',
  );
  @override
  late final GeneratedColumn<String> productUuid = GeneratedColumn<String>(
    'product_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productNameSnapshotMeta =
      const VerificationMeta('productNameSnapshot');
  @override
  late final GeneratedColumn<String> productNameSnapshot =
      GeneratedColumn<String>(
        'product_name_snapshot',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _productCodeSnapshotMeta =
      const VerificationMeta('productCodeSnapshot');
  @override
  late final GeneratedColumn<String> productCodeSnapshot =
      GeneratedColumn<String>(
        'product_code_snapshot',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _specificationSnapshotMeta =
      const VerificationMeta('specificationSnapshot');
  @override
  late final GeneratedColumn<String> specificationSnapshot =
      GeneratedColumn<String>(
        'specification_snapshot',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _quantityValueMeta = const VerificationMeta(
    'quantityValue',
  );
  @override
  late final GeneratedColumn<double> quantityValue = GeneratedColumn<double>(
    'quantity_value',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityUnitMeta = const VerificationMeta(
    'quantityUnit',
  );
  @override
  late final GeneratedColumn<String> quantityUnit = GeneratedColumn<String>(
    'quantity_unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitCostAmountMeta = const VerificationMeta(
    'unitCostAmount',
  );
  @override
  late final GeneratedColumn<int> unitCostAmount = GeneratedColumn<int>(
    'unit_cost_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalCostAmountMeta = const VerificationMeta(
    'totalCostAmount',
  );
  @override
  late final GeneratedColumn<int> totalCostAmount = GeneratedColumn<int>(
    'total_cost_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _itemStatusMeta = const VerificationMeta(
    'itemStatus',
  );
  @override
  late final GeneratedColumn<String> itemStatus = GeneratedColumn<String>(
    'item_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    purchaseOrderUuid,
    salesOrderItemUuid,
    productUuid,
    productNameSnapshot,
    productCodeSnapshot,
    specificationSnapshot,
    quantityValue,
    quantityUnit,
    unitCostAmount,
    totalCostAmount,
    itemStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_order_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<PurchaseOrderItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('purchase_order_uuid')) {
      context.handle(
        _purchaseOrderUuidMeta,
        purchaseOrderUuid.isAcceptableOrUnknown(
          data['purchase_order_uuid']!,
          _purchaseOrderUuidMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_purchaseOrderUuidMeta);
    }
    if (data.containsKey('sales_order_item_uuid')) {
      context.handle(
        _salesOrderItemUuidMeta,
        salesOrderItemUuid.isAcceptableOrUnknown(
          data['sales_order_item_uuid']!,
          _salesOrderItemUuidMeta,
        ),
      );
    }
    if (data.containsKey('product_uuid')) {
      context.handle(
        _productUuidMeta,
        productUuid.isAcceptableOrUnknown(
          data['product_uuid']!,
          _productUuidMeta,
        ),
      );
    }
    if (data.containsKey('product_name_snapshot')) {
      context.handle(
        _productNameSnapshotMeta,
        productNameSnapshot.isAcceptableOrUnknown(
          data['product_name_snapshot']!,
          _productNameSnapshotMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productNameSnapshotMeta);
    }
    if (data.containsKey('product_code_snapshot')) {
      context.handle(
        _productCodeSnapshotMeta,
        productCodeSnapshot.isAcceptableOrUnknown(
          data['product_code_snapshot']!,
          _productCodeSnapshotMeta,
        ),
      );
    }
    if (data.containsKey('specification_snapshot')) {
      context.handle(
        _specificationSnapshotMeta,
        specificationSnapshot.isAcceptableOrUnknown(
          data['specification_snapshot']!,
          _specificationSnapshotMeta,
        ),
      );
    }
    if (data.containsKey('quantity_value')) {
      context.handle(
        _quantityValueMeta,
        quantityValue.isAcceptableOrUnknown(
          data['quantity_value']!,
          _quantityValueMeta,
        ),
      );
    }
    if (data.containsKey('quantity_unit')) {
      context.handle(
        _quantityUnitMeta,
        quantityUnit.isAcceptableOrUnknown(
          data['quantity_unit']!,
          _quantityUnitMeta,
        ),
      );
    }
    if (data.containsKey('unit_cost_amount')) {
      context.handle(
        _unitCostAmountMeta,
        unitCostAmount.isAcceptableOrUnknown(
          data['unit_cost_amount']!,
          _unitCostAmountMeta,
        ),
      );
    }
    if (data.containsKey('total_cost_amount')) {
      context.handle(
        _totalCostAmountMeta,
        totalCostAmount.isAcceptableOrUnknown(
          data['total_cost_amount']!,
          _totalCostAmountMeta,
        ),
      );
    }
    if (data.containsKey('item_status')) {
      context.handle(
        _itemStatusMeta,
        itemStatus.isAcceptableOrUnknown(data['item_status']!, _itemStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseOrderItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseOrderItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      purchaseOrderUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purchase_order_uuid'],
      )!,
      salesOrderItemUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sales_order_item_uuid'],
      ),
      productUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_uuid'],
      ),
      productNameSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_name_snapshot'],
      )!,
      productCodeSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_code_snapshot'],
      ),
      specificationSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specification_snapshot'],
      ),
      quantityValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity_value'],
      ),
      quantityUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quantity_unit'],
      ),
      unitCostAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_cost_amount'],
      )!,
      totalCostAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_cost_amount'],
      )!,
      itemStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_status'],
      )!,
    );
  }

  @override
  $PurchaseOrderItemsTable createAlias(String alias) {
    return $PurchaseOrderItemsTable(attachedDatabase, alias);
  }
}

class PurchaseOrderItem extends DataClass
    implements Insertable<PurchaseOrderItem> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String purchaseOrderUuid;
  final String? salesOrderItemUuid;
  final String? productUuid;
  final String productNameSnapshot;
  final String? productCodeSnapshot;
  final String? specificationSnapshot;
  final double? quantityValue;
  final String? quantityUnit;
  final int unitCostAmount;
  final int totalCostAmount;
  final String itemStatus;
  const PurchaseOrderItem({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.purchaseOrderUuid,
    this.salesOrderItemUuid,
    this.productUuid,
    required this.productNameSnapshot,
    this.productCodeSnapshot,
    this.specificationSnapshot,
    this.quantityValue,
    this.quantityUnit,
    required this.unitCostAmount,
    required this.totalCostAmount,
    required this.itemStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['purchase_order_uuid'] = Variable<String>(purchaseOrderUuid);
    if (!nullToAbsent || salesOrderItemUuid != null) {
      map['sales_order_item_uuid'] = Variable<String>(salesOrderItemUuid);
    }
    if (!nullToAbsent || productUuid != null) {
      map['product_uuid'] = Variable<String>(productUuid);
    }
    map['product_name_snapshot'] = Variable<String>(productNameSnapshot);
    if (!nullToAbsent || productCodeSnapshot != null) {
      map['product_code_snapshot'] = Variable<String>(productCodeSnapshot);
    }
    if (!nullToAbsent || specificationSnapshot != null) {
      map['specification_snapshot'] = Variable<String>(specificationSnapshot);
    }
    if (!nullToAbsent || quantityValue != null) {
      map['quantity_value'] = Variable<double>(quantityValue);
    }
    if (!nullToAbsent || quantityUnit != null) {
      map['quantity_unit'] = Variable<String>(quantityUnit);
    }
    map['unit_cost_amount'] = Variable<int>(unitCostAmount);
    map['total_cost_amount'] = Variable<int>(totalCostAmount);
    map['item_status'] = Variable<String>(itemStatus);
    return map;
  }

  PurchaseOrderItemsCompanion toCompanion(bool nullToAbsent) {
    return PurchaseOrderItemsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      purchaseOrderUuid: Value(purchaseOrderUuid),
      salesOrderItemUuid: salesOrderItemUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(salesOrderItemUuid),
      productUuid: productUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(productUuid),
      productNameSnapshot: Value(productNameSnapshot),
      productCodeSnapshot: productCodeSnapshot == null && nullToAbsent
          ? const Value.absent()
          : Value(productCodeSnapshot),
      specificationSnapshot: specificationSnapshot == null && nullToAbsent
          ? const Value.absent()
          : Value(specificationSnapshot),
      quantityValue: quantityValue == null && nullToAbsent
          ? const Value.absent()
          : Value(quantityValue),
      quantityUnit: quantityUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(quantityUnit),
      unitCostAmount: Value(unitCostAmount),
      totalCostAmount: Value(totalCostAmount),
      itemStatus: Value(itemStatus),
    );
  }

  factory PurchaseOrderItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseOrderItem(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      purchaseOrderUuid: serializer.fromJson<String>(json['purchaseOrderUuid']),
      salesOrderItemUuid: serializer.fromJson<String?>(
        json['salesOrderItemUuid'],
      ),
      productUuid: serializer.fromJson<String?>(json['productUuid']),
      productNameSnapshot: serializer.fromJson<String>(
        json['productNameSnapshot'],
      ),
      productCodeSnapshot: serializer.fromJson<String?>(
        json['productCodeSnapshot'],
      ),
      specificationSnapshot: serializer.fromJson<String?>(
        json['specificationSnapshot'],
      ),
      quantityValue: serializer.fromJson<double?>(json['quantityValue']),
      quantityUnit: serializer.fromJson<String?>(json['quantityUnit']),
      unitCostAmount: serializer.fromJson<int>(json['unitCostAmount']),
      totalCostAmount: serializer.fromJson<int>(json['totalCostAmount']),
      itemStatus: serializer.fromJson<String>(json['itemStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'purchaseOrderUuid': serializer.toJson<String>(purchaseOrderUuid),
      'salesOrderItemUuid': serializer.toJson<String?>(salesOrderItemUuid),
      'productUuid': serializer.toJson<String?>(productUuid),
      'productNameSnapshot': serializer.toJson<String>(productNameSnapshot),
      'productCodeSnapshot': serializer.toJson<String?>(productCodeSnapshot),
      'specificationSnapshot': serializer.toJson<String?>(
        specificationSnapshot,
      ),
      'quantityValue': serializer.toJson<double?>(quantityValue),
      'quantityUnit': serializer.toJson<String?>(quantityUnit),
      'unitCostAmount': serializer.toJson<int>(unitCostAmount),
      'totalCostAmount': serializer.toJson<int>(totalCostAmount),
      'itemStatus': serializer.toJson<String>(itemStatus),
    };
  }

  PurchaseOrderItem copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? purchaseOrderUuid,
    Value<String?> salesOrderItemUuid = const Value.absent(),
    Value<String?> productUuid = const Value.absent(),
    String? productNameSnapshot,
    Value<String?> productCodeSnapshot = const Value.absent(),
    Value<String?> specificationSnapshot = const Value.absent(),
    Value<double?> quantityValue = const Value.absent(),
    Value<String?> quantityUnit = const Value.absent(),
    int? unitCostAmount,
    int? totalCostAmount,
    String? itemStatus,
  }) => PurchaseOrderItem(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    purchaseOrderUuid: purchaseOrderUuid ?? this.purchaseOrderUuid,
    salesOrderItemUuid: salesOrderItemUuid.present
        ? salesOrderItemUuid.value
        : this.salesOrderItemUuid,
    productUuid: productUuid.present ? productUuid.value : this.productUuid,
    productNameSnapshot: productNameSnapshot ?? this.productNameSnapshot,
    productCodeSnapshot: productCodeSnapshot.present
        ? productCodeSnapshot.value
        : this.productCodeSnapshot,
    specificationSnapshot: specificationSnapshot.present
        ? specificationSnapshot.value
        : this.specificationSnapshot,
    quantityValue: quantityValue.present
        ? quantityValue.value
        : this.quantityValue,
    quantityUnit: quantityUnit.present ? quantityUnit.value : this.quantityUnit,
    unitCostAmount: unitCostAmount ?? this.unitCostAmount,
    totalCostAmount: totalCostAmount ?? this.totalCostAmount,
    itemStatus: itemStatus ?? this.itemStatus,
  );
  PurchaseOrderItem copyWithCompanion(PurchaseOrderItemsCompanion data) {
    return PurchaseOrderItem(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      purchaseOrderUuid: data.purchaseOrderUuid.present
          ? data.purchaseOrderUuid.value
          : this.purchaseOrderUuid,
      salesOrderItemUuid: data.salesOrderItemUuid.present
          ? data.salesOrderItemUuid.value
          : this.salesOrderItemUuid,
      productUuid: data.productUuid.present
          ? data.productUuid.value
          : this.productUuid,
      productNameSnapshot: data.productNameSnapshot.present
          ? data.productNameSnapshot.value
          : this.productNameSnapshot,
      productCodeSnapshot: data.productCodeSnapshot.present
          ? data.productCodeSnapshot.value
          : this.productCodeSnapshot,
      specificationSnapshot: data.specificationSnapshot.present
          ? data.specificationSnapshot.value
          : this.specificationSnapshot,
      quantityValue: data.quantityValue.present
          ? data.quantityValue.value
          : this.quantityValue,
      quantityUnit: data.quantityUnit.present
          ? data.quantityUnit.value
          : this.quantityUnit,
      unitCostAmount: data.unitCostAmount.present
          ? data.unitCostAmount.value
          : this.unitCostAmount,
      totalCostAmount: data.totalCostAmount.present
          ? data.totalCostAmount.value
          : this.totalCostAmount,
      itemStatus: data.itemStatus.present
          ? data.itemStatus.value
          : this.itemStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseOrderItem(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('purchaseOrderUuid: $purchaseOrderUuid, ')
          ..write('salesOrderItemUuid: $salesOrderItemUuid, ')
          ..write('productUuid: $productUuid, ')
          ..write('productNameSnapshot: $productNameSnapshot, ')
          ..write('productCodeSnapshot: $productCodeSnapshot, ')
          ..write('specificationSnapshot: $specificationSnapshot, ')
          ..write('quantityValue: $quantityValue, ')
          ..write('quantityUnit: $quantityUnit, ')
          ..write('unitCostAmount: $unitCostAmount, ')
          ..write('totalCostAmount: $totalCostAmount, ')
          ..write('itemStatus: $itemStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    purchaseOrderUuid,
    salesOrderItemUuid,
    productUuid,
    productNameSnapshot,
    productCodeSnapshot,
    specificationSnapshot,
    quantityValue,
    quantityUnit,
    unitCostAmount,
    totalCostAmount,
    itemStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseOrderItem &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.purchaseOrderUuid == this.purchaseOrderUuid &&
          other.salesOrderItemUuid == this.salesOrderItemUuid &&
          other.productUuid == this.productUuid &&
          other.productNameSnapshot == this.productNameSnapshot &&
          other.productCodeSnapshot == this.productCodeSnapshot &&
          other.specificationSnapshot == this.specificationSnapshot &&
          other.quantityValue == this.quantityValue &&
          other.quantityUnit == this.quantityUnit &&
          other.unitCostAmount == this.unitCostAmount &&
          other.totalCostAmount == this.totalCostAmount &&
          other.itemStatus == this.itemStatus);
}

class PurchaseOrderItemsCompanion extends UpdateCompanion<PurchaseOrderItem> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> purchaseOrderUuid;
  final Value<String?> salesOrderItemUuid;
  final Value<String?> productUuid;
  final Value<String> productNameSnapshot;
  final Value<String?> productCodeSnapshot;
  final Value<String?> specificationSnapshot;
  final Value<double?> quantityValue;
  final Value<String?> quantityUnit;
  final Value<int> unitCostAmount;
  final Value<int> totalCostAmount;
  final Value<String> itemStatus;
  const PurchaseOrderItemsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.purchaseOrderUuid = const Value.absent(),
    this.salesOrderItemUuid = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.productNameSnapshot = const Value.absent(),
    this.productCodeSnapshot = const Value.absent(),
    this.specificationSnapshot = const Value.absent(),
    this.quantityValue = const Value.absent(),
    this.quantityUnit = const Value.absent(),
    this.unitCostAmount = const Value.absent(),
    this.totalCostAmount = const Value.absent(),
    this.itemStatus = const Value.absent(),
  });
  PurchaseOrderItemsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String purchaseOrderUuid,
    this.salesOrderItemUuid = const Value.absent(),
    this.productUuid = const Value.absent(),
    required String productNameSnapshot,
    this.productCodeSnapshot = const Value.absent(),
    this.specificationSnapshot = const Value.absent(),
    this.quantityValue = const Value.absent(),
    this.quantityUnit = const Value.absent(),
    this.unitCostAmount = const Value.absent(),
    this.totalCostAmount = const Value.absent(),
    this.itemStatus = const Value.absent(),
  }) : uuid = Value(uuid),
       purchaseOrderUuid = Value(purchaseOrderUuid),
       productNameSnapshot = Value(productNameSnapshot);
  static Insertable<PurchaseOrderItem> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? purchaseOrderUuid,
    Expression<String>? salesOrderItemUuid,
    Expression<String>? productUuid,
    Expression<String>? productNameSnapshot,
    Expression<String>? productCodeSnapshot,
    Expression<String>? specificationSnapshot,
    Expression<double>? quantityValue,
    Expression<String>? quantityUnit,
    Expression<int>? unitCostAmount,
    Expression<int>? totalCostAmount,
    Expression<String>? itemStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (purchaseOrderUuid != null) 'purchase_order_uuid': purchaseOrderUuid,
      if (salesOrderItemUuid != null)
        'sales_order_item_uuid': salesOrderItemUuid,
      if (productUuid != null) 'product_uuid': productUuid,
      if (productNameSnapshot != null)
        'product_name_snapshot': productNameSnapshot,
      if (productCodeSnapshot != null)
        'product_code_snapshot': productCodeSnapshot,
      if (specificationSnapshot != null)
        'specification_snapshot': specificationSnapshot,
      if (quantityValue != null) 'quantity_value': quantityValue,
      if (quantityUnit != null) 'quantity_unit': quantityUnit,
      if (unitCostAmount != null) 'unit_cost_amount': unitCostAmount,
      if (totalCostAmount != null) 'total_cost_amount': totalCostAmount,
      if (itemStatus != null) 'item_status': itemStatus,
    });
  }

  PurchaseOrderItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? purchaseOrderUuid,
    Value<String?>? salesOrderItemUuid,
    Value<String?>? productUuid,
    Value<String>? productNameSnapshot,
    Value<String?>? productCodeSnapshot,
    Value<String?>? specificationSnapshot,
    Value<double?>? quantityValue,
    Value<String?>? quantityUnit,
    Value<int>? unitCostAmount,
    Value<int>? totalCostAmount,
    Value<String>? itemStatus,
  }) {
    return PurchaseOrderItemsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      purchaseOrderUuid: purchaseOrderUuid ?? this.purchaseOrderUuid,
      salesOrderItemUuid: salesOrderItemUuid ?? this.salesOrderItemUuid,
      productUuid: productUuid ?? this.productUuid,
      productNameSnapshot: productNameSnapshot ?? this.productNameSnapshot,
      productCodeSnapshot: productCodeSnapshot ?? this.productCodeSnapshot,
      specificationSnapshot:
          specificationSnapshot ?? this.specificationSnapshot,
      quantityValue: quantityValue ?? this.quantityValue,
      quantityUnit: quantityUnit ?? this.quantityUnit,
      unitCostAmount: unitCostAmount ?? this.unitCostAmount,
      totalCostAmount: totalCostAmount ?? this.totalCostAmount,
      itemStatus: itemStatus ?? this.itemStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (purchaseOrderUuid.present) {
      map['purchase_order_uuid'] = Variable<String>(purchaseOrderUuid.value);
    }
    if (salesOrderItemUuid.present) {
      map['sales_order_item_uuid'] = Variable<String>(salesOrderItemUuid.value);
    }
    if (productUuid.present) {
      map['product_uuid'] = Variable<String>(productUuid.value);
    }
    if (productNameSnapshot.present) {
      map['product_name_snapshot'] = Variable<String>(
        productNameSnapshot.value,
      );
    }
    if (productCodeSnapshot.present) {
      map['product_code_snapshot'] = Variable<String>(
        productCodeSnapshot.value,
      );
    }
    if (specificationSnapshot.present) {
      map['specification_snapshot'] = Variable<String>(
        specificationSnapshot.value,
      );
    }
    if (quantityValue.present) {
      map['quantity_value'] = Variable<double>(quantityValue.value);
    }
    if (quantityUnit.present) {
      map['quantity_unit'] = Variable<String>(quantityUnit.value);
    }
    if (unitCostAmount.present) {
      map['unit_cost_amount'] = Variable<int>(unitCostAmount.value);
    }
    if (totalCostAmount.present) {
      map['total_cost_amount'] = Variable<int>(totalCostAmount.value);
    }
    if (itemStatus.present) {
      map['item_status'] = Variable<String>(itemStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseOrderItemsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('purchaseOrderUuid: $purchaseOrderUuid, ')
          ..write('salesOrderItemUuid: $salesOrderItemUuid, ')
          ..write('productUuid: $productUuid, ')
          ..write('productNameSnapshot: $productNameSnapshot, ')
          ..write('productCodeSnapshot: $productCodeSnapshot, ')
          ..write('specificationSnapshot: $specificationSnapshot, ')
          ..write('quantityValue: $quantityValue, ')
          ..write('quantityUnit: $quantityUnit, ')
          ..write('unitCostAmount: $unitCostAmount, ')
          ..write('totalCostAmount: $totalCostAmount, ')
          ..write('itemStatus: $itemStatus')
          ..write(')'))
        .toString();
  }
}

class $ShipmentsTable extends Shipments
    with TableInfo<$ShipmentsTable, Shipment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShipmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shipmentNoMeta = const VerificationMeta(
    'shipmentNo',
  );
  @override
  late final GeneratedColumn<String> shipmentNo = GeneratedColumn<String>(
    'shipment_no',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 96,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _orderUuidMeta = const VerificationMeta(
    'orderUuid',
  );
  @override
  late final GeneratedColumn<String> orderUuid = GeneratedColumn<String>(
    'order_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _customerUuidMeta = const VerificationMeta(
    'customerUuid',
  );
  @override
  late final GeneratedColumn<String> customerUuid = GeneratedColumn<String>(
    'customer_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressUuidMeta = const VerificationMeta(
    'addressUuid',
  );
  @override
  late final GeneratedColumn<String> addressUuid = GeneratedColumn<String>(
    'address_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _carrierMeta = const VerificationMeta(
    'carrier',
  );
  @override
  late final GeneratedColumn<String> carrier = GeneratedColumn<String>(
    'carrier',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _trackingNoMeta = const VerificationMeta(
    'trackingNo',
  );
  @override
  late final GeneratedColumn<String> trackingNo = GeneratedColumn<String>(
    'tracking_no',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shipDateMeta = const VerificationMeta(
    'shipDate',
  );
  @override
  late final GeneratedColumn<DateTime> shipDate = GeneratedColumn<DateTime>(
    'ship_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shippingFeeMeta = const VerificationMeta(
    'shippingFee',
  );
  @override
  late final GeneratedColumn<int> shippingFee = GeneratedColumn<int>(
    'shipping_fee',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _shipmentStatusMeta = const VerificationMeta(
    'shipmentStatus',
  );
  @override
  late final GeneratedColumn<String> shipmentStatus = GeneratedColumn<String>(
    'shipment_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    shipmentNo,
    orderUuid,
    customerUuid,
    addressUuid,
    carrier,
    trackingNo,
    shipDate,
    shippingFee,
    shipmentStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shipments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Shipment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('shipment_no')) {
      context.handle(
        _shipmentNoMeta,
        shipmentNo.isAcceptableOrUnknown(data['shipment_no']!, _shipmentNoMeta),
      );
    } else if (isInserting) {
      context.missing(_shipmentNoMeta);
    }
    if (data.containsKey('order_uuid')) {
      context.handle(
        _orderUuidMeta,
        orderUuid.isAcceptableOrUnknown(data['order_uuid']!, _orderUuidMeta),
      );
    }
    if (data.containsKey('customer_uuid')) {
      context.handle(
        _customerUuidMeta,
        customerUuid.isAcceptableOrUnknown(
          data['customer_uuid']!,
          _customerUuidMeta,
        ),
      );
    }
    if (data.containsKey('address_uuid')) {
      context.handle(
        _addressUuidMeta,
        addressUuid.isAcceptableOrUnknown(
          data['address_uuid']!,
          _addressUuidMeta,
        ),
      );
    }
    if (data.containsKey('carrier')) {
      context.handle(
        _carrierMeta,
        carrier.isAcceptableOrUnknown(data['carrier']!, _carrierMeta),
      );
    }
    if (data.containsKey('tracking_no')) {
      context.handle(
        _trackingNoMeta,
        trackingNo.isAcceptableOrUnknown(data['tracking_no']!, _trackingNoMeta),
      );
    }
    if (data.containsKey('ship_date')) {
      context.handle(
        _shipDateMeta,
        shipDate.isAcceptableOrUnknown(data['ship_date']!, _shipDateMeta),
      );
    }
    if (data.containsKey('shipping_fee')) {
      context.handle(
        _shippingFeeMeta,
        shippingFee.isAcceptableOrUnknown(
          data['shipping_fee']!,
          _shippingFeeMeta,
        ),
      );
    }
    if (data.containsKey('shipment_status')) {
      context.handle(
        _shipmentStatusMeta,
        shipmentStatus.isAcceptableOrUnknown(
          data['shipment_status']!,
          _shipmentStatusMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Shipment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Shipment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      shipmentNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shipment_no'],
      )!,
      orderUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_uuid'],
      ),
      customerUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_uuid'],
      ),
      addressUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_uuid'],
      ),
      carrier: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}carrier'],
      ),
      trackingNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tracking_no'],
      ),
      shipDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ship_date'],
      ),
      shippingFee: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}shipping_fee'],
      )!,
      shipmentStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shipment_status'],
      )!,
    );
  }

  @override
  $ShipmentsTable createAlias(String alias) {
    return $ShipmentsTable(attachedDatabase, alias);
  }
}

class Shipment extends DataClass implements Insertable<Shipment> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String shipmentNo;
  final String? orderUuid;
  final String? customerUuid;
  final String? addressUuid;
  final String? carrier;
  final String? trackingNo;
  final DateTime? shipDate;
  final int shippingFee;
  final String shipmentStatus;
  const Shipment({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.shipmentNo,
    this.orderUuid,
    this.customerUuid,
    this.addressUuid,
    this.carrier,
    this.trackingNo,
    this.shipDate,
    required this.shippingFee,
    required this.shipmentStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['shipment_no'] = Variable<String>(shipmentNo);
    if (!nullToAbsent || orderUuid != null) {
      map['order_uuid'] = Variable<String>(orderUuid);
    }
    if (!nullToAbsent || customerUuid != null) {
      map['customer_uuid'] = Variable<String>(customerUuid);
    }
    if (!nullToAbsent || addressUuid != null) {
      map['address_uuid'] = Variable<String>(addressUuid);
    }
    if (!nullToAbsent || carrier != null) {
      map['carrier'] = Variable<String>(carrier);
    }
    if (!nullToAbsent || trackingNo != null) {
      map['tracking_no'] = Variable<String>(trackingNo);
    }
    if (!nullToAbsent || shipDate != null) {
      map['ship_date'] = Variable<DateTime>(shipDate);
    }
    map['shipping_fee'] = Variable<int>(shippingFee);
    map['shipment_status'] = Variable<String>(shipmentStatus);
    return map;
  }

  ShipmentsCompanion toCompanion(bool nullToAbsent) {
    return ShipmentsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      shipmentNo: Value(shipmentNo),
      orderUuid: orderUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(orderUuid),
      customerUuid: customerUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(customerUuid),
      addressUuid: addressUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(addressUuid),
      carrier: carrier == null && nullToAbsent
          ? const Value.absent()
          : Value(carrier),
      trackingNo: trackingNo == null && nullToAbsent
          ? const Value.absent()
          : Value(trackingNo),
      shipDate: shipDate == null && nullToAbsent
          ? const Value.absent()
          : Value(shipDate),
      shippingFee: Value(shippingFee),
      shipmentStatus: Value(shipmentStatus),
    );
  }

  factory Shipment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Shipment(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      shipmentNo: serializer.fromJson<String>(json['shipmentNo']),
      orderUuid: serializer.fromJson<String?>(json['orderUuid']),
      customerUuid: serializer.fromJson<String?>(json['customerUuid']),
      addressUuid: serializer.fromJson<String?>(json['addressUuid']),
      carrier: serializer.fromJson<String?>(json['carrier']),
      trackingNo: serializer.fromJson<String?>(json['trackingNo']),
      shipDate: serializer.fromJson<DateTime?>(json['shipDate']),
      shippingFee: serializer.fromJson<int>(json['shippingFee']),
      shipmentStatus: serializer.fromJson<String>(json['shipmentStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'shipmentNo': serializer.toJson<String>(shipmentNo),
      'orderUuid': serializer.toJson<String?>(orderUuid),
      'customerUuid': serializer.toJson<String?>(customerUuid),
      'addressUuid': serializer.toJson<String?>(addressUuid),
      'carrier': serializer.toJson<String?>(carrier),
      'trackingNo': serializer.toJson<String?>(trackingNo),
      'shipDate': serializer.toJson<DateTime?>(shipDate),
      'shippingFee': serializer.toJson<int>(shippingFee),
      'shipmentStatus': serializer.toJson<String>(shipmentStatus),
    };
  }

  Shipment copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? shipmentNo,
    Value<String?> orderUuid = const Value.absent(),
    Value<String?> customerUuid = const Value.absent(),
    Value<String?> addressUuid = const Value.absent(),
    Value<String?> carrier = const Value.absent(),
    Value<String?> trackingNo = const Value.absent(),
    Value<DateTime?> shipDate = const Value.absent(),
    int? shippingFee,
    String? shipmentStatus,
  }) => Shipment(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    shipmentNo: shipmentNo ?? this.shipmentNo,
    orderUuid: orderUuid.present ? orderUuid.value : this.orderUuid,
    customerUuid: customerUuid.present ? customerUuid.value : this.customerUuid,
    addressUuid: addressUuid.present ? addressUuid.value : this.addressUuid,
    carrier: carrier.present ? carrier.value : this.carrier,
    trackingNo: trackingNo.present ? trackingNo.value : this.trackingNo,
    shipDate: shipDate.present ? shipDate.value : this.shipDate,
    shippingFee: shippingFee ?? this.shippingFee,
    shipmentStatus: shipmentStatus ?? this.shipmentStatus,
  );
  Shipment copyWithCompanion(ShipmentsCompanion data) {
    return Shipment(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      shipmentNo: data.shipmentNo.present
          ? data.shipmentNo.value
          : this.shipmentNo,
      orderUuid: data.orderUuid.present ? data.orderUuid.value : this.orderUuid,
      customerUuid: data.customerUuid.present
          ? data.customerUuid.value
          : this.customerUuid,
      addressUuid: data.addressUuid.present
          ? data.addressUuid.value
          : this.addressUuid,
      carrier: data.carrier.present ? data.carrier.value : this.carrier,
      trackingNo: data.trackingNo.present
          ? data.trackingNo.value
          : this.trackingNo,
      shipDate: data.shipDate.present ? data.shipDate.value : this.shipDate,
      shippingFee: data.shippingFee.present
          ? data.shippingFee.value
          : this.shippingFee,
      shipmentStatus: data.shipmentStatus.present
          ? data.shipmentStatus.value
          : this.shipmentStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Shipment(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('shipmentNo: $shipmentNo, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('customerUuid: $customerUuid, ')
          ..write('addressUuid: $addressUuid, ')
          ..write('carrier: $carrier, ')
          ..write('trackingNo: $trackingNo, ')
          ..write('shipDate: $shipDate, ')
          ..write('shippingFee: $shippingFee, ')
          ..write('shipmentStatus: $shipmentStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    shipmentNo,
    orderUuid,
    customerUuid,
    addressUuid,
    carrier,
    trackingNo,
    shipDate,
    shippingFee,
    shipmentStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Shipment &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.shipmentNo == this.shipmentNo &&
          other.orderUuid == this.orderUuid &&
          other.customerUuid == this.customerUuid &&
          other.addressUuid == this.addressUuid &&
          other.carrier == this.carrier &&
          other.trackingNo == this.trackingNo &&
          other.shipDate == this.shipDate &&
          other.shippingFee == this.shippingFee &&
          other.shipmentStatus == this.shipmentStatus);
}

class ShipmentsCompanion extends UpdateCompanion<Shipment> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> shipmentNo;
  final Value<String?> orderUuid;
  final Value<String?> customerUuid;
  final Value<String?> addressUuid;
  final Value<String?> carrier;
  final Value<String?> trackingNo;
  final Value<DateTime?> shipDate;
  final Value<int> shippingFee;
  final Value<String> shipmentStatus;
  const ShipmentsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.shipmentNo = const Value.absent(),
    this.orderUuid = const Value.absent(),
    this.customerUuid = const Value.absent(),
    this.addressUuid = const Value.absent(),
    this.carrier = const Value.absent(),
    this.trackingNo = const Value.absent(),
    this.shipDate = const Value.absent(),
    this.shippingFee = const Value.absent(),
    this.shipmentStatus = const Value.absent(),
  });
  ShipmentsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String shipmentNo,
    this.orderUuid = const Value.absent(),
    this.customerUuid = const Value.absent(),
    this.addressUuid = const Value.absent(),
    this.carrier = const Value.absent(),
    this.trackingNo = const Value.absent(),
    this.shipDate = const Value.absent(),
    this.shippingFee = const Value.absent(),
    this.shipmentStatus = const Value.absent(),
  }) : uuid = Value(uuid),
       shipmentNo = Value(shipmentNo);
  static Insertable<Shipment> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? shipmentNo,
    Expression<String>? orderUuid,
    Expression<String>? customerUuid,
    Expression<String>? addressUuid,
    Expression<String>? carrier,
    Expression<String>? trackingNo,
    Expression<DateTime>? shipDate,
    Expression<int>? shippingFee,
    Expression<String>? shipmentStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (shipmentNo != null) 'shipment_no': shipmentNo,
      if (orderUuid != null) 'order_uuid': orderUuid,
      if (customerUuid != null) 'customer_uuid': customerUuid,
      if (addressUuid != null) 'address_uuid': addressUuid,
      if (carrier != null) 'carrier': carrier,
      if (trackingNo != null) 'tracking_no': trackingNo,
      if (shipDate != null) 'ship_date': shipDate,
      if (shippingFee != null) 'shipping_fee': shippingFee,
      if (shipmentStatus != null) 'shipment_status': shipmentStatus,
    });
  }

  ShipmentsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? shipmentNo,
    Value<String?>? orderUuid,
    Value<String?>? customerUuid,
    Value<String?>? addressUuid,
    Value<String?>? carrier,
    Value<String?>? trackingNo,
    Value<DateTime?>? shipDate,
    Value<int>? shippingFee,
    Value<String>? shipmentStatus,
  }) {
    return ShipmentsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      shipmentNo: shipmentNo ?? this.shipmentNo,
      orderUuid: orderUuid ?? this.orderUuid,
      customerUuid: customerUuid ?? this.customerUuid,
      addressUuid: addressUuid ?? this.addressUuid,
      carrier: carrier ?? this.carrier,
      trackingNo: trackingNo ?? this.trackingNo,
      shipDate: shipDate ?? this.shipDate,
      shippingFee: shippingFee ?? this.shippingFee,
      shipmentStatus: shipmentStatus ?? this.shipmentStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (shipmentNo.present) {
      map['shipment_no'] = Variable<String>(shipmentNo.value);
    }
    if (orderUuid.present) {
      map['order_uuid'] = Variable<String>(orderUuid.value);
    }
    if (customerUuid.present) {
      map['customer_uuid'] = Variable<String>(customerUuid.value);
    }
    if (addressUuid.present) {
      map['address_uuid'] = Variable<String>(addressUuid.value);
    }
    if (carrier.present) {
      map['carrier'] = Variable<String>(carrier.value);
    }
    if (trackingNo.present) {
      map['tracking_no'] = Variable<String>(trackingNo.value);
    }
    if (shipDate.present) {
      map['ship_date'] = Variable<DateTime>(shipDate.value);
    }
    if (shippingFee.present) {
      map['shipping_fee'] = Variable<int>(shippingFee.value);
    }
    if (shipmentStatus.present) {
      map['shipment_status'] = Variable<String>(shipmentStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShipmentsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('shipmentNo: $shipmentNo, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('customerUuid: $customerUuid, ')
          ..write('addressUuid: $addressUuid, ')
          ..write('carrier: $carrier, ')
          ..write('trackingNo: $trackingNo, ')
          ..write('shipDate: $shipDate, ')
          ..write('shippingFee: $shippingFee, ')
          ..write('shipmentStatus: $shipmentStatus')
          ..write(')'))
        .toString();
  }
}

class $ShipmentItemsTable extends ShipmentItems
    with TableInfo<$ShipmentItemsTable, ShipmentItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShipmentItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shipmentUuidMeta = const VerificationMeta(
    'shipmentUuid',
  );
  @override
  late final GeneratedColumn<String> shipmentUuid = GeneratedColumn<String>(
    'shipment_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderUuidMeta = const VerificationMeta(
    'orderUuid',
  );
  @override
  late final GeneratedColumn<String> orderUuid = GeneratedColumn<String>(
    'order_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderItemUuidMeta = const VerificationMeta(
    'orderItemUuid',
  );
  @override
  late final GeneratedColumn<String> orderItemUuid = GeneratedColumn<String>(
    'order_item_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productUuidMeta = const VerificationMeta(
    'productUuid',
  );
  @override
  late final GeneratedColumn<String> productUuid = GeneratedColumn<String>(
    'product_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityValueMeta = const VerificationMeta(
    'quantityValue',
  );
  @override
  late final GeneratedColumn<double> quantityValue = GeneratedColumn<double>(
    'quantity_value',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityUnitMeta = const VerificationMeta(
    'quantityUnit',
  );
  @override
  late final GeneratedColumn<String> quantityUnit = GeneratedColumn<String>(
    'quantity_unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _itemStatusMeta = const VerificationMeta(
    'itemStatus',
  );
  @override
  late final GeneratedColumn<String> itemStatus = GeneratedColumn<String>(
    'item_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    shipmentUuid,
    orderUuid,
    orderItemUuid,
    productUuid,
    quantityValue,
    quantityUnit,
    itemStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shipment_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShipmentItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('shipment_uuid')) {
      context.handle(
        _shipmentUuidMeta,
        shipmentUuid.isAcceptableOrUnknown(
          data['shipment_uuid']!,
          _shipmentUuidMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shipmentUuidMeta);
    }
    if (data.containsKey('order_uuid')) {
      context.handle(
        _orderUuidMeta,
        orderUuid.isAcceptableOrUnknown(data['order_uuid']!, _orderUuidMeta),
      );
    }
    if (data.containsKey('order_item_uuid')) {
      context.handle(
        _orderItemUuidMeta,
        orderItemUuid.isAcceptableOrUnknown(
          data['order_item_uuid']!,
          _orderItemUuidMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_orderItemUuidMeta);
    }
    if (data.containsKey('product_uuid')) {
      context.handle(
        _productUuidMeta,
        productUuid.isAcceptableOrUnknown(
          data['product_uuid']!,
          _productUuidMeta,
        ),
      );
    }
    if (data.containsKey('quantity_value')) {
      context.handle(
        _quantityValueMeta,
        quantityValue.isAcceptableOrUnknown(
          data['quantity_value']!,
          _quantityValueMeta,
        ),
      );
    }
    if (data.containsKey('quantity_unit')) {
      context.handle(
        _quantityUnitMeta,
        quantityUnit.isAcceptableOrUnknown(
          data['quantity_unit']!,
          _quantityUnitMeta,
        ),
      );
    }
    if (data.containsKey('item_status')) {
      context.handle(
        _itemStatusMeta,
        itemStatus.isAcceptableOrUnknown(data['item_status']!, _itemStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShipmentItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShipmentItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      shipmentUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shipment_uuid'],
      )!,
      orderUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_uuid'],
      ),
      orderItemUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_item_uuid'],
      )!,
      productUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_uuid'],
      ),
      quantityValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity_value'],
      ),
      quantityUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quantity_unit'],
      ),
      itemStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_status'],
      )!,
    );
  }

  @override
  $ShipmentItemsTable createAlias(String alias) {
    return $ShipmentItemsTable(attachedDatabase, alias);
  }
}

class ShipmentItem extends DataClass implements Insertable<ShipmentItem> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String shipmentUuid;
  final String? orderUuid;
  final String orderItemUuid;
  final String? productUuid;
  final double? quantityValue;
  final String? quantityUnit;
  final String itemStatus;
  const ShipmentItem({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.shipmentUuid,
    this.orderUuid,
    required this.orderItemUuid,
    this.productUuid,
    this.quantityValue,
    this.quantityUnit,
    required this.itemStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['shipment_uuid'] = Variable<String>(shipmentUuid);
    if (!nullToAbsent || orderUuid != null) {
      map['order_uuid'] = Variable<String>(orderUuid);
    }
    map['order_item_uuid'] = Variable<String>(orderItemUuid);
    if (!nullToAbsent || productUuid != null) {
      map['product_uuid'] = Variable<String>(productUuid);
    }
    if (!nullToAbsent || quantityValue != null) {
      map['quantity_value'] = Variable<double>(quantityValue);
    }
    if (!nullToAbsent || quantityUnit != null) {
      map['quantity_unit'] = Variable<String>(quantityUnit);
    }
    map['item_status'] = Variable<String>(itemStatus);
    return map;
  }

  ShipmentItemsCompanion toCompanion(bool nullToAbsent) {
    return ShipmentItemsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      shipmentUuid: Value(shipmentUuid),
      orderUuid: orderUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(orderUuid),
      orderItemUuid: Value(orderItemUuid),
      productUuid: productUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(productUuid),
      quantityValue: quantityValue == null && nullToAbsent
          ? const Value.absent()
          : Value(quantityValue),
      quantityUnit: quantityUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(quantityUnit),
      itemStatus: Value(itemStatus),
    );
  }

  factory ShipmentItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShipmentItem(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      shipmentUuid: serializer.fromJson<String>(json['shipmentUuid']),
      orderUuid: serializer.fromJson<String?>(json['orderUuid']),
      orderItemUuid: serializer.fromJson<String>(json['orderItemUuid']),
      productUuid: serializer.fromJson<String?>(json['productUuid']),
      quantityValue: serializer.fromJson<double?>(json['quantityValue']),
      quantityUnit: serializer.fromJson<String?>(json['quantityUnit']),
      itemStatus: serializer.fromJson<String>(json['itemStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'shipmentUuid': serializer.toJson<String>(shipmentUuid),
      'orderUuid': serializer.toJson<String?>(orderUuid),
      'orderItemUuid': serializer.toJson<String>(orderItemUuid),
      'productUuid': serializer.toJson<String?>(productUuid),
      'quantityValue': serializer.toJson<double?>(quantityValue),
      'quantityUnit': serializer.toJson<String?>(quantityUnit),
      'itemStatus': serializer.toJson<String>(itemStatus),
    };
  }

  ShipmentItem copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? shipmentUuid,
    Value<String?> orderUuid = const Value.absent(),
    String? orderItemUuid,
    Value<String?> productUuid = const Value.absent(),
    Value<double?> quantityValue = const Value.absent(),
    Value<String?> quantityUnit = const Value.absent(),
    String? itemStatus,
  }) => ShipmentItem(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    shipmentUuid: shipmentUuid ?? this.shipmentUuid,
    orderUuid: orderUuid.present ? orderUuid.value : this.orderUuid,
    orderItemUuid: orderItemUuid ?? this.orderItemUuid,
    productUuid: productUuid.present ? productUuid.value : this.productUuid,
    quantityValue: quantityValue.present
        ? quantityValue.value
        : this.quantityValue,
    quantityUnit: quantityUnit.present ? quantityUnit.value : this.quantityUnit,
    itemStatus: itemStatus ?? this.itemStatus,
  );
  ShipmentItem copyWithCompanion(ShipmentItemsCompanion data) {
    return ShipmentItem(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      shipmentUuid: data.shipmentUuid.present
          ? data.shipmentUuid.value
          : this.shipmentUuid,
      orderUuid: data.orderUuid.present ? data.orderUuid.value : this.orderUuid,
      orderItemUuid: data.orderItemUuid.present
          ? data.orderItemUuid.value
          : this.orderItemUuid,
      productUuid: data.productUuid.present
          ? data.productUuid.value
          : this.productUuid,
      quantityValue: data.quantityValue.present
          ? data.quantityValue.value
          : this.quantityValue,
      quantityUnit: data.quantityUnit.present
          ? data.quantityUnit.value
          : this.quantityUnit,
      itemStatus: data.itemStatus.present
          ? data.itemStatus.value
          : this.itemStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShipmentItem(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('shipmentUuid: $shipmentUuid, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('orderItemUuid: $orderItemUuid, ')
          ..write('productUuid: $productUuid, ')
          ..write('quantityValue: $quantityValue, ')
          ..write('quantityUnit: $quantityUnit, ')
          ..write('itemStatus: $itemStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    shipmentUuid,
    orderUuid,
    orderItemUuid,
    productUuid,
    quantityValue,
    quantityUnit,
    itemStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShipmentItem &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.shipmentUuid == this.shipmentUuid &&
          other.orderUuid == this.orderUuid &&
          other.orderItemUuid == this.orderItemUuid &&
          other.productUuid == this.productUuid &&
          other.quantityValue == this.quantityValue &&
          other.quantityUnit == this.quantityUnit &&
          other.itemStatus == this.itemStatus);
}

class ShipmentItemsCompanion extends UpdateCompanion<ShipmentItem> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> shipmentUuid;
  final Value<String?> orderUuid;
  final Value<String> orderItemUuid;
  final Value<String?> productUuid;
  final Value<double?> quantityValue;
  final Value<String?> quantityUnit;
  final Value<String> itemStatus;
  const ShipmentItemsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.shipmentUuid = const Value.absent(),
    this.orderUuid = const Value.absent(),
    this.orderItemUuid = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.quantityValue = const Value.absent(),
    this.quantityUnit = const Value.absent(),
    this.itemStatus = const Value.absent(),
  });
  ShipmentItemsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String shipmentUuid,
    this.orderUuid = const Value.absent(),
    required String orderItemUuid,
    this.productUuid = const Value.absent(),
    this.quantityValue = const Value.absent(),
    this.quantityUnit = const Value.absent(),
    this.itemStatus = const Value.absent(),
  }) : uuid = Value(uuid),
       shipmentUuid = Value(shipmentUuid),
       orderItemUuid = Value(orderItemUuid);
  static Insertable<ShipmentItem> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? shipmentUuid,
    Expression<String>? orderUuid,
    Expression<String>? orderItemUuid,
    Expression<String>? productUuid,
    Expression<double>? quantityValue,
    Expression<String>? quantityUnit,
    Expression<String>? itemStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (shipmentUuid != null) 'shipment_uuid': shipmentUuid,
      if (orderUuid != null) 'order_uuid': orderUuid,
      if (orderItemUuid != null) 'order_item_uuid': orderItemUuid,
      if (productUuid != null) 'product_uuid': productUuid,
      if (quantityValue != null) 'quantity_value': quantityValue,
      if (quantityUnit != null) 'quantity_unit': quantityUnit,
      if (itemStatus != null) 'item_status': itemStatus,
    });
  }

  ShipmentItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? shipmentUuid,
    Value<String?>? orderUuid,
    Value<String>? orderItemUuid,
    Value<String?>? productUuid,
    Value<double?>? quantityValue,
    Value<String?>? quantityUnit,
    Value<String>? itemStatus,
  }) {
    return ShipmentItemsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      shipmentUuid: shipmentUuid ?? this.shipmentUuid,
      orderUuid: orderUuid ?? this.orderUuid,
      orderItemUuid: orderItemUuid ?? this.orderItemUuid,
      productUuid: productUuid ?? this.productUuid,
      quantityValue: quantityValue ?? this.quantityValue,
      quantityUnit: quantityUnit ?? this.quantityUnit,
      itemStatus: itemStatus ?? this.itemStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (shipmentUuid.present) {
      map['shipment_uuid'] = Variable<String>(shipmentUuid.value);
    }
    if (orderUuid.present) {
      map['order_uuid'] = Variable<String>(orderUuid.value);
    }
    if (orderItemUuid.present) {
      map['order_item_uuid'] = Variable<String>(orderItemUuid.value);
    }
    if (productUuid.present) {
      map['product_uuid'] = Variable<String>(productUuid.value);
    }
    if (quantityValue.present) {
      map['quantity_value'] = Variable<double>(quantityValue.value);
    }
    if (quantityUnit.present) {
      map['quantity_unit'] = Variable<String>(quantityUnit.value);
    }
    if (itemStatus.present) {
      map['item_status'] = Variable<String>(itemStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShipmentItemsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('shipmentUuid: $shipmentUuid, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('orderItemUuid: $orderItemUuid, ')
          ..write('productUuid: $productUuid, ')
          ..write('quantityValue: $quantityValue, ')
          ..write('quantityUnit: $quantityUnit, ')
          ..write('itemStatus: $itemStatus')
          ..write(')'))
        .toString();
  }
}

class $InventoryItemsTable extends InventoryItems
    with TableInfo<$InventoryItemsTable, InventoryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productUuidMeta = const VerificationMeta(
    'productUuid',
  );
  @override
  late final GeneratedColumn<String> productUuid = GeneratedColumn<String>(
    'product_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productNameSnapshotMeta =
      const VerificationMeta('productNameSnapshot');
  @override
  late final GeneratedColumn<String> productNameSnapshot =
      GeneratedColumn<String>(
        'product_name_snapshot',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _productCodeSnapshotMeta =
      const VerificationMeta('productCodeSnapshot');
  @override
  late final GeneratedColumn<String> productCodeSnapshot =
      GeneratedColumn<String>(
        'product_code_snapshot',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _specificationSnapshotMeta =
      const VerificationMeta('specificationSnapshot');
  @override
  late final GeneratedColumn<String> specificationSnapshot =
      GeneratedColumn<String>(
        'specification_snapshot',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _quantityValueMeta = const VerificationMeta(
    'quantityValue',
  );
  @override
  late final GeneratedColumn<double> quantityValue = GeneratedColumn<double>(
    'quantity_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _quantityUnitMeta = const VerificationMeta(
    'quantityUnit',
  );
  @override
  late final GeneratedColumn<String> quantityUnit = GeneratedColumn<String>(
    'quantity_unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _warehouseNameMeta = const VerificationMeta(
    'warehouseName',
  );
  @override
  late final GeneratedColumn<String> warehouseName = GeneratedColumn<String>(
    'warehouse_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _inventoryStatusMeta = const VerificationMeta(
    'inventoryStatus',
  );
  @override
  late final GeneratedColumn<String> inventoryStatus = GeneratedColumn<String>(
    'inventory_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    productUuid,
    productNameSnapshot,
    productCodeSnapshot,
    specificationSnapshot,
    quantityValue,
    quantityUnit,
    warehouseName,
    inventoryStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<InventoryItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('product_uuid')) {
      context.handle(
        _productUuidMeta,
        productUuid.isAcceptableOrUnknown(
          data['product_uuid']!,
          _productUuidMeta,
        ),
      );
    }
    if (data.containsKey('product_name_snapshot')) {
      context.handle(
        _productNameSnapshotMeta,
        productNameSnapshot.isAcceptableOrUnknown(
          data['product_name_snapshot']!,
          _productNameSnapshotMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productNameSnapshotMeta);
    }
    if (data.containsKey('product_code_snapshot')) {
      context.handle(
        _productCodeSnapshotMeta,
        productCodeSnapshot.isAcceptableOrUnknown(
          data['product_code_snapshot']!,
          _productCodeSnapshotMeta,
        ),
      );
    }
    if (data.containsKey('specification_snapshot')) {
      context.handle(
        _specificationSnapshotMeta,
        specificationSnapshot.isAcceptableOrUnknown(
          data['specification_snapshot']!,
          _specificationSnapshotMeta,
        ),
      );
    }
    if (data.containsKey('quantity_value')) {
      context.handle(
        _quantityValueMeta,
        quantityValue.isAcceptableOrUnknown(
          data['quantity_value']!,
          _quantityValueMeta,
        ),
      );
    }
    if (data.containsKey('quantity_unit')) {
      context.handle(
        _quantityUnitMeta,
        quantityUnit.isAcceptableOrUnknown(
          data['quantity_unit']!,
          _quantityUnitMeta,
        ),
      );
    }
    if (data.containsKey('warehouse_name')) {
      context.handle(
        _warehouseNameMeta,
        warehouseName.isAcceptableOrUnknown(
          data['warehouse_name']!,
          _warehouseNameMeta,
        ),
      );
    }
    if (data.containsKey('inventory_status')) {
      context.handle(
        _inventoryStatusMeta,
        inventoryStatus.isAcceptableOrUnknown(
          data['inventory_status']!,
          _inventoryStatusMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      productUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_uuid'],
      ),
      productNameSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_name_snapshot'],
      )!,
      productCodeSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_code_snapshot'],
      ),
      specificationSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}specification_snapshot'],
      ),
      quantityValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity_value'],
      )!,
      quantityUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quantity_unit'],
      ),
      warehouseName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}warehouse_name'],
      ),
      inventoryStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}inventory_status'],
      )!,
    );
  }

  @override
  $InventoryItemsTable createAlias(String alias) {
    return $InventoryItemsTable(attachedDatabase, alias);
  }
}

class InventoryItem extends DataClass implements Insertable<InventoryItem> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String? productUuid;
  final String productNameSnapshot;
  final String? productCodeSnapshot;
  final String? specificationSnapshot;
  final double quantityValue;
  final String? quantityUnit;
  final String? warehouseName;
  final String inventoryStatus;
  const InventoryItem({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    this.productUuid,
    required this.productNameSnapshot,
    this.productCodeSnapshot,
    this.specificationSnapshot,
    required this.quantityValue,
    this.quantityUnit,
    this.warehouseName,
    required this.inventoryStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    if (!nullToAbsent || productUuid != null) {
      map['product_uuid'] = Variable<String>(productUuid);
    }
    map['product_name_snapshot'] = Variable<String>(productNameSnapshot);
    if (!nullToAbsent || productCodeSnapshot != null) {
      map['product_code_snapshot'] = Variable<String>(productCodeSnapshot);
    }
    if (!nullToAbsent || specificationSnapshot != null) {
      map['specification_snapshot'] = Variable<String>(specificationSnapshot);
    }
    map['quantity_value'] = Variable<double>(quantityValue);
    if (!nullToAbsent || quantityUnit != null) {
      map['quantity_unit'] = Variable<String>(quantityUnit);
    }
    if (!nullToAbsent || warehouseName != null) {
      map['warehouse_name'] = Variable<String>(warehouseName);
    }
    map['inventory_status'] = Variable<String>(inventoryStatus);
    return map;
  }

  InventoryItemsCompanion toCompanion(bool nullToAbsent) {
    return InventoryItemsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      productUuid: productUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(productUuid),
      productNameSnapshot: Value(productNameSnapshot),
      productCodeSnapshot: productCodeSnapshot == null && nullToAbsent
          ? const Value.absent()
          : Value(productCodeSnapshot),
      specificationSnapshot: specificationSnapshot == null && nullToAbsent
          ? const Value.absent()
          : Value(specificationSnapshot),
      quantityValue: Value(quantityValue),
      quantityUnit: quantityUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(quantityUnit),
      warehouseName: warehouseName == null && nullToAbsent
          ? const Value.absent()
          : Value(warehouseName),
      inventoryStatus: Value(inventoryStatus),
    );
  }

  factory InventoryItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryItem(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      productUuid: serializer.fromJson<String?>(json['productUuid']),
      productNameSnapshot: serializer.fromJson<String>(
        json['productNameSnapshot'],
      ),
      productCodeSnapshot: serializer.fromJson<String?>(
        json['productCodeSnapshot'],
      ),
      specificationSnapshot: serializer.fromJson<String?>(
        json['specificationSnapshot'],
      ),
      quantityValue: serializer.fromJson<double>(json['quantityValue']),
      quantityUnit: serializer.fromJson<String?>(json['quantityUnit']),
      warehouseName: serializer.fromJson<String?>(json['warehouseName']),
      inventoryStatus: serializer.fromJson<String>(json['inventoryStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'productUuid': serializer.toJson<String?>(productUuid),
      'productNameSnapshot': serializer.toJson<String>(productNameSnapshot),
      'productCodeSnapshot': serializer.toJson<String?>(productCodeSnapshot),
      'specificationSnapshot': serializer.toJson<String?>(
        specificationSnapshot,
      ),
      'quantityValue': serializer.toJson<double>(quantityValue),
      'quantityUnit': serializer.toJson<String?>(quantityUnit),
      'warehouseName': serializer.toJson<String?>(warehouseName),
      'inventoryStatus': serializer.toJson<String>(inventoryStatus),
    };
  }

  InventoryItem copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    Value<String?> productUuid = const Value.absent(),
    String? productNameSnapshot,
    Value<String?> productCodeSnapshot = const Value.absent(),
    Value<String?> specificationSnapshot = const Value.absent(),
    double? quantityValue,
    Value<String?> quantityUnit = const Value.absent(),
    Value<String?> warehouseName = const Value.absent(),
    String? inventoryStatus,
  }) => InventoryItem(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    productUuid: productUuid.present ? productUuid.value : this.productUuid,
    productNameSnapshot: productNameSnapshot ?? this.productNameSnapshot,
    productCodeSnapshot: productCodeSnapshot.present
        ? productCodeSnapshot.value
        : this.productCodeSnapshot,
    specificationSnapshot: specificationSnapshot.present
        ? specificationSnapshot.value
        : this.specificationSnapshot,
    quantityValue: quantityValue ?? this.quantityValue,
    quantityUnit: quantityUnit.present ? quantityUnit.value : this.quantityUnit,
    warehouseName: warehouseName.present
        ? warehouseName.value
        : this.warehouseName,
    inventoryStatus: inventoryStatus ?? this.inventoryStatus,
  );
  InventoryItem copyWithCompanion(InventoryItemsCompanion data) {
    return InventoryItem(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      productUuid: data.productUuid.present
          ? data.productUuid.value
          : this.productUuid,
      productNameSnapshot: data.productNameSnapshot.present
          ? data.productNameSnapshot.value
          : this.productNameSnapshot,
      productCodeSnapshot: data.productCodeSnapshot.present
          ? data.productCodeSnapshot.value
          : this.productCodeSnapshot,
      specificationSnapshot: data.specificationSnapshot.present
          ? data.specificationSnapshot.value
          : this.specificationSnapshot,
      quantityValue: data.quantityValue.present
          ? data.quantityValue.value
          : this.quantityValue,
      quantityUnit: data.quantityUnit.present
          ? data.quantityUnit.value
          : this.quantityUnit,
      warehouseName: data.warehouseName.present
          ? data.warehouseName.value
          : this.warehouseName,
      inventoryStatus: data.inventoryStatus.present
          ? data.inventoryStatus.value
          : this.inventoryStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryItem(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('productUuid: $productUuid, ')
          ..write('productNameSnapshot: $productNameSnapshot, ')
          ..write('productCodeSnapshot: $productCodeSnapshot, ')
          ..write('specificationSnapshot: $specificationSnapshot, ')
          ..write('quantityValue: $quantityValue, ')
          ..write('quantityUnit: $quantityUnit, ')
          ..write('warehouseName: $warehouseName, ')
          ..write('inventoryStatus: $inventoryStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    productUuid,
    productNameSnapshot,
    productCodeSnapshot,
    specificationSnapshot,
    quantityValue,
    quantityUnit,
    warehouseName,
    inventoryStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryItem &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.productUuid == this.productUuid &&
          other.productNameSnapshot == this.productNameSnapshot &&
          other.productCodeSnapshot == this.productCodeSnapshot &&
          other.specificationSnapshot == this.specificationSnapshot &&
          other.quantityValue == this.quantityValue &&
          other.quantityUnit == this.quantityUnit &&
          other.warehouseName == this.warehouseName &&
          other.inventoryStatus == this.inventoryStatus);
}

class InventoryItemsCompanion extends UpdateCompanion<InventoryItem> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String?> productUuid;
  final Value<String> productNameSnapshot;
  final Value<String?> productCodeSnapshot;
  final Value<String?> specificationSnapshot;
  final Value<double> quantityValue;
  final Value<String?> quantityUnit;
  final Value<String?> warehouseName;
  final Value<String> inventoryStatus;
  const InventoryItemsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.productNameSnapshot = const Value.absent(),
    this.productCodeSnapshot = const Value.absent(),
    this.specificationSnapshot = const Value.absent(),
    this.quantityValue = const Value.absent(),
    this.quantityUnit = const Value.absent(),
    this.warehouseName = const Value.absent(),
    this.inventoryStatus = const Value.absent(),
  });
  InventoryItemsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.productUuid = const Value.absent(),
    required String productNameSnapshot,
    this.productCodeSnapshot = const Value.absent(),
    this.specificationSnapshot = const Value.absent(),
    this.quantityValue = const Value.absent(),
    this.quantityUnit = const Value.absent(),
    this.warehouseName = const Value.absent(),
    this.inventoryStatus = const Value.absent(),
  }) : uuid = Value(uuid),
       productNameSnapshot = Value(productNameSnapshot);
  static Insertable<InventoryItem> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? productUuid,
    Expression<String>? productNameSnapshot,
    Expression<String>? productCodeSnapshot,
    Expression<String>? specificationSnapshot,
    Expression<double>? quantityValue,
    Expression<String>? quantityUnit,
    Expression<String>? warehouseName,
    Expression<String>? inventoryStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (productUuid != null) 'product_uuid': productUuid,
      if (productNameSnapshot != null)
        'product_name_snapshot': productNameSnapshot,
      if (productCodeSnapshot != null)
        'product_code_snapshot': productCodeSnapshot,
      if (specificationSnapshot != null)
        'specification_snapshot': specificationSnapshot,
      if (quantityValue != null) 'quantity_value': quantityValue,
      if (quantityUnit != null) 'quantity_unit': quantityUnit,
      if (warehouseName != null) 'warehouse_name': warehouseName,
      if (inventoryStatus != null) 'inventory_status': inventoryStatus,
    });
  }

  InventoryItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String?>? productUuid,
    Value<String>? productNameSnapshot,
    Value<String?>? productCodeSnapshot,
    Value<String?>? specificationSnapshot,
    Value<double>? quantityValue,
    Value<String?>? quantityUnit,
    Value<String?>? warehouseName,
    Value<String>? inventoryStatus,
  }) {
    return InventoryItemsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      productUuid: productUuid ?? this.productUuid,
      productNameSnapshot: productNameSnapshot ?? this.productNameSnapshot,
      productCodeSnapshot: productCodeSnapshot ?? this.productCodeSnapshot,
      specificationSnapshot:
          specificationSnapshot ?? this.specificationSnapshot,
      quantityValue: quantityValue ?? this.quantityValue,
      quantityUnit: quantityUnit ?? this.quantityUnit,
      warehouseName: warehouseName ?? this.warehouseName,
      inventoryStatus: inventoryStatus ?? this.inventoryStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (productUuid.present) {
      map['product_uuid'] = Variable<String>(productUuid.value);
    }
    if (productNameSnapshot.present) {
      map['product_name_snapshot'] = Variable<String>(
        productNameSnapshot.value,
      );
    }
    if (productCodeSnapshot.present) {
      map['product_code_snapshot'] = Variable<String>(
        productCodeSnapshot.value,
      );
    }
    if (specificationSnapshot.present) {
      map['specification_snapshot'] = Variable<String>(
        specificationSnapshot.value,
      );
    }
    if (quantityValue.present) {
      map['quantity_value'] = Variable<double>(quantityValue.value);
    }
    if (quantityUnit.present) {
      map['quantity_unit'] = Variable<String>(quantityUnit.value);
    }
    if (warehouseName.present) {
      map['warehouse_name'] = Variable<String>(warehouseName.value);
    }
    if (inventoryStatus.present) {
      map['inventory_status'] = Variable<String>(inventoryStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('productUuid: $productUuid, ')
          ..write('productNameSnapshot: $productNameSnapshot, ')
          ..write('productCodeSnapshot: $productCodeSnapshot, ')
          ..write('specificationSnapshot: $specificationSnapshot, ')
          ..write('quantityValue: $quantityValue, ')
          ..write('quantityUnit: $quantityUnit, ')
          ..write('warehouseName: $warehouseName, ')
          ..write('inventoryStatus: $inventoryStatus')
          ..write(')'))
        .toString();
  }
}

class $InventoryLogsTable extends InventoryLogs
    with TableInfo<$InventoryLogsTable, InventoryLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _inventoryItemUuidMeta = const VerificationMeta(
    'inventoryItemUuid',
  );
  @override
  late final GeneratedColumn<String> inventoryItemUuid =
      GeneratedColumn<String>(
        'inventory_item_uuid',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _productUuidMeta = const VerificationMeta(
    'productUuid',
  );
  @override
  late final GeneratedColumn<String> productUuid = GeneratedColumn<String>(
    'product_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _relatedTypeMeta = const VerificationMeta(
    'relatedType',
  );
  @override
  late final GeneratedColumn<String> relatedType = GeneratedColumn<String>(
    'related_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _relatedUuidMeta = const VerificationMeta(
    'relatedUuid',
  );
  @override
  late final GeneratedColumn<String> relatedUuid = GeneratedColumn<String>(
    'related_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _changeTypeMeta = const VerificationMeta(
    'changeType',
  );
  @override
  late final GeneratedColumn<String> changeType = GeneratedColumn<String>(
    'change_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityChangeValueMeta =
      const VerificationMeta('quantityChangeValue');
  @override
  late final GeneratedColumn<double> quantityChangeValue =
      GeneratedColumn<double>(
        'quantity_change_value',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _quantityUnitMeta = const VerificationMeta(
    'quantityUnit',
  );
  @override
  late final GeneratedColumn<String> quantityUnit = GeneratedColumn<String>(
    'quantity_unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _beforeQuantityValueMeta =
      const VerificationMeta('beforeQuantityValue');
  @override
  late final GeneratedColumn<double> beforeQuantityValue =
      GeneratedColumn<double>(
        'before_quantity_value',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _afterQuantityValueMeta =
      const VerificationMeta('afterQuantityValue');
  @override
  late final GeneratedColumn<double> afterQuantityValue =
      GeneratedColumn<double>(
        'after_quantity_value',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _operatedAtMeta = const VerificationMeta(
    'operatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> operatedAt = GeneratedColumn<DateTime>(
    'operated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _operatorNameMeta = const VerificationMeta(
    'operatorName',
  );
  @override
  late final GeneratedColumn<String> operatorName = GeneratedColumn<String>(
    'operator_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    inventoryItemUuid,
    productUuid,
    relatedType,
    relatedUuid,
    changeType,
    quantityChangeValue,
    quantityUnit,
    beforeQuantityValue,
    afterQuantityValue,
    operatedAt,
    operatorName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<InventoryLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('inventory_item_uuid')) {
      context.handle(
        _inventoryItemUuidMeta,
        inventoryItemUuid.isAcceptableOrUnknown(
          data['inventory_item_uuid']!,
          _inventoryItemUuidMeta,
        ),
      );
    }
    if (data.containsKey('product_uuid')) {
      context.handle(
        _productUuidMeta,
        productUuid.isAcceptableOrUnknown(
          data['product_uuid']!,
          _productUuidMeta,
        ),
      );
    }
    if (data.containsKey('related_type')) {
      context.handle(
        _relatedTypeMeta,
        relatedType.isAcceptableOrUnknown(
          data['related_type']!,
          _relatedTypeMeta,
        ),
      );
    }
    if (data.containsKey('related_uuid')) {
      context.handle(
        _relatedUuidMeta,
        relatedUuid.isAcceptableOrUnknown(
          data['related_uuid']!,
          _relatedUuidMeta,
        ),
      );
    }
    if (data.containsKey('change_type')) {
      context.handle(
        _changeTypeMeta,
        changeType.isAcceptableOrUnknown(data['change_type']!, _changeTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_changeTypeMeta);
    }
    if (data.containsKey('quantity_change_value')) {
      context.handle(
        _quantityChangeValueMeta,
        quantityChangeValue.isAcceptableOrUnknown(
          data['quantity_change_value']!,
          _quantityChangeValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quantityChangeValueMeta);
    }
    if (data.containsKey('quantity_unit')) {
      context.handle(
        _quantityUnitMeta,
        quantityUnit.isAcceptableOrUnknown(
          data['quantity_unit']!,
          _quantityUnitMeta,
        ),
      );
    }
    if (data.containsKey('before_quantity_value')) {
      context.handle(
        _beforeQuantityValueMeta,
        beforeQuantityValue.isAcceptableOrUnknown(
          data['before_quantity_value']!,
          _beforeQuantityValueMeta,
        ),
      );
    }
    if (data.containsKey('after_quantity_value')) {
      context.handle(
        _afterQuantityValueMeta,
        afterQuantityValue.isAcceptableOrUnknown(
          data['after_quantity_value']!,
          _afterQuantityValueMeta,
        ),
      );
    }
    if (data.containsKey('operated_at')) {
      context.handle(
        _operatedAtMeta,
        operatedAt.isAcceptableOrUnknown(data['operated_at']!, _operatedAtMeta),
      );
    }
    if (data.containsKey('operator_name')) {
      context.handle(
        _operatorNameMeta,
        operatorName.isAcceptableOrUnknown(
          data['operator_name']!,
          _operatorNameMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      inventoryItemUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}inventory_item_uuid'],
      ),
      productUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_uuid'],
      ),
      relatedType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_type'],
      ),
      relatedUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_uuid'],
      ),
      changeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}change_type'],
      )!,
      quantityChangeValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity_change_value'],
      )!,
      quantityUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quantity_unit'],
      ),
      beforeQuantityValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}before_quantity_value'],
      ),
      afterQuantityValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}after_quantity_value'],
      ),
      operatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}operated_at'],
      )!,
      operatorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operator_name'],
      ),
    );
  }

  @override
  $InventoryLogsTable createAlias(String alias) {
    return $InventoryLogsTable(attachedDatabase, alias);
  }
}

class InventoryLog extends DataClass implements Insertable<InventoryLog> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String? inventoryItemUuid;
  final String? productUuid;
  final String? relatedType;
  final String? relatedUuid;
  final String changeType;
  final double quantityChangeValue;
  final String? quantityUnit;
  final double? beforeQuantityValue;
  final double? afterQuantityValue;
  final DateTime operatedAt;
  final String? operatorName;
  const InventoryLog({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    this.inventoryItemUuid,
    this.productUuid,
    this.relatedType,
    this.relatedUuid,
    required this.changeType,
    required this.quantityChangeValue,
    this.quantityUnit,
    this.beforeQuantityValue,
    this.afterQuantityValue,
    required this.operatedAt,
    this.operatorName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    if (!nullToAbsent || inventoryItemUuid != null) {
      map['inventory_item_uuid'] = Variable<String>(inventoryItemUuid);
    }
    if (!nullToAbsent || productUuid != null) {
      map['product_uuid'] = Variable<String>(productUuid);
    }
    if (!nullToAbsent || relatedType != null) {
      map['related_type'] = Variable<String>(relatedType);
    }
    if (!nullToAbsent || relatedUuid != null) {
      map['related_uuid'] = Variable<String>(relatedUuid);
    }
    map['change_type'] = Variable<String>(changeType);
    map['quantity_change_value'] = Variable<double>(quantityChangeValue);
    if (!nullToAbsent || quantityUnit != null) {
      map['quantity_unit'] = Variable<String>(quantityUnit);
    }
    if (!nullToAbsent || beforeQuantityValue != null) {
      map['before_quantity_value'] = Variable<double>(beforeQuantityValue);
    }
    if (!nullToAbsent || afterQuantityValue != null) {
      map['after_quantity_value'] = Variable<double>(afterQuantityValue);
    }
    map['operated_at'] = Variable<DateTime>(operatedAt);
    if (!nullToAbsent || operatorName != null) {
      map['operator_name'] = Variable<String>(operatorName);
    }
    return map;
  }

  InventoryLogsCompanion toCompanion(bool nullToAbsent) {
    return InventoryLogsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      inventoryItemUuid: inventoryItemUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(inventoryItemUuid),
      productUuid: productUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(productUuid),
      relatedType: relatedType == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedType),
      relatedUuid: relatedUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(relatedUuid),
      changeType: Value(changeType),
      quantityChangeValue: Value(quantityChangeValue),
      quantityUnit: quantityUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(quantityUnit),
      beforeQuantityValue: beforeQuantityValue == null && nullToAbsent
          ? const Value.absent()
          : Value(beforeQuantityValue),
      afterQuantityValue: afterQuantityValue == null && nullToAbsent
          ? const Value.absent()
          : Value(afterQuantityValue),
      operatedAt: Value(operatedAt),
      operatorName: operatorName == null && nullToAbsent
          ? const Value.absent()
          : Value(operatorName),
    );
  }

  factory InventoryLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryLog(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      inventoryItemUuid: serializer.fromJson<String?>(
        json['inventoryItemUuid'],
      ),
      productUuid: serializer.fromJson<String?>(json['productUuid']),
      relatedType: serializer.fromJson<String?>(json['relatedType']),
      relatedUuid: serializer.fromJson<String?>(json['relatedUuid']),
      changeType: serializer.fromJson<String>(json['changeType']),
      quantityChangeValue: serializer.fromJson<double>(
        json['quantityChangeValue'],
      ),
      quantityUnit: serializer.fromJson<String?>(json['quantityUnit']),
      beforeQuantityValue: serializer.fromJson<double?>(
        json['beforeQuantityValue'],
      ),
      afterQuantityValue: serializer.fromJson<double?>(
        json['afterQuantityValue'],
      ),
      operatedAt: serializer.fromJson<DateTime>(json['operatedAt']),
      operatorName: serializer.fromJson<String?>(json['operatorName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'inventoryItemUuid': serializer.toJson<String?>(inventoryItemUuid),
      'productUuid': serializer.toJson<String?>(productUuid),
      'relatedType': serializer.toJson<String?>(relatedType),
      'relatedUuid': serializer.toJson<String?>(relatedUuid),
      'changeType': serializer.toJson<String>(changeType),
      'quantityChangeValue': serializer.toJson<double>(quantityChangeValue),
      'quantityUnit': serializer.toJson<String?>(quantityUnit),
      'beforeQuantityValue': serializer.toJson<double?>(beforeQuantityValue),
      'afterQuantityValue': serializer.toJson<double?>(afterQuantityValue),
      'operatedAt': serializer.toJson<DateTime>(operatedAt),
      'operatorName': serializer.toJson<String?>(operatorName),
    };
  }

  InventoryLog copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    Value<String?> inventoryItemUuid = const Value.absent(),
    Value<String?> productUuid = const Value.absent(),
    Value<String?> relatedType = const Value.absent(),
    Value<String?> relatedUuid = const Value.absent(),
    String? changeType,
    double? quantityChangeValue,
    Value<String?> quantityUnit = const Value.absent(),
    Value<double?> beforeQuantityValue = const Value.absent(),
    Value<double?> afterQuantityValue = const Value.absent(),
    DateTime? operatedAt,
    Value<String?> operatorName = const Value.absent(),
  }) => InventoryLog(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    inventoryItemUuid: inventoryItemUuid.present
        ? inventoryItemUuid.value
        : this.inventoryItemUuid,
    productUuid: productUuid.present ? productUuid.value : this.productUuid,
    relatedType: relatedType.present ? relatedType.value : this.relatedType,
    relatedUuid: relatedUuid.present ? relatedUuid.value : this.relatedUuid,
    changeType: changeType ?? this.changeType,
    quantityChangeValue: quantityChangeValue ?? this.quantityChangeValue,
    quantityUnit: quantityUnit.present ? quantityUnit.value : this.quantityUnit,
    beforeQuantityValue: beforeQuantityValue.present
        ? beforeQuantityValue.value
        : this.beforeQuantityValue,
    afterQuantityValue: afterQuantityValue.present
        ? afterQuantityValue.value
        : this.afterQuantityValue,
    operatedAt: operatedAt ?? this.operatedAt,
    operatorName: operatorName.present ? operatorName.value : this.operatorName,
  );
  InventoryLog copyWithCompanion(InventoryLogsCompanion data) {
    return InventoryLog(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      inventoryItemUuid: data.inventoryItemUuid.present
          ? data.inventoryItemUuid.value
          : this.inventoryItemUuid,
      productUuid: data.productUuid.present
          ? data.productUuid.value
          : this.productUuid,
      relatedType: data.relatedType.present
          ? data.relatedType.value
          : this.relatedType,
      relatedUuid: data.relatedUuid.present
          ? data.relatedUuid.value
          : this.relatedUuid,
      changeType: data.changeType.present
          ? data.changeType.value
          : this.changeType,
      quantityChangeValue: data.quantityChangeValue.present
          ? data.quantityChangeValue.value
          : this.quantityChangeValue,
      quantityUnit: data.quantityUnit.present
          ? data.quantityUnit.value
          : this.quantityUnit,
      beforeQuantityValue: data.beforeQuantityValue.present
          ? data.beforeQuantityValue.value
          : this.beforeQuantityValue,
      afterQuantityValue: data.afterQuantityValue.present
          ? data.afterQuantityValue.value
          : this.afterQuantityValue,
      operatedAt: data.operatedAt.present
          ? data.operatedAt.value
          : this.operatedAt,
      operatorName: data.operatorName.present
          ? data.operatorName.value
          : this.operatorName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryLog(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('inventoryItemUuid: $inventoryItemUuid, ')
          ..write('productUuid: $productUuid, ')
          ..write('relatedType: $relatedType, ')
          ..write('relatedUuid: $relatedUuid, ')
          ..write('changeType: $changeType, ')
          ..write('quantityChangeValue: $quantityChangeValue, ')
          ..write('quantityUnit: $quantityUnit, ')
          ..write('beforeQuantityValue: $beforeQuantityValue, ')
          ..write('afterQuantityValue: $afterQuantityValue, ')
          ..write('operatedAt: $operatedAt, ')
          ..write('operatorName: $operatorName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    inventoryItemUuid,
    productUuid,
    relatedType,
    relatedUuid,
    changeType,
    quantityChangeValue,
    quantityUnit,
    beforeQuantityValue,
    afterQuantityValue,
    operatedAt,
    operatorName,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryLog &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.inventoryItemUuid == this.inventoryItemUuid &&
          other.productUuid == this.productUuid &&
          other.relatedType == this.relatedType &&
          other.relatedUuid == this.relatedUuid &&
          other.changeType == this.changeType &&
          other.quantityChangeValue == this.quantityChangeValue &&
          other.quantityUnit == this.quantityUnit &&
          other.beforeQuantityValue == this.beforeQuantityValue &&
          other.afterQuantityValue == this.afterQuantityValue &&
          other.operatedAt == this.operatedAt &&
          other.operatorName == this.operatorName);
}

class InventoryLogsCompanion extends UpdateCompanion<InventoryLog> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String?> inventoryItemUuid;
  final Value<String?> productUuid;
  final Value<String?> relatedType;
  final Value<String?> relatedUuid;
  final Value<String> changeType;
  final Value<double> quantityChangeValue;
  final Value<String?> quantityUnit;
  final Value<double?> beforeQuantityValue;
  final Value<double?> afterQuantityValue;
  final Value<DateTime> operatedAt;
  final Value<String?> operatorName;
  const InventoryLogsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.inventoryItemUuid = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.relatedType = const Value.absent(),
    this.relatedUuid = const Value.absent(),
    this.changeType = const Value.absent(),
    this.quantityChangeValue = const Value.absent(),
    this.quantityUnit = const Value.absent(),
    this.beforeQuantityValue = const Value.absent(),
    this.afterQuantityValue = const Value.absent(),
    this.operatedAt = const Value.absent(),
    this.operatorName = const Value.absent(),
  });
  InventoryLogsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.inventoryItemUuid = const Value.absent(),
    this.productUuid = const Value.absent(),
    this.relatedType = const Value.absent(),
    this.relatedUuid = const Value.absent(),
    required String changeType,
    required double quantityChangeValue,
    this.quantityUnit = const Value.absent(),
    this.beforeQuantityValue = const Value.absent(),
    this.afterQuantityValue = const Value.absent(),
    this.operatedAt = const Value.absent(),
    this.operatorName = const Value.absent(),
  }) : uuid = Value(uuid),
       changeType = Value(changeType),
       quantityChangeValue = Value(quantityChangeValue);
  static Insertable<InventoryLog> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? inventoryItemUuid,
    Expression<String>? productUuid,
    Expression<String>? relatedType,
    Expression<String>? relatedUuid,
    Expression<String>? changeType,
    Expression<double>? quantityChangeValue,
    Expression<String>? quantityUnit,
    Expression<double>? beforeQuantityValue,
    Expression<double>? afterQuantityValue,
    Expression<DateTime>? operatedAt,
    Expression<String>? operatorName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (inventoryItemUuid != null) 'inventory_item_uuid': inventoryItemUuid,
      if (productUuid != null) 'product_uuid': productUuid,
      if (relatedType != null) 'related_type': relatedType,
      if (relatedUuid != null) 'related_uuid': relatedUuid,
      if (changeType != null) 'change_type': changeType,
      if (quantityChangeValue != null)
        'quantity_change_value': quantityChangeValue,
      if (quantityUnit != null) 'quantity_unit': quantityUnit,
      if (beforeQuantityValue != null)
        'before_quantity_value': beforeQuantityValue,
      if (afterQuantityValue != null)
        'after_quantity_value': afterQuantityValue,
      if (operatedAt != null) 'operated_at': operatedAt,
      if (operatorName != null) 'operator_name': operatorName,
    });
  }

  InventoryLogsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String?>? inventoryItemUuid,
    Value<String?>? productUuid,
    Value<String?>? relatedType,
    Value<String?>? relatedUuid,
    Value<String>? changeType,
    Value<double>? quantityChangeValue,
    Value<String?>? quantityUnit,
    Value<double?>? beforeQuantityValue,
    Value<double?>? afterQuantityValue,
    Value<DateTime>? operatedAt,
    Value<String?>? operatorName,
  }) {
    return InventoryLogsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      inventoryItemUuid: inventoryItemUuid ?? this.inventoryItemUuid,
      productUuid: productUuid ?? this.productUuid,
      relatedType: relatedType ?? this.relatedType,
      relatedUuid: relatedUuid ?? this.relatedUuid,
      changeType: changeType ?? this.changeType,
      quantityChangeValue: quantityChangeValue ?? this.quantityChangeValue,
      quantityUnit: quantityUnit ?? this.quantityUnit,
      beforeQuantityValue: beforeQuantityValue ?? this.beforeQuantityValue,
      afterQuantityValue: afterQuantityValue ?? this.afterQuantityValue,
      operatedAt: operatedAt ?? this.operatedAt,
      operatorName: operatorName ?? this.operatorName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (inventoryItemUuid.present) {
      map['inventory_item_uuid'] = Variable<String>(inventoryItemUuid.value);
    }
    if (productUuid.present) {
      map['product_uuid'] = Variable<String>(productUuid.value);
    }
    if (relatedType.present) {
      map['related_type'] = Variable<String>(relatedType.value);
    }
    if (relatedUuid.present) {
      map['related_uuid'] = Variable<String>(relatedUuid.value);
    }
    if (changeType.present) {
      map['change_type'] = Variable<String>(changeType.value);
    }
    if (quantityChangeValue.present) {
      map['quantity_change_value'] = Variable<double>(
        quantityChangeValue.value,
      );
    }
    if (quantityUnit.present) {
      map['quantity_unit'] = Variable<String>(quantityUnit.value);
    }
    if (beforeQuantityValue.present) {
      map['before_quantity_value'] = Variable<double>(
        beforeQuantityValue.value,
      );
    }
    if (afterQuantityValue.present) {
      map['after_quantity_value'] = Variable<double>(afterQuantityValue.value);
    }
    if (operatedAt.present) {
      map['operated_at'] = Variable<DateTime>(operatedAt.value);
    }
    if (operatorName.present) {
      map['operator_name'] = Variable<String>(operatorName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryLogsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('inventoryItemUuid: $inventoryItemUuid, ')
          ..write('productUuid: $productUuid, ')
          ..write('relatedType: $relatedType, ')
          ..write('relatedUuid: $relatedUuid, ')
          ..write('changeType: $changeType, ')
          ..write('quantityChangeValue: $quantityChangeValue, ')
          ..write('quantityUnit: $quantityUnit, ')
          ..write('beforeQuantityValue: $beforeQuantityValue, ')
          ..write('afterQuantityValue: $afterQuantityValue, ')
          ..write('operatedAt: $operatedAt, ')
          ..write('operatorName: $operatorName')
          ..write(')'))
        .toString();
  }
}

class $ExpenseItemsTable extends ExpenseItems
    with TableInfo<$ExpenseItemsTable, ExpenseItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpenseItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _relatedTypeMeta = const VerificationMeta(
    'relatedType',
  );
  @override
  late final GeneratedColumn<String> relatedType = GeneratedColumn<String>(
    'related_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relatedUuidMeta = const VerificationMeta(
    'relatedUuid',
  );
  @override
  late final GeneratedColumn<String> relatedUuid = GeneratedColumn<String>(
    'related_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expenseTypeMeta = const VerificationMeta(
    'expenseType',
  );
  @override
  late final GeneratedColumn<String> expenseType = GeneratedColumn<String>(
    'expense_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expenseDateMeta = const VerificationMeta(
    'expenseDate',
  );
  @override
  late final GeneratedColumn<DateTime> expenseDate = GeneratedColumn<DateTime>(
    'expense_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderUuidMeta = const VerificationMeta(
    'orderUuid',
  );
  @override
  late final GeneratedColumn<String> orderUuid = GeneratedColumn<String>(
    'order_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _supplierUuidMeta = const VerificationMeta(
    'supplierUuid',
  );
  @override
  late final GeneratedColumn<String> supplierUuid = GeneratedColumn<String>(
    'supplier_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    relatedType,
    relatedUuid,
    expenseType,
    amount,
    expenseDate,
    orderUuid,
    supplierUuid,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expense_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExpenseItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('related_type')) {
      context.handle(
        _relatedTypeMeta,
        relatedType.isAcceptableOrUnknown(
          data['related_type']!,
          _relatedTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relatedTypeMeta);
    }
    if (data.containsKey('related_uuid')) {
      context.handle(
        _relatedUuidMeta,
        relatedUuid.isAcceptableOrUnknown(
          data['related_uuid']!,
          _relatedUuidMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relatedUuidMeta);
    }
    if (data.containsKey('expense_type')) {
      context.handle(
        _expenseTypeMeta,
        expenseType.isAcceptableOrUnknown(
          data['expense_type']!,
          _expenseTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_expenseTypeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('expense_date')) {
      context.handle(
        _expenseDateMeta,
        expenseDate.isAcceptableOrUnknown(
          data['expense_date']!,
          _expenseDateMeta,
        ),
      );
    }
    if (data.containsKey('order_uuid')) {
      context.handle(
        _orderUuidMeta,
        orderUuid.isAcceptableOrUnknown(data['order_uuid']!, _orderUuidMeta),
      );
    }
    if (data.containsKey('supplier_uuid')) {
      context.handle(
        _supplierUuidMeta,
        supplierUuid.isAcceptableOrUnknown(
          data['supplier_uuid']!,
          _supplierUuidMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      relatedType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_type'],
      )!,
      relatedUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_uuid'],
      )!,
      expenseType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expense_type'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      expenseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expense_date'],
      ),
      orderUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_uuid'],
      ),
      supplierUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supplier_uuid'],
      ),
    );
  }

  @override
  $ExpenseItemsTable createAlias(String alias) {
    return $ExpenseItemsTable(attachedDatabase, alias);
  }
}

class ExpenseItem extends DataClass implements Insertable<ExpenseItem> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String relatedType;
  final String relatedUuid;
  final String expenseType;
  final int amount;
  final DateTime? expenseDate;
  final String? orderUuid;
  final String? supplierUuid;
  const ExpenseItem({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.relatedType,
    required this.relatedUuid,
    required this.expenseType,
    required this.amount,
    this.expenseDate,
    this.orderUuid,
    this.supplierUuid,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['related_type'] = Variable<String>(relatedType);
    map['related_uuid'] = Variable<String>(relatedUuid);
    map['expense_type'] = Variable<String>(expenseType);
    map['amount'] = Variable<int>(amount);
    if (!nullToAbsent || expenseDate != null) {
      map['expense_date'] = Variable<DateTime>(expenseDate);
    }
    if (!nullToAbsent || orderUuid != null) {
      map['order_uuid'] = Variable<String>(orderUuid);
    }
    if (!nullToAbsent || supplierUuid != null) {
      map['supplier_uuid'] = Variable<String>(supplierUuid);
    }
    return map;
  }

  ExpenseItemsCompanion toCompanion(bool nullToAbsent) {
    return ExpenseItemsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      relatedType: Value(relatedType),
      relatedUuid: Value(relatedUuid),
      expenseType: Value(expenseType),
      amount: Value(amount),
      expenseDate: expenseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expenseDate),
      orderUuid: orderUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(orderUuid),
      supplierUuid: supplierUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierUuid),
    );
  }

  factory ExpenseItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseItem(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      relatedType: serializer.fromJson<String>(json['relatedType']),
      relatedUuid: serializer.fromJson<String>(json['relatedUuid']),
      expenseType: serializer.fromJson<String>(json['expenseType']),
      amount: serializer.fromJson<int>(json['amount']),
      expenseDate: serializer.fromJson<DateTime?>(json['expenseDate']),
      orderUuid: serializer.fromJson<String?>(json['orderUuid']),
      supplierUuid: serializer.fromJson<String?>(json['supplierUuid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'relatedType': serializer.toJson<String>(relatedType),
      'relatedUuid': serializer.toJson<String>(relatedUuid),
      'expenseType': serializer.toJson<String>(expenseType),
      'amount': serializer.toJson<int>(amount),
      'expenseDate': serializer.toJson<DateTime?>(expenseDate),
      'orderUuid': serializer.toJson<String?>(orderUuid),
      'supplierUuid': serializer.toJson<String?>(supplierUuid),
    };
  }

  ExpenseItem copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? relatedType,
    String? relatedUuid,
    String? expenseType,
    int? amount,
    Value<DateTime?> expenseDate = const Value.absent(),
    Value<String?> orderUuid = const Value.absent(),
    Value<String?> supplierUuid = const Value.absent(),
  }) => ExpenseItem(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    relatedType: relatedType ?? this.relatedType,
    relatedUuid: relatedUuid ?? this.relatedUuid,
    expenseType: expenseType ?? this.expenseType,
    amount: amount ?? this.amount,
    expenseDate: expenseDate.present ? expenseDate.value : this.expenseDate,
    orderUuid: orderUuid.present ? orderUuid.value : this.orderUuid,
    supplierUuid: supplierUuid.present ? supplierUuid.value : this.supplierUuid,
  );
  ExpenseItem copyWithCompanion(ExpenseItemsCompanion data) {
    return ExpenseItem(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      relatedType: data.relatedType.present
          ? data.relatedType.value
          : this.relatedType,
      relatedUuid: data.relatedUuid.present
          ? data.relatedUuid.value
          : this.relatedUuid,
      expenseType: data.expenseType.present
          ? data.expenseType.value
          : this.expenseType,
      amount: data.amount.present ? data.amount.value : this.amount,
      expenseDate: data.expenseDate.present
          ? data.expenseDate.value
          : this.expenseDate,
      orderUuid: data.orderUuid.present ? data.orderUuid.value : this.orderUuid,
      supplierUuid: data.supplierUuid.present
          ? data.supplierUuid.value
          : this.supplierUuid,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseItem(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('relatedType: $relatedType, ')
          ..write('relatedUuid: $relatedUuid, ')
          ..write('expenseType: $expenseType, ')
          ..write('amount: $amount, ')
          ..write('expenseDate: $expenseDate, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('supplierUuid: $supplierUuid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    relatedType,
    relatedUuid,
    expenseType,
    amount,
    expenseDate,
    orderUuid,
    supplierUuid,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseItem &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.relatedType == this.relatedType &&
          other.relatedUuid == this.relatedUuid &&
          other.expenseType == this.expenseType &&
          other.amount == this.amount &&
          other.expenseDate == this.expenseDate &&
          other.orderUuid == this.orderUuid &&
          other.supplierUuid == this.supplierUuid);
}

class ExpenseItemsCompanion extends UpdateCompanion<ExpenseItem> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> relatedType;
  final Value<String> relatedUuid;
  final Value<String> expenseType;
  final Value<int> amount;
  final Value<DateTime?> expenseDate;
  final Value<String?> orderUuid;
  final Value<String?> supplierUuid;
  const ExpenseItemsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.relatedType = const Value.absent(),
    this.relatedUuid = const Value.absent(),
    this.expenseType = const Value.absent(),
    this.amount = const Value.absent(),
    this.expenseDate = const Value.absent(),
    this.orderUuid = const Value.absent(),
    this.supplierUuid = const Value.absent(),
  });
  ExpenseItemsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String relatedType,
    required String relatedUuid,
    required String expenseType,
    required int amount,
    this.expenseDate = const Value.absent(),
    this.orderUuid = const Value.absent(),
    this.supplierUuid = const Value.absent(),
  }) : uuid = Value(uuid),
       relatedType = Value(relatedType),
       relatedUuid = Value(relatedUuid),
       expenseType = Value(expenseType),
       amount = Value(amount);
  static Insertable<ExpenseItem> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? relatedType,
    Expression<String>? relatedUuid,
    Expression<String>? expenseType,
    Expression<int>? amount,
    Expression<DateTime>? expenseDate,
    Expression<String>? orderUuid,
    Expression<String>? supplierUuid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (relatedType != null) 'related_type': relatedType,
      if (relatedUuid != null) 'related_uuid': relatedUuid,
      if (expenseType != null) 'expense_type': expenseType,
      if (amount != null) 'amount': amount,
      if (expenseDate != null) 'expense_date': expenseDate,
      if (orderUuid != null) 'order_uuid': orderUuid,
      if (supplierUuid != null) 'supplier_uuid': supplierUuid,
    });
  }

  ExpenseItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? relatedType,
    Value<String>? relatedUuid,
    Value<String>? expenseType,
    Value<int>? amount,
    Value<DateTime?>? expenseDate,
    Value<String?>? orderUuid,
    Value<String?>? supplierUuid,
  }) {
    return ExpenseItemsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      relatedType: relatedType ?? this.relatedType,
      relatedUuid: relatedUuid ?? this.relatedUuid,
      expenseType: expenseType ?? this.expenseType,
      amount: amount ?? this.amount,
      expenseDate: expenseDate ?? this.expenseDate,
      orderUuid: orderUuid ?? this.orderUuid,
      supplierUuid: supplierUuid ?? this.supplierUuid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (relatedType.present) {
      map['related_type'] = Variable<String>(relatedType.value);
    }
    if (relatedUuid.present) {
      map['related_uuid'] = Variable<String>(relatedUuid.value);
    }
    if (expenseType.present) {
      map['expense_type'] = Variable<String>(expenseType.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (expenseDate.present) {
      map['expense_date'] = Variable<DateTime>(expenseDate.value);
    }
    if (orderUuid.present) {
      map['order_uuid'] = Variable<String>(orderUuid.value);
    }
    if (supplierUuid.present) {
      map['supplier_uuid'] = Variable<String>(supplierUuid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseItemsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('relatedType: $relatedType, ')
          ..write('relatedUuid: $relatedUuid, ')
          ..write('expenseType: $expenseType, ')
          ..write('amount: $amount, ')
          ..write('expenseDate: $expenseDate, ')
          ..write('orderUuid: $orderUuid, ')
          ..write('supplierUuid: $supplierUuid')
          ..write(')'))
        .toString();
  }
}

class $PaymentsTable extends Payments with TableInfo<$PaymentsTable, Payment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _relatedTypeMeta = const VerificationMeta(
    'relatedType',
  );
  @override
  late final GeneratedColumn<String> relatedType = GeneratedColumn<String>(
    'related_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relatedUuidMeta = const VerificationMeta(
    'relatedUuid',
  );
  @override
  late final GeneratedColumn<String> relatedUuid = GeneratedColumn<String>(
    'related_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentTypeMeta = const VerificationMeta(
    'paymentType',
  );
  @override
  late final GeneratedColumn<String> paymentType = GeneratedColumn<String>(
    'payment_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unknown'),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentDateMeta = const VerificationMeta(
    'paymentDate',
  );
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
    'payment_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paymentStatusMeta = const VerificationMeta(
    'paymentStatus',
  );
  @override
  late final GeneratedColumn<String> paymentStatus = GeneratedColumn<String>(
    'payment_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _accountNameMeta = const VerificationMeta(
    'accountName',
  );
  @override
  late final GeneratedColumn<String> accountName = GeneratedColumn<String>(
    'account_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    relatedType,
    relatedUuid,
    paymentType,
    amount,
    paymentDate,
    paymentStatus,
    accountName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Payment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('related_type')) {
      context.handle(
        _relatedTypeMeta,
        relatedType.isAcceptableOrUnknown(
          data['related_type']!,
          _relatedTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relatedTypeMeta);
    }
    if (data.containsKey('related_uuid')) {
      context.handle(
        _relatedUuidMeta,
        relatedUuid.isAcceptableOrUnknown(
          data['related_uuid']!,
          _relatedUuidMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relatedUuidMeta);
    }
    if (data.containsKey('payment_type')) {
      context.handle(
        _paymentTypeMeta,
        paymentType.isAcceptableOrUnknown(
          data['payment_type']!,
          _paymentTypeMeta,
        ),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
        _paymentDateMeta,
        paymentDate.isAcceptableOrUnknown(
          data['payment_date']!,
          _paymentDateMeta,
        ),
      );
    }
    if (data.containsKey('payment_status')) {
      context.handle(
        _paymentStatusMeta,
        paymentStatus.isAcceptableOrUnknown(
          data['payment_status']!,
          _paymentStatusMeta,
        ),
      );
    }
    if (data.containsKey('account_name')) {
      context.handle(
        _accountNameMeta,
        accountName.isAcceptableOrUnknown(
          data['account_name']!,
          _accountNameMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Payment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Payment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      relatedType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_type'],
      )!,
      relatedUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_uuid'],
      )!,
      paymentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_type'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
      paymentDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}payment_date'],
      ),
      paymentStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_status'],
      )!,
      accountName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_name'],
      ),
    );
  }

  @override
  $PaymentsTable createAlias(String alias) {
    return $PaymentsTable(attachedDatabase, alias);
  }
}

class Payment extends DataClass implements Insertable<Payment> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String relatedType;
  final String relatedUuid;
  final String paymentType;
  final int amount;
  final DateTime? paymentDate;
  final String paymentStatus;
  final String? accountName;
  const Payment({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.relatedType,
    required this.relatedUuid,
    required this.paymentType,
    required this.amount,
    this.paymentDate,
    required this.paymentStatus,
    this.accountName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['related_type'] = Variable<String>(relatedType);
    map['related_uuid'] = Variable<String>(relatedUuid);
    map['payment_type'] = Variable<String>(paymentType);
    map['amount'] = Variable<int>(amount);
    if (!nullToAbsent || paymentDate != null) {
      map['payment_date'] = Variable<DateTime>(paymentDate);
    }
    map['payment_status'] = Variable<String>(paymentStatus);
    if (!nullToAbsent || accountName != null) {
      map['account_name'] = Variable<String>(accountName);
    }
    return map;
  }

  PaymentsCompanion toCompanion(bool nullToAbsent) {
    return PaymentsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      relatedType: Value(relatedType),
      relatedUuid: Value(relatedUuid),
      paymentType: Value(paymentType),
      amount: Value(amount),
      paymentDate: paymentDate == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentDate),
      paymentStatus: Value(paymentStatus),
      accountName: accountName == null && nullToAbsent
          ? const Value.absent()
          : Value(accountName),
    );
  }

  factory Payment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Payment(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      relatedType: serializer.fromJson<String>(json['relatedType']),
      relatedUuid: serializer.fromJson<String>(json['relatedUuid']),
      paymentType: serializer.fromJson<String>(json['paymentType']),
      amount: serializer.fromJson<int>(json['amount']),
      paymentDate: serializer.fromJson<DateTime?>(json['paymentDate']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
      accountName: serializer.fromJson<String?>(json['accountName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'relatedType': serializer.toJson<String>(relatedType),
      'relatedUuid': serializer.toJson<String>(relatedUuid),
      'paymentType': serializer.toJson<String>(paymentType),
      'amount': serializer.toJson<int>(amount),
      'paymentDate': serializer.toJson<DateTime?>(paymentDate),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
      'accountName': serializer.toJson<String?>(accountName),
    };
  }

  Payment copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? relatedType,
    String? relatedUuid,
    String? paymentType,
    int? amount,
    Value<DateTime?> paymentDate = const Value.absent(),
    String? paymentStatus,
    Value<String?> accountName = const Value.absent(),
  }) => Payment(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    relatedType: relatedType ?? this.relatedType,
    relatedUuid: relatedUuid ?? this.relatedUuid,
    paymentType: paymentType ?? this.paymentType,
    amount: amount ?? this.amount,
    paymentDate: paymentDate.present ? paymentDate.value : this.paymentDate,
    paymentStatus: paymentStatus ?? this.paymentStatus,
    accountName: accountName.present ? accountName.value : this.accountName,
  );
  Payment copyWithCompanion(PaymentsCompanion data) {
    return Payment(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      relatedType: data.relatedType.present
          ? data.relatedType.value
          : this.relatedType,
      relatedUuid: data.relatedUuid.present
          ? data.relatedUuid.value
          : this.relatedUuid,
      paymentType: data.paymentType.present
          ? data.paymentType.value
          : this.paymentType,
      amount: data.amount.present ? data.amount.value : this.amount,
      paymentDate: data.paymentDate.present
          ? data.paymentDate.value
          : this.paymentDate,
      paymentStatus: data.paymentStatus.present
          ? data.paymentStatus.value
          : this.paymentStatus,
      accountName: data.accountName.present
          ? data.accountName.value
          : this.accountName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Payment(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('relatedType: $relatedType, ')
          ..write('relatedUuid: $relatedUuid, ')
          ..write('paymentType: $paymentType, ')
          ..write('amount: $amount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('accountName: $accountName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    relatedType,
    relatedUuid,
    paymentType,
    amount,
    paymentDate,
    paymentStatus,
    accountName,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payment &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.relatedType == this.relatedType &&
          other.relatedUuid == this.relatedUuid &&
          other.paymentType == this.paymentType &&
          other.amount == this.amount &&
          other.paymentDate == this.paymentDate &&
          other.paymentStatus == this.paymentStatus &&
          other.accountName == this.accountName);
}

class PaymentsCompanion extends UpdateCompanion<Payment> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> relatedType;
  final Value<String> relatedUuid;
  final Value<String> paymentType;
  final Value<int> amount;
  final Value<DateTime?> paymentDate;
  final Value<String> paymentStatus;
  final Value<String?> accountName;
  const PaymentsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.relatedType = const Value.absent(),
    this.relatedUuid = const Value.absent(),
    this.paymentType = const Value.absent(),
    this.amount = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.accountName = const Value.absent(),
  });
  PaymentsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String relatedType,
    required String relatedUuid,
    this.paymentType = const Value.absent(),
    required int amount,
    this.paymentDate = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.accountName = const Value.absent(),
  }) : uuid = Value(uuid),
       relatedType = Value(relatedType),
       relatedUuid = Value(relatedUuid),
       amount = Value(amount);
  static Insertable<Payment> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? relatedType,
    Expression<String>? relatedUuid,
    Expression<String>? paymentType,
    Expression<int>? amount,
    Expression<DateTime>? paymentDate,
    Expression<String>? paymentStatus,
    Expression<String>? accountName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (relatedType != null) 'related_type': relatedType,
      if (relatedUuid != null) 'related_uuid': relatedUuid,
      if (paymentType != null) 'payment_type': paymentType,
      if (amount != null) 'amount': amount,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (paymentStatus != null) 'payment_status': paymentStatus,
      if (accountName != null) 'account_name': accountName,
    });
  }

  PaymentsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? relatedType,
    Value<String>? relatedUuid,
    Value<String>? paymentType,
    Value<int>? amount,
    Value<DateTime?>? paymentDate,
    Value<String>? paymentStatus,
    Value<String?>? accountName,
  }) {
    return PaymentsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      relatedType: relatedType ?? this.relatedType,
      relatedUuid: relatedUuid ?? this.relatedUuid,
      paymentType: paymentType ?? this.paymentType,
      amount: amount ?? this.amount,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      accountName: accountName ?? this.accountName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (relatedType.present) {
      map['related_type'] = Variable<String>(relatedType.value);
    }
    if (relatedUuid.present) {
      map['related_uuid'] = Variable<String>(relatedUuid.value);
    }
    if (paymentType.present) {
      map['payment_type'] = Variable<String>(paymentType.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (paymentStatus.present) {
      map['payment_status'] = Variable<String>(paymentStatus.value);
    }
    if (accountName.present) {
      map['account_name'] = Variable<String>(accountName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('relatedType: $relatedType, ')
          ..write('relatedUuid: $relatedUuid, ')
          ..write('paymentType: $paymentType, ')
          ..write('amount: $amount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('accountName: $accountName')
          ..write(')'))
        .toString();
  }
}

class $AttachmentsTable extends Attachments
    with TableInfo<$AttachmentsTable, Attachment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _relatedTypeMeta = const VerificationMeta(
    'relatedType',
  );
  @override
  late final GeneratedColumn<String> relatedType = GeneratedColumn<String>(
    'related_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relatedUuidMeta = const VerificationMeta(
    'relatedUuid',
  );
  @override
  late final GeneratedColumn<String> relatedUuid = GeneratedColumn<String>(
    'related_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileTypeMeta = const VerificationMeta(
    'fileType',
  );
  @override
  late final GeneratedColumn<String> fileType = GeneratedColumn<String>(
    'file_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fileSizeMeta = const VerificationMeta(
    'fileSize',
  );
  @override
  late final GeneratedColumn<int> fileSize = GeneratedColumn<int>(
    'file_size',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _attachedAtMeta = const VerificationMeta(
    'attachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> attachedAt = GeneratedColumn<DateTime>(
    'attached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    relatedType,
    relatedUuid,
    fileName,
    filePath,
    fileType,
    fileSize,
    attachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Attachment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('related_type')) {
      context.handle(
        _relatedTypeMeta,
        relatedType.isAcceptableOrUnknown(
          data['related_type']!,
          _relatedTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relatedTypeMeta);
    }
    if (data.containsKey('related_uuid')) {
      context.handle(
        _relatedUuidMeta,
        relatedUuid.isAcceptableOrUnknown(
          data['related_uuid']!,
          _relatedUuidMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relatedUuidMeta);
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('file_type')) {
      context.handle(
        _fileTypeMeta,
        fileType.isAcceptableOrUnknown(data['file_type']!, _fileTypeMeta),
      );
    }
    if (data.containsKey('file_size')) {
      context.handle(
        _fileSizeMeta,
        fileSize.isAcceptableOrUnknown(data['file_size']!, _fileSizeMeta),
      );
    }
    if (data.containsKey('attached_at')) {
      context.handle(
        _attachedAtMeta,
        attachedAt.isAcceptableOrUnknown(data['attached_at']!, _attachedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Attachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Attachment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      relatedType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_type'],
      )!,
      relatedUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_uuid'],
      )!,
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      fileType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_type'],
      ),
      fileSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}file_size'],
      ),
      attachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}attached_at'],
      )!,
    );
  }

  @override
  $AttachmentsTable createAlias(String alias) {
    return $AttachmentsTable(attachedDatabase, alias);
  }
}

class Attachment extends DataClass implements Insertable<Attachment> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String relatedType;
  final String relatedUuid;
  final String fileName;
  final String filePath;
  final String? fileType;
  final int? fileSize;
  final DateTime attachedAt;
  const Attachment({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.relatedType,
    required this.relatedUuid,
    required this.fileName,
    required this.filePath,
    this.fileType,
    this.fileSize,
    required this.attachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['related_type'] = Variable<String>(relatedType);
    map['related_uuid'] = Variable<String>(relatedUuid);
    map['file_name'] = Variable<String>(fileName);
    map['file_path'] = Variable<String>(filePath);
    if (!nullToAbsent || fileType != null) {
      map['file_type'] = Variable<String>(fileType);
    }
    if (!nullToAbsent || fileSize != null) {
      map['file_size'] = Variable<int>(fileSize);
    }
    map['attached_at'] = Variable<DateTime>(attachedAt);
    return map;
  }

  AttachmentsCompanion toCompanion(bool nullToAbsent) {
    return AttachmentsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      relatedType: Value(relatedType),
      relatedUuid: Value(relatedUuid),
      fileName: Value(fileName),
      filePath: Value(filePath),
      fileType: fileType == null && nullToAbsent
          ? const Value.absent()
          : Value(fileType),
      fileSize: fileSize == null && nullToAbsent
          ? const Value.absent()
          : Value(fileSize),
      attachedAt: Value(attachedAt),
    );
  }

  factory Attachment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Attachment(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      relatedType: serializer.fromJson<String>(json['relatedType']),
      relatedUuid: serializer.fromJson<String>(json['relatedUuid']),
      fileName: serializer.fromJson<String>(json['fileName']),
      filePath: serializer.fromJson<String>(json['filePath']),
      fileType: serializer.fromJson<String?>(json['fileType']),
      fileSize: serializer.fromJson<int?>(json['fileSize']),
      attachedAt: serializer.fromJson<DateTime>(json['attachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'relatedType': serializer.toJson<String>(relatedType),
      'relatedUuid': serializer.toJson<String>(relatedUuid),
      'fileName': serializer.toJson<String>(fileName),
      'filePath': serializer.toJson<String>(filePath),
      'fileType': serializer.toJson<String?>(fileType),
      'fileSize': serializer.toJson<int?>(fileSize),
      'attachedAt': serializer.toJson<DateTime>(attachedAt),
    };
  }

  Attachment copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? relatedType,
    String? relatedUuid,
    String? fileName,
    String? filePath,
    Value<String?> fileType = const Value.absent(),
    Value<int?> fileSize = const Value.absent(),
    DateTime? attachedAt,
  }) => Attachment(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    relatedType: relatedType ?? this.relatedType,
    relatedUuid: relatedUuid ?? this.relatedUuid,
    fileName: fileName ?? this.fileName,
    filePath: filePath ?? this.filePath,
    fileType: fileType.present ? fileType.value : this.fileType,
    fileSize: fileSize.present ? fileSize.value : this.fileSize,
    attachedAt: attachedAt ?? this.attachedAt,
  );
  Attachment copyWithCompanion(AttachmentsCompanion data) {
    return Attachment(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      relatedType: data.relatedType.present
          ? data.relatedType.value
          : this.relatedType,
      relatedUuid: data.relatedUuid.present
          ? data.relatedUuid.value
          : this.relatedUuid,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      fileType: data.fileType.present ? data.fileType.value : this.fileType,
      fileSize: data.fileSize.present ? data.fileSize.value : this.fileSize,
      attachedAt: data.attachedAt.present
          ? data.attachedAt.value
          : this.attachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Attachment(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('relatedType: $relatedType, ')
          ..write('relatedUuid: $relatedUuid, ')
          ..write('fileName: $fileName, ')
          ..write('filePath: $filePath, ')
          ..write('fileType: $fileType, ')
          ..write('fileSize: $fileSize, ')
          ..write('attachedAt: $attachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    relatedType,
    relatedUuid,
    fileName,
    filePath,
    fileType,
    fileSize,
    attachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Attachment &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.relatedType == this.relatedType &&
          other.relatedUuid == this.relatedUuid &&
          other.fileName == this.fileName &&
          other.filePath == this.filePath &&
          other.fileType == this.fileType &&
          other.fileSize == this.fileSize &&
          other.attachedAt == this.attachedAt);
}

class AttachmentsCompanion extends UpdateCompanion<Attachment> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> relatedType;
  final Value<String> relatedUuid;
  final Value<String> fileName;
  final Value<String> filePath;
  final Value<String?> fileType;
  final Value<int?> fileSize;
  final Value<DateTime> attachedAt;
  const AttachmentsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.relatedType = const Value.absent(),
    this.relatedUuid = const Value.absent(),
    this.fileName = const Value.absent(),
    this.filePath = const Value.absent(),
    this.fileType = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.attachedAt = const Value.absent(),
  });
  AttachmentsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String relatedType,
    required String relatedUuid,
    required String fileName,
    required String filePath,
    this.fileType = const Value.absent(),
    this.fileSize = const Value.absent(),
    this.attachedAt = const Value.absent(),
  }) : uuid = Value(uuid),
       relatedType = Value(relatedType),
       relatedUuid = Value(relatedUuid),
       fileName = Value(fileName),
       filePath = Value(filePath);
  static Insertable<Attachment> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? relatedType,
    Expression<String>? relatedUuid,
    Expression<String>? fileName,
    Expression<String>? filePath,
    Expression<String>? fileType,
    Expression<int>? fileSize,
    Expression<DateTime>? attachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (relatedType != null) 'related_type': relatedType,
      if (relatedUuid != null) 'related_uuid': relatedUuid,
      if (fileName != null) 'file_name': fileName,
      if (filePath != null) 'file_path': filePath,
      if (fileType != null) 'file_type': fileType,
      if (fileSize != null) 'file_size': fileSize,
      if (attachedAt != null) 'attached_at': attachedAt,
    });
  }

  AttachmentsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? relatedType,
    Value<String>? relatedUuid,
    Value<String>? fileName,
    Value<String>? filePath,
    Value<String?>? fileType,
    Value<int?>? fileSize,
    Value<DateTime>? attachedAt,
  }) {
    return AttachmentsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      relatedType: relatedType ?? this.relatedType,
      relatedUuid: relatedUuid ?? this.relatedUuid,
      fileName: fileName ?? this.fileName,
      filePath: filePath ?? this.filePath,
      fileType: fileType ?? this.fileType,
      fileSize: fileSize ?? this.fileSize,
      attachedAt: attachedAt ?? this.attachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (relatedType.present) {
      map['related_type'] = Variable<String>(relatedType.value);
    }
    if (relatedUuid.present) {
      map['related_uuid'] = Variable<String>(relatedUuid.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (fileType.present) {
      map['file_type'] = Variable<String>(fileType.value);
    }
    if (fileSize.present) {
      map['file_size'] = Variable<int>(fileSize.value);
    }
    if (attachedAt.present) {
      map['attached_at'] = Variable<DateTime>(attachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('relatedType: $relatedType, ')
          ..write('relatedUuid: $relatedUuid, ')
          ..write('fileName: $fileName, ')
          ..write('filePath: $filePath, ')
          ..write('fileType: $fileType, ')
          ..write('fileSize: $fileSize, ')
          ..write('attachedAt: $attachedAt')
          ..write(')'))
        .toString();
  }
}

class $AuditLogsTable extends AuditLogs
    with TableInfo<$AuditLogsTable, AuditLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityUuidMeta = const VerificationMeta(
    'entityUuid',
  );
  @override
  late final GeneratedColumn<String> entityUuid = GeneratedColumn<String>(
    'entity_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionTypeMeta = const VerificationMeta(
    'actionType',
  );
  @override
  late final GeneratedColumn<String> actionType = GeneratedColumn<String>(
    'action_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _oldValueMeta = const VerificationMeta(
    'oldValue',
  );
  @override
  late final GeneratedColumn<String> oldValue = GeneratedColumn<String>(
    'old_value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _newValueMeta = const VerificationMeta(
    'newValue',
  );
  @override
  late final GeneratedColumn<String> newValue = GeneratedColumn<String>(
    'new_value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operatorNameMeta = const VerificationMeta(
    'operatorName',
  );
  @override
  late final GeneratedColumn<String> operatorName = GeneratedColumn<String>(
    'operator_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operatedAtMeta = const VerificationMeta(
    'operatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> operatedAt = GeneratedColumn<DateTime>(
    'operated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    entityType,
    entityUuid,
    actionType,
    oldValue,
    newValue,
    operatorName,
    operatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuditLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_uuid')) {
      context.handle(
        _entityUuidMeta,
        entityUuid.isAcceptableOrUnknown(data['entity_uuid']!, _entityUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_entityUuidMeta);
    }
    if (data.containsKey('action_type')) {
      context.handle(
        _actionTypeMeta,
        actionType.isAcceptableOrUnknown(data['action_type']!, _actionTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_actionTypeMeta);
    }
    if (data.containsKey('old_value')) {
      context.handle(
        _oldValueMeta,
        oldValue.isAcceptableOrUnknown(data['old_value']!, _oldValueMeta),
      );
    }
    if (data.containsKey('new_value')) {
      context.handle(
        _newValueMeta,
        newValue.isAcceptableOrUnknown(data['new_value']!, _newValueMeta),
      );
    }
    if (data.containsKey('operator_name')) {
      context.handle(
        _operatorNameMeta,
        operatorName.isAcceptableOrUnknown(
          data['operator_name']!,
          _operatorNameMeta,
        ),
      );
    }
    if (data.containsKey('operated_at')) {
      context.handle(
        _operatedAtMeta,
        operatedAt.isAcceptableOrUnknown(data['operated_at']!, _operatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_uuid'],
      )!,
      actionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action_type'],
      )!,
      oldValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}old_value'],
      ),
      newValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}new_value'],
      ),
      operatorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}operator_name'],
      ),
      operatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}operated_at'],
      )!,
    );
  }

  @override
  $AuditLogsTable createAlias(String alias) {
    return $AuditLogsTable(attachedDatabase, alias);
  }
}

class AuditLog extends DataClass implements Insertable<AuditLog> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String entityType;
  final String entityUuid;
  final String actionType;
  final String? oldValue;
  final String? newValue;
  final String? operatorName;
  final DateTime operatedAt;
  const AuditLog({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.entityType,
    required this.entityUuid,
    required this.actionType,
    this.oldValue,
    this.newValue,
    this.operatorName,
    required this.operatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['entity_type'] = Variable<String>(entityType);
    map['entity_uuid'] = Variable<String>(entityUuid);
    map['action_type'] = Variable<String>(actionType);
    if (!nullToAbsent || oldValue != null) {
      map['old_value'] = Variable<String>(oldValue);
    }
    if (!nullToAbsent || newValue != null) {
      map['new_value'] = Variable<String>(newValue);
    }
    if (!nullToAbsent || operatorName != null) {
      map['operator_name'] = Variable<String>(operatorName);
    }
    map['operated_at'] = Variable<DateTime>(operatedAt);
    return map;
  }

  AuditLogsCompanion toCompanion(bool nullToAbsent) {
    return AuditLogsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      entityType: Value(entityType),
      entityUuid: Value(entityUuid),
      actionType: Value(actionType),
      oldValue: oldValue == null && nullToAbsent
          ? const Value.absent()
          : Value(oldValue),
      newValue: newValue == null && nullToAbsent
          ? const Value.absent()
          : Value(newValue),
      operatorName: operatorName == null && nullToAbsent
          ? const Value.absent()
          : Value(operatorName),
      operatedAt: Value(operatedAt),
    );
  }

  factory AuditLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLog(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityUuid: serializer.fromJson<String>(json['entityUuid']),
      actionType: serializer.fromJson<String>(json['actionType']),
      oldValue: serializer.fromJson<String?>(json['oldValue']),
      newValue: serializer.fromJson<String?>(json['newValue']),
      operatorName: serializer.fromJson<String?>(json['operatorName']),
      operatedAt: serializer.fromJson<DateTime>(json['operatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'entityType': serializer.toJson<String>(entityType),
      'entityUuid': serializer.toJson<String>(entityUuid),
      'actionType': serializer.toJson<String>(actionType),
      'oldValue': serializer.toJson<String?>(oldValue),
      'newValue': serializer.toJson<String?>(newValue),
      'operatorName': serializer.toJson<String?>(operatorName),
      'operatedAt': serializer.toJson<DateTime>(operatedAt),
    };
  }

  AuditLog copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? entityType,
    String? entityUuid,
    String? actionType,
    Value<String?> oldValue = const Value.absent(),
    Value<String?> newValue = const Value.absent(),
    Value<String?> operatorName = const Value.absent(),
    DateTime? operatedAt,
  }) => AuditLog(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    entityType: entityType ?? this.entityType,
    entityUuid: entityUuid ?? this.entityUuid,
    actionType: actionType ?? this.actionType,
    oldValue: oldValue.present ? oldValue.value : this.oldValue,
    newValue: newValue.present ? newValue.value : this.newValue,
    operatorName: operatorName.present ? operatorName.value : this.operatorName,
    operatedAt: operatedAt ?? this.operatedAt,
  );
  AuditLog copyWithCompanion(AuditLogsCompanion data) {
    return AuditLog(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityUuid: data.entityUuid.present
          ? data.entityUuid.value
          : this.entityUuid,
      actionType: data.actionType.present
          ? data.actionType.value
          : this.actionType,
      oldValue: data.oldValue.present ? data.oldValue.value : this.oldValue,
      newValue: data.newValue.present ? data.newValue.value : this.newValue,
      operatorName: data.operatorName.present
          ? data.operatorName.value
          : this.operatorName,
      operatedAt: data.operatedAt.present
          ? data.operatedAt.value
          : this.operatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLog(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('entityType: $entityType, ')
          ..write('entityUuid: $entityUuid, ')
          ..write('actionType: $actionType, ')
          ..write('oldValue: $oldValue, ')
          ..write('newValue: $newValue, ')
          ..write('operatorName: $operatorName, ')
          ..write('operatedAt: $operatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    entityType,
    entityUuid,
    actionType,
    oldValue,
    newValue,
    operatorName,
    operatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLog &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.entityType == this.entityType &&
          other.entityUuid == this.entityUuid &&
          other.actionType == this.actionType &&
          other.oldValue == this.oldValue &&
          other.newValue == this.newValue &&
          other.operatorName == this.operatorName &&
          other.operatedAt == this.operatedAt);
}

class AuditLogsCompanion extends UpdateCompanion<AuditLog> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> entityType;
  final Value<String> entityUuid;
  final Value<String> actionType;
  final Value<String?> oldValue;
  final Value<String?> newValue;
  final Value<String?> operatorName;
  final Value<DateTime> operatedAt;
  const AuditLogsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityUuid = const Value.absent(),
    this.actionType = const Value.absent(),
    this.oldValue = const Value.absent(),
    this.newValue = const Value.absent(),
    this.operatorName = const Value.absent(),
    this.operatedAt = const Value.absent(),
  });
  AuditLogsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String entityType,
    required String entityUuid,
    required String actionType,
    this.oldValue = const Value.absent(),
    this.newValue = const Value.absent(),
    this.operatorName = const Value.absent(),
    this.operatedAt = const Value.absent(),
  }) : uuid = Value(uuid),
       entityType = Value(entityType),
       entityUuid = Value(entityUuid),
       actionType = Value(actionType);
  static Insertable<AuditLog> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? entityType,
    Expression<String>? entityUuid,
    Expression<String>? actionType,
    Expression<String>? oldValue,
    Expression<String>? newValue,
    Expression<String>? operatorName,
    Expression<DateTime>? operatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (entityType != null) 'entity_type': entityType,
      if (entityUuid != null) 'entity_uuid': entityUuid,
      if (actionType != null) 'action_type': actionType,
      if (oldValue != null) 'old_value': oldValue,
      if (newValue != null) 'new_value': newValue,
      if (operatorName != null) 'operator_name': operatorName,
      if (operatedAt != null) 'operated_at': operatedAt,
    });
  }

  AuditLogsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? entityType,
    Value<String>? entityUuid,
    Value<String>? actionType,
    Value<String?>? oldValue,
    Value<String?>? newValue,
    Value<String?>? operatorName,
    Value<DateTime>? operatedAt,
  }) {
    return AuditLogsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      entityType: entityType ?? this.entityType,
      entityUuid: entityUuid ?? this.entityUuid,
      actionType: actionType ?? this.actionType,
      oldValue: oldValue ?? this.oldValue,
      newValue: newValue ?? this.newValue,
      operatorName: operatorName ?? this.operatorName,
      operatedAt: operatedAt ?? this.operatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityUuid.present) {
      map['entity_uuid'] = Variable<String>(entityUuid.value);
    }
    if (actionType.present) {
      map['action_type'] = Variable<String>(actionType.value);
    }
    if (oldValue.present) {
      map['old_value'] = Variable<String>(oldValue.value);
    }
    if (newValue.present) {
      map['new_value'] = Variable<String>(newValue.value);
    }
    if (operatorName.present) {
      map['operator_name'] = Variable<String>(operatorName.value);
    }
    if (operatedAt.present) {
      map['operated_at'] = Variable<DateTime>(operatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('entityType: $entityType, ')
          ..write('entityUuid: $entityUuid, ')
          ..write('actionType: $actionType, ')
          ..write('oldValue: $oldValue, ')
          ..write('newValue: $newValue, ')
          ..write('operatorName: $operatorName, ')
          ..write('operatedAt: $operatedAt')
          ..write(')'))
        .toString();
  }
}

class $DictionariesTable extends Dictionaries
    with TableInfo<$DictionariesTable, Dictionary> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DictionariesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dictTypeMeta = const VerificationMeta(
    'dictType',
  );
  @override
  late final GeneratedColumn<String> dictType = GeneratedColumn<String>(
    'dict_type',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dictKeyMeta = const VerificationMeta(
    'dictKey',
  );
  @override
  late final GeneratedColumn<String> dictKey = GeneratedColumn<String>(
    'dict_key',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 96,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dictLabelMeta = const VerificationMeta(
    'dictLabel',
  );
  @override
  late final GeneratedColumn<String> dictLabel = GeneratedColumn<String>(
    'dict_label',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 128,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    dictType,
    dictKey,
    dictLabel,
    sortOrder,
    isEnabled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dictionaries';
  @override
  VerificationContext validateIntegrity(
    Insertable<Dictionary> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('dict_type')) {
      context.handle(
        _dictTypeMeta,
        dictType.isAcceptableOrUnknown(data['dict_type']!, _dictTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_dictTypeMeta);
    }
    if (data.containsKey('dict_key')) {
      context.handle(
        _dictKeyMeta,
        dictKey.isAcceptableOrUnknown(data['dict_key']!, _dictKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_dictKeyMeta);
    }
    if (data.containsKey('dict_label')) {
      context.handle(
        _dictLabelMeta,
        dictLabel.isAcceptableOrUnknown(data['dict_label']!, _dictLabelMeta),
      );
    } else if (isInserting) {
      context.missing(_dictLabelMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {dictType, dictKey},
  ];
  @override
  Dictionary map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Dictionary(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      dictType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dict_type'],
      )!,
      dictKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dict_key'],
      )!,
      dictLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dict_label'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
    );
  }

  @override
  $DictionariesTable createAlias(String alias) {
    return $DictionariesTable(attachedDatabase, alias);
  }
}

class Dictionary extends DataClass implements Insertable<Dictionary> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String dictType;
  final String dictKey;
  final String dictLabel;
  final int sortOrder;
  final bool isEnabled;
  const Dictionary({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.dictType,
    required this.dictKey,
    required this.dictLabel,
    required this.sortOrder,
    required this.isEnabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['dict_type'] = Variable<String>(dictType);
    map['dict_key'] = Variable<String>(dictKey);
    map['dict_label'] = Variable<String>(dictLabel);
    map['sort_order'] = Variable<int>(sortOrder);
    map['is_enabled'] = Variable<bool>(isEnabled);
    return map;
  }

  DictionariesCompanion toCompanion(bool nullToAbsent) {
    return DictionariesCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      dictType: Value(dictType),
      dictKey: Value(dictKey),
      dictLabel: Value(dictLabel),
      sortOrder: Value(sortOrder),
      isEnabled: Value(isEnabled),
    );
  }

  factory Dictionary.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Dictionary(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      dictType: serializer.fromJson<String>(json['dictType']),
      dictKey: serializer.fromJson<String>(json['dictKey']),
      dictLabel: serializer.fromJson<String>(json['dictLabel']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'dictType': serializer.toJson<String>(dictType),
      'dictKey': serializer.toJson<String>(dictKey),
      'dictLabel': serializer.toJson<String>(dictLabel),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'isEnabled': serializer.toJson<bool>(isEnabled),
    };
  }

  Dictionary copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? dictType,
    String? dictKey,
    String? dictLabel,
    int? sortOrder,
    bool? isEnabled,
  }) => Dictionary(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    dictType: dictType ?? this.dictType,
    dictKey: dictKey ?? this.dictKey,
    dictLabel: dictLabel ?? this.dictLabel,
    sortOrder: sortOrder ?? this.sortOrder,
    isEnabled: isEnabled ?? this.isEnabled,
  );
  Dictionary copyWithCompanion(DictionariesCompanion data) {
    return Dictionary(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      dictType: data.dictType.present ? data.dictType.value : this.dictType,
      dictKey: data.dictKey.present ? data.dictKey.value : this.dictKey,
      dictLabel: data.dictLabel.present ? data.dictLabel.value : this.dictLabel,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Dictionary(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('dictType: $dictType, ')
          ..write('dictKey: $dictKey, ')
          ..write('dictLabel: $dictLabel, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isEnabled: $isEnabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    dictType,
    dictKey,
    dictLabel,
    sortOrder,
    isEnabled,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Dictionary &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.dictType == this.dictType &&
          other.dictKey == this.dictKey &&
          other.dictLabel == this.dictLabel &&
          other.sortOrder == this.sortOrder &&
          other.isEnabled == this.isEnabled);
}

class DictionariesCompanion extends UpdateCompanion<Dictionary> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> dictType;
  final Value<String> dictKey;
  final Value<String> dictLabel;
  final Value<int> sortOrder;
  final Value<bool> isEnabled;
  const DictionariesCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.dictType = const Value.absent(),
    this.dictKey = const Value.absent(),
    this.dictLabel = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isEnabled = const Value.absent(),
  });
  DictionariesCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String dictType,
    required String dictKey,
    required String dictLabel,
    this.sortOrder = const Value.absent(),
    this.isEnabled = const Value.absent(),
  }) : uuid = Value(uuid),
       dictType = Value(dictType),
       dictKey = Value(dictKey),
       dictLabel = Value(dictLabel);
  static Insertable<Dictionary> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? dictType,
    Expression<String>? dictKey,
    Expression<String>? dictLabel,
    Expression<int>? sortOrder,
    Expression<bool>? isEnabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (dictType != null) 'dict_type': dictType,
      if (dictKey != null) 'dict_key': dictKey,
      if (dictLabel != null) 'dict_label': dictLabel,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (isEnabled != null) 'is_enabled': isEnabled,
    });
  }

  DictionariesCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? dictType,
    Value<String>? dictKey,
    Value<String>? dictLabel,
    Value<int>? sortOrder,
    Value<bool>? isEnabled,
  }) {
    return DictionariesCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      dictType: dictType ?? this.dictType,
      dictKey: dictKey ?? this.dictKey,
      dictLabel: dictLabel ?? this.dictLabel,
      sortOrder: sortOrder ?? this.sortOrder,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (dictType.present) {
      map['dict_type'] = Variable<String>(dictType.value);
    }
    if (dictKey.present) {
      map['dict_key'] = Variable<String>(dictKey.value);
    }
    if (dictLabel.present) {
      map['dict_label'] = Variable<String>(dictLabel.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DictionariesCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('dictType: $dictType, ')
          ..write('dictKey: $dictKey, ')
          ..write('dictLabel: $dictLabel, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isEnabled: $isEnabled')
          ..write(')'))
        .toString();
  }
}

class $CustomFieldsTable extends CustomFields
    with TableInfo<$CustomFieldsTable, CustomField> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomFieldsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fieldKeyMeta = const VerificationMeta(
    'fieldKey',
  );
  @override
  late final GeneratedColumn<String> fieldKey = GeneratedColumn<String>(
    'field_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fieldLabelMeta = const VerificationMeta(
    'fieldLabel',
  );
  @override
  late final GeneratedColumn<String> fieldLabel = GeneratedColumn<String>(
    'field_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fieldTypeMeta = const VerificationMeta(
    'fieldType',
  );
  @override
  late final GeneratedColumn<String> fieldType = GeneratedColumn<String>(
    'field_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('text'),
  );
  static const VerificationMeta _isRequiredMeta = const VerificationMeta(
    'isRequired',
  );
  @override
  late final GeneratedColumn<bool> isRequired = GeneratedColumn<bool>(
    'is_required',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_required" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _optionsJsonMeta = const VerificationMeta(
    'optionsJson',
  );
  @override
  late final GeneratedColumn<String> optionsJson = GeneratedColumn<String>(
    'options_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    entityType,
    fieldKey,
    fieldLabel,
    fieldType,
    isRequired,
    isEnabled,
    sortOrder,
    optionsJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_fields';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomField> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('field_key')) {
      context.handle(
        _fieldKeyMeta,
        fieldKey.isAcceptableOrUnknown(data['field_key']!, _fieldKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_fieldKeyMeta);
    }
    if (data.containsKey('field_label')) {
      context.handle(
        _fieldLabelMeta,
        fieldLabel.isAcceptableOrUnknown(data['field_label']!, _fieldLabelMeta),
      );
    } else if (isInserting) {
      context.missing(_fieldLabelMeta);
    }
    if (data.containsKey('field_type')) {
      context.handle(
        _fieldTypeMeta,
        fieldType.isAcceptableOrUnknown(data['field_type']!, _fieldTypeMeta),
      );
    }
    if (data.containsKey('is_required')) {
      context.handle(
        _isRequiredMeta,
        isRequired.isAcceptableOrUnknown(data['is_required']!, _isRequiredMeta),
      );
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('options_json')) {
      context.handle(
        _optionsJsonMeta,
        optionsJson.isAcceptableOrUnknown(
          data['options_json']!,
          _optionsJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {entityType, fieldKey},
  ];
  @override
  CustomField map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomField(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      fieldKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}field_key'],
      )!,
      fieldLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}field_label'],
      )!,
      fieldType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}field_type'],
      )!,
      isRequired: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_required'],
      )!,
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      optionsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}options_json'],
      ),
    );
  }

  @override
  $CustomFieldsTable createAlias(String alias) {
    return $CustomFieldsTable(attachedDatabase, alias);
  }
}

class CustomField extends DataClass implements Insertable<CustomField> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String entityType;
  final String fieldKey;
  final String fieldLabel;
  final String fieldType;
  final bool isRequired;
  final bool isEnabled;
  final int sortOrder;
  final String? optionsJson;
  const CustomField({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.entityType,
    required this.fieldKey,
    required this.fieldLabel,
    required this.fieldType,
    required this.isRequired,
    required this.isEnabled,
    required this.sortOrder,
    this.optionsJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['entity_type'] = Variable<String>(entityType);
    map['field_key'] = Variable<String>(fieldKey);
    map['field_label'] = Variable<String>(fieldLabel);
    map['field_type'] = Variable<String>(fieldType);
    map['is_required'] = Variable<bool>(isRequired);
    map['is_enabled'] = Variable<bool>(isEnabled);
    map['sort_order'] = Variable<int>(sortOrder);
    if (!nullToAbsent || optionsJson != null) {
      map['options_json'] = Variable<String>(optionsJson);
    }
    return map;
  }

  CustomFieldsCompanion toCompanion(bool nullToAbsent) {
    return CustomFieldsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      entityType: Value(entityType),
      fieldKey: Value(fieldKey),
      fieldLabel: Value(fieldLabel),
      fieldType: Value(fieldType),
      isRequired: Value(isRequired),
      isEnabled: Value(isEnabled),
      sortOrder: Value(sortOrder),
      optionsJson: optionsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(optionsJson),
    );
  }

  factory CustomField.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomField(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      entityType: serializer.fromJson<String>(json['entityType']),
      fieldKey: serializer.fromJson<String>(json['fieldKey']),
      fieldLabel: serializer.fromJson<String>(json['fieldLabel']),
      fieldType: serializer.fromJson<String>(json['fieldType']),
      isRequired: serializer.fromJson<bool>(json['isRequired']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      optionsJson: serializer.fromJson<String?>(json['optionsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'entityType': serializer.toJson<String>(entityType),
      'fieldKey': serializer.toJson<String>(fieldKey),
      'fieldLabel': serializer.toJson<String>(fieldLabel),
      'fieldType': serializer.toJson<String>(fieldType),
      'isRequired': serializer.toJson<bool>(isRequired),
      'isEnabled': serializer.toJson<bool>(isEnabled),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'optionsJson': serializer.toJson<String?>(optionsJson),
    };
  }

  CustomField copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? entityType,
    String? fieldKey,
    String? fieldLabel,
    String? fieldType,
    bool? isRequired,
    bool? isEnabled,
    int? sortOrder,
    Value<String?> optionsJson = const Value.absent(),
  }) => CustomField(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    entityType: entityType ?? this.entityType,
    fieldKey: fieldKey ?? this.fieldKey,
    fieldLabel: fieldLabel ?? this.fieldLabel,
    fieldType: fieldType ?? this.fieldType,
    isRequired: isRequired ?? this.isRequired,
    isEnabled: isEnabled ?? this.isEnabled,
    sortOrder: sortOrder ?? this.sortOrder,
    optionsJson: optionsJson.present ? optionsJson.value : this.optionsJson,
  );
  CustomField copyWithCompanion(CustomFieldsCompanion data) {
    return CustomField(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      fieldKey: data.fieldKey.present ? data.fieldKey.value : this.fieldKey,
      fieldLabel: data.fieldLabel.present
          ? data.fieldLabel.value
          : this.fieldLabel,
      fieldType: data.fieldType.present ? data.fieldType.value : this.fieldType,
      isRequired: data.isRequired.present
          ? data.isRequired.value
          : this.isRequired,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      optionsJson: data.optionsJson.present
          ? data.optionsJson.value
          : this.optionsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomField(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('entityType: $entityType, ')
          ..write('fieldKey: $fieldKey, ')
          ..write('fieldLabel: $fieldLabel, ')
          ..write('fieldType: $fieldType, ')
          ..write('isRequired: $isRequired, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('optionsJson: $optionsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    entityType,
    fieldKey,
    fieldLabel,
    fieldType,
    isRequired,
    isEnabled,
    sortOrder,
    optionsJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomField &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.entityType == this.entityType &&
          other.fieldKey == this.fieldKey &&
          other.fieldLabel == this.fieldLabel &&
          other.fieldType == this.fieldType &&
          other.isRequired == this.isRequired &&
          other.isEnabled == this.isEnabled &&
          other.sortOrder == this.sortOrder &&
          other.optionsJson == this.optionsJson);
}

class CustomFieldsCompanion extends UpdateCompanion<CustomField> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> entityType;
  final Value<String> fieldKey;
  final Value<String> fieldLabel;
  final Value<String> fieldType;
  final Value<bool> isRequired;
  final Value<bool> isEnabled;
  final Value<int> sortOrder;
  final Value<String?> optionsJson;
  const CustomFieldsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.entityType = const Value.absent(),
    this.fieldKey = const Value.absent(),
    this.fieldLabel = const Value.absent(),
    this.fieldType = const Value.absent(),
    this.isRequired = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.optionsJson = const Value.absent(),
  });
  CustomFieldsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String entityType,
    required String fieldKey,
    required String fieldLabel,
    this.fieldType = const Value.absent(),
    this.isRequired = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.optionsJson = const Value.absent(),
  }) : uuid = Value(uuid),
       entityType = Value(entityType),
       fieldKey = Value(fieldKey),
       fieldLabel = Value(fieldLabel);
  static Insertable<CustomField> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? entityType,
    Expression<String>? fieldKey,
    Expression<String>? fieldLabel,
    Expression<String>? fieldType,
    Expression<bool>? isRequired,
    Expression<bool>? isEnabled,
    Expression<int>? sortOrder,
    Expression<String>? optionsJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (entityType != null) 'entity_type': entityType,
      if (fieldKey != null) 'field_key': fieldKey,
      if (fieldLabel != null) 'field_label': fieldLabel,
      if (fieldType != null) 'field_type': fieldType,
      if (isRequired != null) 'is_required': isRequired,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (optionsJson != null) 'options_json': optionsJson,
    });
  }

  CustomFieldsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? entityType,
    Value<String>? fieldKey,
    Value<String>? fieldLabel,
    Value<String>? fieldType,
    Value<bool>? isRequired,
    Value<bool>? isEnabled,
    Value<int>? sortOrder,
    Value<String?>? optionsJson,
  }) {
    return CustomFieldsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      entityType: entityType ?? this.entityType,
      fieldKey: fieldKey ?? this.fieldKey,
      fieldLabel: fieldLabel ?? this.fieldLabel,
      fieldType: fieldType ?? this.fieldType,
      isRequired: isRequired ?? this.isRequired,
      isEnabled: isEnabled ?? this.isEnabled,
      sortOrder: sortOrder ?? this.sortOrder,
      optionsJson: optionsJson ?? this.optionsJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (fieldKey.present) {
      map['field_key'] = Variable<String>(fieldKey.value);
    }
    if (fieldLabel.present) {
      map['field_label'] = Variable<String>(fieldLabel.value);
    }
    if (fieldType.present) {
      map['field_type'] = Variable<String>(fieldType.value);
    }
    if (isRequired.present) {
      map['is_required'] = Variable<bool>(isRequired.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (optionsJson.present) {
      map['options_json'] = Variable<String>(optionsJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomFieldsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('entityType: $entityType, ')
          ..write('fieldKey: $fieldKey, ')
          ..write('fieldLabel: $fieldLabel, ')
          ..write('fieldType: $fieldType, ')
          ..write('isRequired: $isRequired, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('optionsJson: $optionsJson')
          ..write(')'))
        .toString();
  }
}

class $CustomFieldValuesTable extends CustomFieldValues
    with TableInfo<$CustomFieldValuesTable, CustomFieldValue> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomFieldValuesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityUuidMeta = const VerificationMeta(
    'entityUuid',
  );
  @override
  late final GeneratedColumn<String> entityUuid = GeneratedColumn<String>(
    'entity_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fieldUuidMeta = const VerificationMeta(
    'fieldUuid',
  );
  @override
  late final GeneratedColumn<String> fieldUuid = GeneratedColumn<String>(
    'field_uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fieldKeyMeta = const VerificationMeta(
    'fieldKey',
  );
  @override
  late final GeneratedColumn<String> fieldKey = GeneratedColumn<String>(
    'field_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fieldValueMeta = const VerificationMeta(
    'fieldValue',
  );
  @override
  late final GeneratedColumn<String> fieldValue = GeneratedColumn<String>(
    'field_value',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    entityType,
    entityUuid,
    fieldUuid,
    fieldKey,
    fieldValue,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'custom_field_values';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomFieldValue> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_uuid')) {
      context.handle(
        _entityUuidMeta,
        entityUuid.isAcceptableOrUnknown(data['entity_uuid']!, _entityUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_entityUuidMeta);
    }
    if (data.containsKey('field_uuid')) {
      context.handle(
        _fieldUuidMeta,
        fieldUuid.isAcceptableOrUnknown(data['field_uuid']!, _fieldUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_fieldUuidMeta);
    }
    if (data.containsKey('field_key')) {
      context.handle(
        _fieldKeyMeta,
        fieldKey.isAcceptableOrUnknown(data['field_key']!, _fieldKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_fieldKeyMeta);
    }
    if (data.containsKey('field_value')) {
      context.handle(
        _fieldValueMeta,
        fieldValue.isAcceptableOrUnknown(data['field_value']!, _fieldValueMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomFieldValue map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomFieldValue(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      remark: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remark'],
      ),
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_uuid'],
      )!,
      fieldUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}field_uuid'],
      )!,
      fieldKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}field_key'],
      )!,
      fieldValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}field_value'],
      ),
    );
  }

  @override
  $CustomFieldValuesTable createAlias(String alias) {
    return $CustomFieldValuesTable(attachedDatabase, alias);
  }
}

class CustomFieldValue extends DataClass
    implements Insertable<CustomFieldValue> {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String? deviceId;
  final int version;
  final String? remark;
  final String entityType;
  final String entityUuid;
  final String fieldUuid;
  final String fieldKey;
  final String? fieldValue;
  const CustomFieldValue({
    required this.id,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.syncStatus,
    this.deviceId,
    required this.version,
    this.remark,
    required this.entityType,
    required this.entityUuid,
    required this.fieldUuid,
    required this.fieldKey,
    this.fieldValue,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || remark != null) {
      map['remark'] = Variable<String>(remark);
    }
    map['entity_type'] = Variable<String>(entityType);
    map['entity_uuid'] = Variable<String>(entityUuid);
    map['field_uuid'] = Variable<String>(fieldUuid);
    map['field_key'] = Variable<String>(fieldKey);
    if (!nullToAbsent || fieldValue != null) {
      map['field_value'] = Variable<String>(fieldValue);
    }
    return map;
  }

  CustomFieldValuesCompanion toCompanion(bool nullToAbsent) {
    return CustomFieldValuesCompanion(
      id: Value(id),
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: deviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceId),
      version: Value(version),
      remark: remark == null && nullToAbsent
          ? const Value.absent()
          : Value(remark),
      entityType: Value(entityType),
      entityUuid: Value(entityUuid),
      fieldUuid: Value(fieldUuid),
      fieldKey: Value(fieldKey),
      fieldValue: fieldValue == null && nullToAbsent
          ? const Value.absent()
          : Value(fieldValue),
    );
  }

  factory CustomFieldValue.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomFieldValue(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      remark: serializer.fromJson<String?>(json['remark']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityUuid: serializer.fromJson<String>(json['entityUuid']),
      fieldUuid: serializer.fromJson<String>(json['fieldUuid']),
      fieldKey: serializer.fromJson<String>(json['fieldKey']),
      fieldValue: serializer.fromJson<String?>(json['fieldValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String?>(deviceId),
      'version': serializer.toJson<int>(version),
      'remark': serializer.toJson<String?>(remark),
      'entityType': serializer.toJson<String>(entityType),
      'entityUuid': serializer.toJson<String>(entityUuid),
      'fieldUuid': serializer.toJson<String>(fieldUuid),
      'fieldKey': serializer.toJson<String>(fieldKey),
      'fieldValue': serializer.toJson<String?>(fieldValue),
    };
  }

  CustomFieldValue copyWith({
    int? id,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? syncStatus,
    Value<String?> deviceId = const Value.absent(),
    int? version,
    Value<String?> remark = const Value.absent(),
    String? entityType,
    String? entityUuid,
    String? fieldUuid,
    String? fieldKey,
    Value<String?> fieldValue = const Value.absent(),
  }) => CustomFieldValue(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    version: version ?? this.version,
    remark: remark.present ? remark.value : this.remark,
    entityType: entityType ?? this.entityType,
    entityUuid: entityUuid ?? this.entityUuid,
    fieldUuid: fieldUuid ?? this.fieldUuid,
    fieldKey: fieldKey ?? this.fieldKey,
    fieldValue: fieldValue.present ? fieldValue.value : this.fieldValue,
  );
  CustomFieldValue copyWithCompanion(CustomFieldValuesCompanion data) {
    return CustomFieldValue(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      remark: data.remark.present ? data.remark.value : this.remark,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityUuid: data.entityUuid.present
          ? data.entityUuid.value
          : this.entityUuid,
      fieldUuid: data.fieldUuid.present ? data.fieldUuid.value : this.fieldUuid,
      fieldKey: data.fieldKey.present ? data.fieldKey.value : this.fieldKey,
      fieldValue: data.fieldValue.present
          ? data.fieldValue.value
          : this.fieldValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomFieldValue(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('entityType: $entityType, ')
          ..write('entityUuid: $entityUuid, ')
          ..write('fieldUuid: $fieldUuid, ')
          ..write('fieldKey: $fieldKey, ')
          ..write('fieldValue: $fieldValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    createdAt,
    updatedAt,
    deletedAt,
    syncStatus,
    deviceId,
    version,
    remark,
    entityType,
    entityUuid,
    fieldUuid,
    fieldKey,
    fieldValue,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomFieldValue &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.remark == this.remark &&
          other.entityType == this.entityType &&
          other.entityUuid == this.entityUuid &&
          other.fieldUuid == this.fieldUuid &&
          other.fieldKey == this.fieldKey &&
          other.fieldValue == this.fieldValue);
}

class CustomFieldValuesCompanion extends UpdateCompanion<CustomFieldValue> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String?> deviceId;
  final Value<int> version;
  final Value<String?> remark;
  final Value<String> entityType;
  final Value<String> entityUuid;
  final Value<String> fieldUuid;
  final Value<String> fieldKey;
  final Value<String?> fieldValue;
  const CustomFieldValuesCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityUuid = const Value.absent(),
    this.fieldUuid = const Value.absent(),
    this.fieldKey = const Value.absent(),
    this.fieldValue = const Value.absent(),
  });
  CustomFieldValuesCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.remark = const Value.absent(),
    required String entityType,
    required String entityUuid,
    required String fieldUuid,
    required String fieldKey,
    this.fieldValue = const Value.absent(),
  }) : uuid = Value(uuid),
       entityType = Value(entityType),
       entityUuid = Value(entityUuid),
       fieldUuid = Value(fieldUuid),
       fieldKey = Value(fieldKey);
  static Insertable<CustomFieldValue> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? remark,
    Expression<String>? entityType,
    Expression<String>? entityUuid,
    Expression<String>? fieldUuid,
    Expression<String>? fieldKey,
    Expression<String>? fieldValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (remark != null) 'remark': remark,
      if (entityType != null) 'entity_type': entityType,
      if (entityUuid != null) 'entity_uuid': entityUuid,
      if (fieldUuid != null) 'field_uuid': fieldUuid,
      if (fieldKey != null) 'field_key': fieldKey,
      if (fieldValue != null) 'field_value': fieldValue,
    });
  }

  CustomFieldValuesCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? deletedAt,
    Value<String>? syncStatus,
    Value<String?>? deviceId,
    Value<int>? version,
    Value<String?>? remark,
    Value<String>? entityType,
    Value<String>? entityUuid,
    Value<String>? fieldUuid,
    Value<String>? fieldKey,
    Value<String?>? fieldValue,
  }) {
    return CustomFieldValuesCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      remark: remark ?? this.remark,
      entityType: entityType ?? this.entityType,
      entityUuid: entityUuid ?? this.entityUuid,
      fieldUuid: fieldUuid ?? this.fieldUuid,
      fieldKey: fieldKey ?? this.fieldKey,
      fieldValue: fieldValue ?? this.fieldValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityUuid.present) {
      map['entity_uuid'] = Variable<String>(entityUuid.value);
    }
    if (fieldUuid.present) {
      map['field_uuid'] = Variable<String>(fieldUuid.value);
    }
    if (fieldKey.present) {
      map['field_key'] = Variable<String>(fieldKey.value);
    }
    if (fieldValue.present) {
      map['field_value'] = Variable<String>(fieldValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomFieldValuesCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('remark: $remark, ')
          ..write('entityType: $entityType, ')
          ..write('entityUuid: $entityUuid, ')
          ..write('fieldUuid: $fieldUuid, ')
          ..write('fieldKey: $fieldKey, ')
          ..write('fieldValue: $fieldValue')
          ..write(')'))
        .toString();
  }
}

class $SchemaMigrationEntriesTable extends SchemaMigrationEntries
    with TableInfo<$SchemaMigrationEntriesTable, SchemaMigrationEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchemaMigrationEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _appliedAtMeta = const VerificationMeta(
    'appliedAt',
  );
  @override
  late final GeneratedColumn<DateTime> appliedAt = GeneratedColumn<DateTime>(
    'applied_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, version, description, appliedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schema_migrations';
  @override
  VerificationContext validateIntegrity(
    Insertable<SchemaMigrationEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('applied_at')) {
      context.handle(
        _appliedAtMeta,
        appliedAt.isAcceptableOrUnknown(data['applied_at']!, _appliedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_appliedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SchemaMigrationEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SchemaMigrationEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      appliedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}applied_at'],
      )!,
    );
  }

  @override
  $SchemaMigrationEntriesTable createAlias(String alias) {
    return $SchemaMigrationEntriesTable(attachedDatabase, alias);
  }
}

class SchemaMigrationEntry extends DataClass
    implements Insertable<SchemaMigrationEntry> {
  final int id;
  final int version;
  final String description;
  final DateTime appliedAt;
  const SchemaMigrationEntry({
    required this.id,
    required this.version,
    required this.description,
    required this.appliedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['version'] = Variable<int>(version);
    map['description'] = Variable<String>(description);
    map['applied_at'] = Variable<DateTime>(appliedAt);
    return map;
  }

  SchemaMigrationEntriesCompanion toCompanion(bool nullToAbsent) {
    return SchemaMigrationEntriesCompanion(
      id: Value(id),
      version: Value(version),
      description: Value(description),
      appliedAt: Value(appliedAt),
    );
  }

  factory SchemaMigrationEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SchemaMigrationEntry(
      id: serializer.fromJson<int>(json['id']),
      version: serializer.fromJson<int>(json['version']),
      description: serializer.fromJson<String>(json['description']),
      appliedAt: serializer.fromJson<DateTime>(json['appliedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'version': serializer.toJson<int>(version),
      'description': serializer.toJson<String>(description),
      'appliedAt': serializer.toJson<DateTime>(appliedAt),
    };
  }

  SchemaMigrationEntry copyWith({
    int? id,
    int? version,
    String? description,
    DateTime? appliedAt,
  }) => SchemaMigrationEntry(
    id: id ?? this.id,
    version: version ?? this.version,
    description: description ?? this.description,
    appliedAt: appliedAt ?? this.appliedAt,
  );
  SchemaMigrationEntry copyWithCompanion(SchemaMigrationEntriesCompanion data) {
    return SchemaMigrationEntry(
      id: data.id.present ? data.id.value : this.id,
      version: data.version.present ? data.version.value : this.version,
      description: data.description.present
          ? data.description.value
          : this.description,
      appliedAt: data.appliedAt.present ? data.appliedAt.value : this.appliedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SchemaMigrationEntry(')
          ..write('id: $id, ')
          ..write('version: $version, ')
          ..write('description: $description, ')
          ..write('appliedAt: $appliedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, version, description, appliedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SchemaMigrationEntry &&
          other.id == this.id &&
          other.version == this.version &&
          other.description == this.description &&
          other.appliedAt == this.appliedAt);
}

class SchemaMigrationEntriesCompanion
    extends UpdateCompanion<SchemaMigrationEntry> {
  final Value<int> id;
  final Value<int> version;
  final Value<String> description;
  final Value<DateTime> appliedAt;
  const SchemaMigrationEntriesCompanion({
    this.id = const Value.absent(),
    this.version = const Value.absent(),
    this.description = const Value.absent(),
    this.appliedAt = const Value.absent(),
  });
  SchemaMigrationEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int version,
    this.description = const Value.absent(),
    required DateTime appliedAt,
  }) : version = Value(version),
       appliedAt = Value(appliedAt);
  static Insertable<SchemaMigrationEntry> custom({
    Expression<int>? id,
    Expression<int>? version,
    Expression<String>? description,
    Expression<DateTime>? appliedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (version != null) 'version': version,
      if (description != null) 'description': description,
      if (appliedAt != null) 'applied_at': appliedAt,
    });
  }

  SchemaMigrationEntriesCompanion copyWith({
    Value<int>? id,
    Value<int>? version,
    Value<String>? description,
    Value<DateTime>? appliedAt,
  }) {
    return SchemaMigrationEntriesCompanion(
      id: id ?? this.id,
      version: version ?? this.version,
      description: description ?? this.description,
      appliedAt: appliedAt ?? this.appliedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (appliedAt.present) {
      map['applied_at'] = Variable<DateTime>(appliedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchemaMigrationEntriesCompanion(')
          ..write('id: $id, ')
          ..write('version: $version, ')
          ..write('description: $description, ')
          ..write('appliedAt: $appliedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $CustomerAddressesTable customerAddresses =
      $CustomerAddressesTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $ProductElementsTable productElements = $ProductElementsTable(
    this,
  );
  late final $SuppliersTable suppliers = $SuppliersTable(this);
  late final $SalesOrdersTable salesOrders = $SalesOrdersTable(this);
  late final $SalesOrderItemsTable salesOrderItems = $SalesOrderItemsTable(
    this,
  );
  late final $PurchaseOrdersTable purchaseOrders = $PurchaseOrdersTable(this);
  late final $PurchaseOrderItemsTable purchaseOrderItems =
      $PurchaseOrderItemsTable(this);
  late final $ShipmentsTable shipments = $ShipmentsTable(this);
  late final $ShipmentItemsTable shipmentItems = $ShipmentItemsTable(this);
  late final $InventoryItemsTable inventoryItems = $InventoryItemsTable(this);
  late final $InventoryLogsTable inventoryLogs = $InventoryLogsTable(this);
  late final $ExpenseItemsTable expenseItems = $ExpenseItemsTable(this);
  late final $PaymentsTable payments = $PaymentsTable(this);
  late final $AttachmentsTable attachments = $AttachmentsTable(this);
  late final $AuditLogsTable auditLogs = $AuditLogsTable(this);
  late final $DictionariesTable dictionaries = $DictionariesTable(this);
  late final $CustomFieldsTable customFields = $CustomFieldsTable(this);
  late final $CustomFieldValuesTable customFieldValues =
      $CustomFieldValuesTable(this);
  late final $SchemaMigrationEntriesTable schemaMigrationEntries =
      $SchemaMigrationEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    customers,
    customerAddresses,
    products,
    productElements,
    suppliers,
    salesOrders,
    salesOrderItems,
    purchaseOrders,
    purchaseOrderItems,
    shipments,
    shipmentItems,
    inventoryItems,
    inventoryLogs,
    expenseItems,
    payments,
    attachments,
    auditLogs,
    dictionaries,
    customFields,
    customFieldValues,
    schemaMigrationEntries,
  ];
}

typedef $$CustomersTableCreateCompanionBuilder =
    CustomersCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String customerName,
      Value<String?> companyName,
      Value<String?> contactName,
      Value<String?> department,
      Value<String?> phone,
      Value<String?> wechat,
      Value<String?> email,
      Value<String> customerType,
      Value<String?> taxNo,
    });
typedef $$CustomersTableUpdateCompanionBuilder =
    CustomersCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> customerName,
      Value<String?> companyName,
      Value<String?> contactName,
      Value<String?> department,
      Value<String?> phone,
      Value<String?> wechat,
      Value<String?> email,
      Value<String> customerType,
      Value<String?> taxNo,
    });

class $$CustomersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactName => $composableBuilder(
    column: $table.contactName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wechat => $composableBuilder(
    column: $table.wechat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerType => $composableBuilder(
    column: $table.customerType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taxNo => $composableBuilder(
    column: $table.taxNo,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CustomersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactName => $composableBuilder(
    column: $table.contactName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wechat => $composableBuilder(
    column: $table.wechat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerType => $composableBuilder(
    column: $table.customerType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taxNo => $composableBuilder(
    column: $table.taxNo,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contactName => $composableBuilder(
    column: $table.contactName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get wechat =>
      $composableBuilder(column: $table.wechat, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get customerType => $composableBuilder(
    column: $table.customerType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get taxNo =>
      $composableBuilder(column: $table.taxNo, builder: (column) => column);
}

class $$CustomersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomersTable,
          Customer,
          $$CustomersTableFilterComposer,
          $$CustomersTableOrderingComposer,
          $$CustomersTableAnnotationComposer,
          $$CustomersTableCreateCompanionBuilder,
          $$CustomersTableUpdateCompanionBuilder,
          (Customer, BaseReferences<_$AppDatabase, $CustomersTable, Customer>),
          Customer,
          PrefetchHooks Function()
        > {
  $$CustomersTableTableManager(_$AppDatabase db, $CustomersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> customerName = const Value.absent(),
                Value<String?> companyName = const Value.absent(),
                Value<String?> contactName = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> wechat = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String> customerType = const Value.absent(),
                Value<String?> taxNo = const Value.absent(),
              }) => CustomersCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                customerName: customerName,
                companyName: companyName,
                contactName: contactName,
                department: department,
                phone: phone,
                wechat: wechat,
                email: email,
                customerType: customerType,
                taxNo: taxNo,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String customerName,
                Value<String?> companyName = const Value.absent(),
                Value<String?> contactName = const Value.absent(),
                Value<String?> department = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> wechat = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String> customerType = const Value.absent(),
                Value<String?> taxNo = const Value.absent(),
              }) => CustomersCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                customerName: customerName,
                companyName: companyName,
                contactName: contactName,
                department: department,
                phone: phone,
                wechat: wechat,
                email: email,
                customerType: customerType,
                taxNo: taxNo,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CustomersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomersTable,
      Customer,
      $$CustomersTableFilterComposer,
      $$CustomersTableOrderingComposer,
      $$CustomersTableAnnotationComposer,
      $$CustomersTableCreateCompanionBuilder,
      $$CustomersTableUpdateCompanionBuilder,
      (Customer, BaseReferences<_$AppDatabase, $CustomersTable, Customer>),
      Customer,
      PrefetchHooks Function()
    >;
typedef $$CustomerAddressesTableCreateCompanionBuilder =
    CustomerAddressesCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String customerUuid,
      Value<String?> recipientName,
      Value<String?> phone,
      Value<String?> province,
      Value<String?> city,
      Value<String?> district,
      Value<String?> detailAddress,
      Value<String?> recipientCompany,
      Value<String?> fullAddress,
      Value<bool> isDefault,
    });
typedef $$CustomerAddressesTableUpdateCompanionBuilder =
    CustomerAddressesCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> customerUuid,
      Value<String?> recipientName,
      Value<String?> phone,
      Value<String?> province,
      Value<String?> city,
      Value<String?> district,
      Value<String?> detailAddress,
      Value<String?> recipientCompany,
      Value<String?> fullAddress,
      Value<bool> isDefault,
    });

class $$CustomerAddressesTableFilterComposer
    extends Composer<_$AppDatabase, $CustomerAddressesTable> {
  $$CustomerAddressesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerUuid => $composableBuilder(
    column: $table.customerUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recipientName => $composableBuilder(
    column: $table.recipientName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get province => $composableBuilder(
    column: $table.province,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get district => $composableBuilder(
    column: $table.district,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detailAddress => $composableBuilder(
    column: $table.detailAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recipientCompany => $composableBuilder(
    column: $table.recipientCompany,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullAddress => $composableBuilder(
    column: $table.fullAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CustomerAddressesTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomerAddressesTable> {
  $$CustomerAddressesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerUuid => $composableBuilder(
    column: $table.customerUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recipientName => $composableBuilder(
    column: $table.recipientName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get province => $composableBuilder(
    column: $table.province,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get district => $composableBuilder(
    column: $table.district,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detailAddress => $composableBuilder(
    column: $table.detailAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recipientCompany => $composableBuilder(
    column: $table.recipientCompany,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullAddress => $composableBuilder(
    column: $table.fullAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDefault => $composableBuilder(
    column: $table.isDefault,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomerAddressesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomerAddressesTable> {
  $$CustomerAddressesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get customerUuid => $composableBuilder(
    column: $table.customerUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recipientName => $composableBuilder(
    column: $table.recipientName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get province =>
      $composableBuilder(column: $table.province, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get district =>
      $composableBuilder(column: $table.district, builder: (column) => column);

  GeneratedColumn<String> get detailAddress => $composableBuilder(
    column: $table.detailAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recipientCompany => $composableBuilder(
    column: $table.recipientCompany,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fullAddress => $composableBuilder(
    column: $table.fullAddress,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);
}

class $$CustomerAddressesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomerAddressesTable,
          CustomerAddressesData,
          $$CustomerAddressesTableFilterComposer,
          $$CustomerAddressesTableOrderingComposer,
          $$CustomerAddressesTableAnnotationComposer,
          $$CustomerAddressesTableCreateCompanionBuilder,
          $$CustomerAddressesTableUpdateCompanionBuilder,
          (
            CustomerAddressesData,
            BaseReferences<
              _$AppDatabase,
              $CustomerAddressesTable,
              CustomerAddressesData
            >,
          ),
          CustomerAddressesData,
          PrefetchHooks Function()
        > {
  $$CustomerAddressesTableTableManager(
    _$AppDatabase db,
    $CustomerAddressesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomerAddressesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomerAddressesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomerAddressesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> customerUuid = const Value.absent(),
                Value<String?> recipientName = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> province = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> district = const Value.absent(),
                Value<String?> detailAddress = const Value.absent(),
                Value<String?> recipientCompany = const Value.absent(),
                Value<String?> fullAddress = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
              }) => CustomerAddressesCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                customerUuid: customerUuid,
                recipientName: recipientName,
                phone: phone,
                province: province,
                city: city,
                district: district,
                detailAddress: detailAddress,
                recipientCompany: recipientCompany,
                fullAddress: fullAddress,
                isDefault: isDefault,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String customerUuid,
                Value<String?> recipientName = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> province = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> district = const Value.absent(),
                Value<String?> detailAddress = const Value.absent(),
                Value<String?> recipientCompany = const Value.absent(),
                Value<String?> fullAddress = const Value.absent(),
                Value<bool> isDefault = const Value.absent(),
              }) => CustomerAddressesCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                customerUuid: customerUuid,
                recipientName: recipientName,
                phone: phone,
                province: province,
                city: city,
                district: district,
                detailAddress: detailAddress,
                recipientCompany: recipientCompany,
                fullAddress: fullAddress,
                isDefault: isDefault,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CustomerAddressesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomerAddressesTable,
      CustomerAddressesData,
      $$CustomerAddressesTableFilterComposer,
      $$CustomerAddressesTableOrderingComposer,
      $$CustomerAddressesTableAnnotationComposer,
      $$CustomerAddressesTableCreateCompanionBuilder,
      $$CustomerAddressesTableUpdateCompanionBuilder,
      (
        CustomerAddressesData,
        BaseReferences<
          _$AppDatabase,
          $CustomerAddressesTable,
          CustomerAddressesData
        >,
      ),
      CustomerAddressesData,
      PrefetchHooks Function()
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String productName,
      Value<String?> productCode,
      Value<String> productType,
      Value<String?> specification,
      Value<String?> quantityUnit,
      Value<String?> materialCategory,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> productName,
      Value<String?> productCode,
      Value<String> productType,
      Value<String?> specification,
      Value<String?> quantityUnit,
      Value<String?> materialCategory,
    });

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productCode => $composableBuilder(
    column: $table.productCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productType => $composableBuilder(
    column: $table.productType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get materialCategory => $composableBuilder(
    column: $table.materialCategory,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productCode => $composableBuilder(
    column: $table.productCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productType => $composableBuilder(
    column: $table.productType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get materialCategory => $composableBuilder(
    column: $table.materialCategory,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productCode => $composableBuilder(
    column: $table.productCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productType => $composableBuilder(
    column: $table.productType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specification => $composableBuilder(
    column: $table.specification,
    builder: (column) => column,
  );

  GeneratedColumn<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => column,
  );

  GeneratedColumn<String> get materialCategory => $composableBuilder(
    column: $table.materialCategory,
    builder: (column) => column,
  );
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
          Product,
          PrefetchHooks Function()
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> productName = const Value.absent(),
                Value<String?> productCode = const Value.absent(),
                Value<String> productType = const Value.absent(),
                Value<String?> specification = const Value.absent(),
                Value<String?> quantityUnit = const Value.absent(),
                Value<String?> materialCategory = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                productName: productName,
                productCode: productCode,
                productType: productType,
                specification: specification,
                quantityUnit: quantityUnit,
                materialCategory: materialCategory,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String productName,
                Value<String?> productCode = const Value.absent(),
                Value<String> productType = const Value.absent(),
                Value<String?> specification = const Value.absent(),
                Value<String?> quantityUnit = const Value.absent(),
                Value<String?> materialCategory = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                productName: productName,
                productCode: productCode,
                productType: productType,
                specification: specification,
                quantityUnit: quantityUnit,
                materialCategory: materialCategory,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
      Product,
      PrefetchHooks Function()
    >;
typedef $$ProductElementsTableCreateCompanionBuilder =
    ProductElementsCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String productUuid,
      Value<String?> elementSymbol,
      Value<String?> elementName,
      Value<String?> ratioText,
      Value<int> sortOrder,
    });
typedef $$ProductElementsTableUpdateCompanionBuilder =
    ProductElementsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> productUuid,
      Value<String?> elementSymbol,
      Value<String?> elementName,
      Value<String?> ratioText,
      Value<int> sortOrder,
    });

class $$ProductElementsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductElementsTable> {
  $$ProductElementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get elementSymbol => $composableBuilder(
    column: $table.elementSymbol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get elementName => $composableBuilder(
    column: $table.elementName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ratioText => $composableBuilder(
    column: $table.ratioText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductElementsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductElementsTable> {
  $$ProductElementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get elementSymbol => $composableBuilder(
    column: $table.elementSymbol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get elementName => $composableBuilder(
    column: $table.elementName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ratioText => $composableBuilder(
    column: $table.ratioText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductElementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductElementsTable> {
  $$ProductElementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get elementSymbol => $composableBuilder(
    column: $table.elementSymbol,
    builder: (column) => column,
  );

  GeneratedColumn<String> get elementName => $composableBuilder(
    column: $table.elementName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ratioText =>
      $composableBuilder(column: $table.ratioText, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$ProductElementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductElementsTable,
          ProductElement,
          $$ProductElementsTableFilterComposer,
          $$ProductElementsTableOrderingComposer,
          $$ProductElementsTableAnnotationComposer,
          $$ProductElementsTableCreateCompanionBuilder,
          $$ProductElementsTableUpdateCompanionBuilder,
          (
            ProductElement,
            BaseReferences<
              _$AppDatabase,
              $ProductElementsTable,
              ProductElement
            >,
          ),
          ProductElement,
          PrefetchHooks Function()
        > {
  $$ProductElementsTableTableManager(
    _$AppDatabase db,
    $ProductElementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductElementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductElementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductElementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> productUuid = const Value.absent(),
                Value<String?> elementSymbol = const Value.absent(),
                Value<String?> elementName = const Value.absent(),
                Value<String?> ratioText = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => ProductElementsCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                productUuid: productUuid,
                elementSymbol: elementSymbol,
                elementName: elementName,
                ratioText: ratioText,
                sortOrder: sortOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String productUuid,
                Value<String?> elementSymbol = const Value.absent(),
                Value<String?> elementName = const Value.absent(),
                Value<String?> ratioText = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => ProductElementsCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                productUuid: productUuid,
                elementSymbol: elementSymbol,
                elementName: elementName,
                ratioText: ratioText,
                sortOrder: sortOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductElementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductElementsTable,
      ProductElement,
      $$ProductElementsTableFilterComposer,
      $$ProductElementsTableOrderingComposer,
      $$ProductElementsTableAnnotationComposer,
      $$ProductElementsTableCreateCompanionBuilder,
      $$ProductElementsTableUpdateCompanionBuilder,
      (
        ProductElement,
        BaseReferences<_$AppDatabase, $ProductElementsTable, ProductElement>,
      ),
      ProductElement,
      PrefetchHooks Function()
    >;
typedef $$SuppliersTableCreateCompanionBuilder =
    SuppliersCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String supplierName,
      Value<String> supplierType,
      Value<String?> contactName,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> address,
    });
typedef $$SuppliersTableUpdateCompanionBuilder =
    SuppliersCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> supplierName,
      Value<String> supplierType,
      Value<String?> contactName,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> address,
    });

class $$SuppliersTableFilterComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supplierName => $composableBuilder(
    column: $table.supplierName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supplierType => $composableBuilder(
    column: $table.supplierType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactName => $composableBuilder(
    column: $table.contactName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SuppliersTableOrderingComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supplierName => $composableBuilder(
    column: $table.supplierName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supplierType => $composableBuilder(
    column: $table.supplierType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactName => $composableBuilder(
    column: $table.contactName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SuppliersTableAnnotationComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get supplierName => $composableBuilder(
    column: $table.supplierName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get supplierType => $composableBuilder(
    column: $table.supplierType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contactName => $composableBuilder(
    column: $table.contactName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);
}

class $$SuppliersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SuppliersTable,
          Supplier,
          $$SuppliersTableFilterComposer,
          $$SuppliersTableOrderingComposer,
          $$SuppliersTableAnnotationComposer,
          $$SuppliersTableCreateCompanionBuilder,
          $$SuppliersTableUpdateCompanionBuilder,
          (Supplier, BaseReferences<_$AppDatabase, $SuppliersTable, Supplier>),
          Supplier,
          PrefetchHooks Function()
        > {
  $$SuppliersTableTableManager(_$AppDatabase db, $SuppliersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SuppliersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SuppliersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SuppliersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> supplierName = const Value.absent(),
                Value<String> supplierType = const Value.absent(),
                Value<String?> contactName = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> address = const Value.absent(),
              }) => SuppliersCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                supplierName: supplierName,
                supplierType: supplierType,
                contactName: contactName,
                phone: phone,
                email: email,
                address: address,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String supplierName,
                Value<String> supplierType = const Value.absent(),
                Value<String?> contactName = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> address = const Value.absent(),
              }) => SuppliersCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                supplierName: supplierName,
                supplierType: supplierType,
                contactName: contactName,
                phone: phone,
                email: email,
                address: address,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SuppliersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SuppliersTable,
      Supplier,
      $$SuppliersTableFilterComposer,
      $$SuppliersTableOrderingComposer,
      $$SuppliersTableAnnotationComposer,
      $$SuppliersTableCreateCompanionBuilder,
      $$SuppliersTableUpdateCompanionBuilder,
      (Supplier, BaseReferences<_$AppDatabase, $SuppliersTable, Supplier>),
      Supplier,
      PrefetchHooks Function()
    >;
typedef $$SalesOrdersTableCreateCompanionBuilder =
    SalesOrdersCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String orderNo,
      Value<String?> customerUuid,
      Value<DateTime?> orderDate,
      Value<String> orderStatus,
      Value<String> paymentStatus,
      Value<String> invoiceStatus,
      Value<int> totalSaleAmount,
      Value<int> totalCostAmount,
      Value<int> totalProfitAmount,
    });
typedef $$SalesOrdersTableUpdateCompanionBuilder =
    SalesOrdersCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> orderNo,
      Value<String?> customerUuid,
      Value<DateTime?> orderDate,
      Value<String> orderStatus,
      Value<String> paymentStatus,
      Value<String> invoiceStatus,
      Value<int> totalSaleAmount,
      Value<int> totalCostAmount,
      Value<int> totalProfitAmount,
    });

class $$SalesOrdersTableFilterComposer
    extends Composer<_$AppDatabase, $SalesOrdersTable> {
  $$SalesOrdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderNo => $composableBuilder(
    column: $table.orderNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerUuid => $composableBuilder(
    column: $table.customerUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get orderDate => $composableBuilder(
    column: $table.orderDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderStatus => $composableBuilder(
    column: $table.orderStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceStatus => $composableBuilder(
    column: $table.invoiceStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSaleAmount => $composableBuilder(
    column: $table.totalSaleAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalCostAmount => $composableBuilder(
    column: $table.totalCostAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalProfitAmount => $composableBuilder(
    column: $table.totalProfitAmount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SalesOrdersTableOrderingComposer
    extends Composer<_$AppDatabase, $SalesOrdersTable> {
  $$SalesOrdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderNo => $composableBuilder(
    column: $table.orderNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerUuid => $composableBuilder(
    column: $table.customerUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get orderDate => $composableBuilder(
    column: $table.orderDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderStatus => $composableBuilder(
    column: $table.orderStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceStatus => $composableBuilder(
    column: $table.invoiceStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSaleAmount => $composableBuilder(
    column: $table.totalSaleAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalCostAmount => $composableBuilder(
    column: $table.totalCostAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalProfitAmount => $composableBuilder(
    column: $table.totalProfitAmount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SalesOrdersTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalesOrdersTable> {
  $$SalesOrdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get orderNo =>
      $composableBuilder(column: $table.orderNo, builder: (column) => column);

  GeneratedColumn<String> get customerUuid => $composableBuilder(
    column: $table.customerUuid,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get orderDate =>
      $composableBuilder(column: $table.orderDate, builder: (column) => column);

  GeneratedColumn<String> get orderStatus => $composableBuilder(
    column: $table.orderStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get invoiceStatus => $composableBuilder(
    column: $table.invoiceStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalSaleAmount => $composableBuilder(
    column: $table.totalSaleAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalCostAmount => $composableBuilder(
    column: $table.totalCostAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalProfitAmount => $composableBuilder(
    column: $table.totalProfitAmount,
    builder: (column) => column,
  );
}

class $$SalesOrdersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SalesOrdersTable,
          SalesOrder,
          $$SalesOrdersTableFilterComposer,
          $$SalesOrdersTableOrderingComposer,
          $$SalesOrdersTableAnnotationComposer,
          $$SalesOrdersTableCreateCompanionBuilder,
          $$SalesOrdersTableUpdateCompanionBuilder,
          (
            SalesOrder,
            BaseReferences<_$AppDatabase, $SalesOrdersTable, SalesOrder>,
          ),
          SalesOrder,
          PrefetchHooks Function()
        > {
  $$SalesOrdersTableTableManager(_$AppDatabase db, $SalesOrdersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesOrdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesOrdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesOrdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> orderNo = const Value.absent(),
                Value<String?> customerUuid = const Value.absent(),
                Value<DateTime?> orderDate = const Value.absent(),
                Value<String> orderStatus = const Value.absent(),
                Value<String> paymentStatus = const Value.absent(),
                Value<String> invoiceStatus = const Value.absent(),
                Value<int> totalSaleAmount = const Value.absent(),
                Value<int> totalCostAmount = const Value.absent(),
                Value<int> totalProfitAmount = const Value.absent(),
              }) => SalesOrdersCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                orderNo: orderNo,
                customerUuid: customerUuid,
                orderDate: orderDate,
                orderStatus: orderStatus,
                paymentStatus: paymentStatus,
                invoiceStatus: invoiceStatus,
                totalSaleAmount: totalSaleAmount,
                totalCostAmount: totalCostAmount,
                totalProfitAmount: totalProfitAmount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String orderNo,
                Value<String?> customerUuid = const Value.absent(),
                Value<DateTime?> orderDate = const Value.absent(),
                Value<String> orderStatus = const Value.absent(),
                Value<String> paymentStatus = const Value.absent(),
                Value<String> invoiceStatus = const Value.absent(),
                Value<int> totalSaleAmount = const Value.absent(),
                Value<int> totalCostAmount = const Value.absent(),
                Value<int> totalProfitAmount = const Value.absent(),
              }) => SalesOrdersCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                orderNo: orderNo,
                customerUuid: customerUuid,
                orderDate: orderDate,
                orderStatus: orderStatus,
                paymentStatus: paymentStatus,
                invoiceStatus: invoiceStatus,
                totalSaleAmount: totalSaleAmount,
                totalCostAmount: totalCostAmount,
                totalProfitAmount: totalProfitAmount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SalesOrdersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SalesOrdersTable,
      SalesOrder,
      $$SalesOrdersTableFilterComposer,
      $$SalesOrdersTableOrderingComposer,
      $$SalesOrdersTableAnnotationComposer,
      $$SalesOrdersTableCreateCompanionBuilder,
      $$SalesOrdersTableUpdateCompanionBuilder,
      (
        SalesOrder,
        BaseReferences<_$AppDatabase, $SalesOrdersTable, SalesOrder>,
      ),
      SalesOrder,
      PrefetchHooks Function()
    >;
typedef $$SalesOrderItemsTableCreateCompanionBuilder =
    SalesOrderItemsCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String orderUuid,
      Value<String?> productUuid,
      required String productNameSnapshot,
      Value<String?> productCodeSnapshot,
      Value<String?> specificationSnapshot,
      Value<double?> quantityValue,
      Value<String?> quantityUnit,
      Value<int> saleAmount,
      Value<int> costAmount,
      Value<String> itemStatus,
      Value<String?> supplierUuid,
    });
typedef $$SalesOrderItemsTableUpdateCompanionBuilder =
    SalesOrderItemsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> orderUuid,
      Value<String?> productUuid,
      Value<String> productNameSnapshot,
      Value<String?> productCodeSnapshot,
      Value<String?> specificationSnapshot,
      Value<double?> quantityValue,
      Value<String?> quantityUnit,
      Value<int> saleAmount,
      Value<int> costAmount,
      Value<String> itemStatus,
      Value<String?> supplierUuid,
    });

class $$SalesOrderItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SalesOrderItemsTable> {
  $$SalesOrderItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderUuid => $composableBuilder(
    column: $table.orderUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productNameSnapshot => $composableBuilder(
    column: $table.productNameSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productCodeSnapshot => $composableBuilder(
    column: $table.productCodeSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specificationSnapshot => $composableBuilder(
    column: $table.specificationSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantityValue => $composableBuilder(
    column: $table.quantityValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get saleAmount => $composableBuilder(
    column: $table.saleAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get costAmount => $composableBuilder(
    column: $table.costAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemStatus => $composableBuilder(
    column: $table.itemStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supplierUuid => $composableBuilder(
    column: $table.supplierUuid,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SalesOrderItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SalesOrderItemsTable> {
  $$SalesOrderItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderUuid => $composableBuilder(
    column: $table.orderUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productNameSnapshot => $composableBuilder(
    column: $table.productNameSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productCodeSnapshot => $composableBuilder(
    column: $table.productCodeSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specificationSnapshot => $composableBuilder(
    column: $table.specificationSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantityValue => $composableBuilder(
    column: $table.quantityValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get saleAmount => $composableBuilder(
    column: $table.saleAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get costAmount => $composableBuilder(
    column: $table.costAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemStatus => $composableBuilder(
    column: $table.itemStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supplierUuid => $composableBuilder(
    column: $table.supplierUuid,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SalesOrderItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalesOrderItemsTable> {
  $$SalesOrderItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get orderUuid =>
      $composableBuilder(column: $table.orderUuid, builder: (column) => column);

  GeneratedColumn<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productNameSnapshot => $composableBuilder(
    column: $table.productNameSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productCodeSnapshot => $composableBuilder(
    column: $table.productCodeSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specificationSnapshot => $composableBuilder(
    column: $table.specificationSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantityValue => $composableBuilder(
    column: $table.quantityValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => column,
  );

  GeneratedColumn<int> get saleAmount => $composableBuilder(
    column: $table.saleAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get costAmount => $composableBuilder(
    column: $table.costAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get itemStatus => $composableBuilder(
    column: $table.itemStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get supplierUuid => $composableBuilder(
    column: $table.supplierUuid,
    builder: (column) => column,
  );
}

class $$SalesOrderItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SalesOrderItemsTable,
          SalesOrderItem,
          $$SalesOrderItemsTableFilterComposer,
          $$SalesOrderItemsTableOrderingComposer,
          $$SalesOrderItemsTableAnnotationComposer,
          $$SalesOrderItemsTableCreateCompanionBuilder,
          $$SalesOrderItemsTableUpdateCompanionBuilder,
          (
            SalesOrderItem,
            BaseReferences<
              _$AppDatabase,
              $SalesOrderItemsTable,
              SalesOrderItem
            >,
          ),
          SalesOrderItem,
          PrefetchHooks Function()
        > {
  $$SalesOrderItemsTableTableManager(
    _$AppDatabase db,
    $SalesOrderItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesOrderItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesOrderItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesOrderItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> orderUuid = const Value.absent(),
                Value<String?> productUuid = const Value.absent(),
                Value<String> productNameSnapshot = const Value.absent(),
                Value<String?> productCodeSnapshot = const Value.absent(),
                Value<String?> specificationSnapshot = const Value.absent(),
                Value<double?> quantityValue = const Value.absent(),
                Value<String?> quantityUnit = const Value.absent(),
                Value<int> saleAmount = const Value.absent(),
                Value<int> costAmount = const Value.absent(),
                Value<String> itemStatus = const Value.absent(),
                Value<String?> supplierUuid = const Value.absent(),
              }) => SalesOrderItemsCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                orderUuid: orderUuid,
                productUuid: productUuid,
                productNameSnapshot: productNameSnapshot,
                productCodeSnapshot: productCodeSnapshot,
                specificationSnapshot: specificationSnapshot,
                quantityValue: quantityValue,
                quantityUnit: quantityUnit,
                saleAmount: saleAmount,
                costAmount: costAmount,
                itemStatus: itemStatus,
                supplierUuid: supplierUuid,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String orderUuid,
                Value<String?> productUuid = const Value.absent(),
                required String productNameSnapshot,
                Value<String?> productCodeSnapshot = const Value.absent(),
                Value<String?> specificationSnapshot = const Value.absent(),
                Value<double?> quantityValue = const Value.absent(),
                Value<String?> quantityUnit = const Value.absent(),
                Value<int> saleAmount = const Value.absent(),
                Value<int> costAmount = const Value.absent(),
                Value<String> itemStatus = const Value.absent(),
                Value<String?> supplierUuid = const Value.absent(),
              }) => SalesOrderItemsCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                orderUuid: orderUuid,
                productUuid: productUuid,
                productNameSnapshot: productNameSnapshot,
                productCodeSnapshot: productCodeSnapshot,
                specificationSnapshot: specificationSnapshot,
                quantityValue: quantityValue,
                quantityUnit: quantityUnit,
                saleAmount: saleAmount,
                costAmount: costAmount,
                itemStatus: itemStatus,
                supplierUuid: supplierUuid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SalesOrderItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SalesOrderItemsTable,
      SalesOrderItem,
      $$SalesOrderItemsTableFilterComposer,
      $$SalesOrderItemsTableOrderingComposer,
      $$SalesOrderItemsTableAnnotationComposer,
      $$SalesOrderItemsTableCreateCompanionBuilder,
      $$SalesOrderItemsTableUpdateCompanionBuilder,
      (
        SalesOrderItem,
        BaseReferences<_$AppDatabase, $SalesOrderItemsTable, SalesOrderItem>,
      ),
      SalesOrderItem,
      PrefetchHooks Function()
    >;
typedef $$PurchaseOrdersTableCreateCompanionBuilder =
    PurchaseOrdersCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String purchaseNo,
      Value<String?> supplierUuid,
      Value<String?> relatedOrderUuid,
      Value<String> purchaseType,
      Value<String> purchaseStatus,
      Value<DateTime?> orderDate,
      Value<int> totalAmount,
    });
typedef $$PurchaseOrdersTableUpdateCompanionBuilder =
    PurchaseOrdersCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> purchaseNo,
      Value<String?> supplierUuid,
      Value<String?> relatedOrderUuid,
      Value<String> purchaseType,
      Value<String> purchaseStatus,
      Value<DateTime?> orderDate,
      Value<int> totalAmount,
    });

class $$PurchaseOrdersTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseOrdersTable> {
  $$PurchaseOrdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purchaseNo => $composableBuilder(
    column: $table.purchaseNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supplierUuid => $composableBuilder(
    column: $table.supplierUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedOrderUuid => $composableBuilder(
    column: $table.relatedOrderUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purchaseType => $composableBuilder(
    column: $table.purchaseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purchaseStatus => $composableBuilder(
    column: $table.purchaseStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get orderDate => $composableBuilder(
    column: $table.orderDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PurchaseOrdersTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseOrdersTable> {
  $$PurchaseOrdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purchaseNo => $composableBuilder(
    column: $table.purchaseNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supplierUuid => $composableBuilder(
    column: $table.supplierUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedOrderUuid => $composableBuilder(
    column: $table.relatedOrderUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purchaseType => $composableBuilder(
    column: $table.purchaseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purchaseStatus => $composableBuilder(
    column: $table.purchaseStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get orderDate => $composableBuilder(
    column: $table.orderDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PurchaseOrdersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseOrdersTable> {
  $$PurchaseOrdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get purchaseNo => $composableBuilder(
    column: $table.purchaseNo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get supplierUuid => $composableBuilder(
    column: $table.supplierUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get relatedOrderUuid => $composableBuilder(
    column: $table.relatedOrderUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get purchaseType => $composableBuilder(
    column: $table.purchaseType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get purchaseStatus => $composableBuilder(
    column: $table.purchaseStatus,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get orderDate =>
      $composableBuilder(column: $table.orderDate, builder: (column) => column);

  GeneratedColumn<int> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );
}

class $$PurchaseOrdersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PurchaseOrdersTable,
          PurchaseOrder,
          $$PurchaseOrdersTableFilterComposer,
          $$PurchaseOrdersTableOrderingComposer,
          $$PurchaseOrdersTableAnnotationComposer,
          $$PurchaseOrdersTableCreateCompanionBuilder,
          $$PurchaseOrdersTableUpdateCompanionBuilder,
          (
            PurchaseOrder,
            BaseReferences<_$AppDatabase, $PurchaseOrdersTable, PurchaseOrder>,
          ),
          PurchaseOrder,
          PrefetchHooks Function()
        > {
  $$PurchaseOrdersTableTableManager(
    _$AppDatabase db,
    $PurchaseOrdersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseOrdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseOrdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseOrdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> purchaseNo = const Value.absent(),
                Value<String?> supplierUuid = const Value.absent(),
                Value<String?> relatedOrderUuid = const Value.absent(),
                Value<String> purchaseType = const Value.absent(),
                Value<String> purchaseStatus = const Value.absent(),
                Value<DateTime?> orderDate = const Value.absent(),
                Value<int> totalAmount = const Value.absent(),
              }) => PurchaseOrdersCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                purchaseNo: purchaseNo,
                supplierUuid: supplierUuid,
                relatedOrderUuid: relatedOrderUuid,
                purchaseType: purchaseType,
                purchaseStatus: purchaseStatus,
                orderDate: orderDate,
                totalAmount: totalAmount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String purchaseNo,
                Value<String?> supplierUuid = const Value.absent(),
                Value<String?> relatedOrderUuid = const Value.absent(),
                Value<String> purchaseType = const Value.absent(),
                Value<String> purchaseStatus = const Value.absent(),
                Value<DateTime?> orderDate = const Value.absent(),
                Value<int> totalAmount = const Value.absent(),
              }) => PurchaseOrdersCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                purchaseNo: purchaseNo,
                supplierUuid: supplierUuid,
                relatedOrderUuid: relatedOrderUuid,
                purchaseType: purchaseType,
                purchaseStatus: purchaseStatus,
                orderDate: orderDate,
                totalAmount: totalAmount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PurchaseOrdersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PurchaseOrdersTable,
      PurchaseOrder,
      $$PurchaseOrdersTableFilterComposer,
      $$PurchaseOrdersTableOrderingComposer,
      $$PurchaseOrdersTableAnnotationComposer,
      $$PurchaseOrdersTableCreateCompanionBuilder,
      $$PurchaseOrdersTableUpdateCompanionBuilder,
      (
        PurchaseOrder,
        BaseReferences<_$AppDatabase, $PurchaseOrdersTable, PurchaseOrder>,
      ),
      PurchaseOrder,
      PrefetchHooks Function()
    >;
typedef $$PurchaseOrderItemsTableCreateCompanionBuilder =
    PurchaseOrderItemsCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String purchaseOrderUuid,
      Value<String?> salesOrderItemUuid,
      Value<String?> productUuid,
      required String productNameSnapshot,
      Value<String?> productCodeSnapshot,
      Value<String?> specificationSnapshot,
      Value<double?> quantityValue,
      Value<String?> quantityUnit,
      Value<int> unitCostAmount,
      Value<int> totalCostAmount,
      Value<String> itemStatus,
    });
typedef $$PurchaseOrderItemsTableUpdateCompanionBuilder =
    PurchaseOrderItemsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> purchaseOrderUuid,
      Value<String?> salesOrderItemUuid,
      Value<String?> productUuid,
      Value<String> productNameSnapshot,
      Value<String?> productCodeSnapshot,
      Value<String?> specificationSnapshot,
      Value<double?> quantityValue,
      Value<String?> quantityUnit,
      Value<int> unitCostAmount,
      Value<int> totalCostAmount,
      Value<String> itemStatus,
    });

class $$PurchaseOrderItemsTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseOrderItemsTable> {
  $$PurchaseOrderItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purchaseOrderUuid => $composableBuilder(
    column: $table.purchaseOrderUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get salesOrderItemUuid => $composableBuilder(
    column: $table.salesOrderItemUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productNameSnapshot => $composableBuilder(
    column: $table.productNameSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productCodeSnapshot => $composableBuilder(
    column: $table.productCodeSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specificationSnapshot => $composableBuilder(
    column: $table.specificationSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantityValue => $composableBuilder(
    column: $table.quantityValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitCostAmount => $composableBuilder(
    column: $table.unitCostAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalCostAmount => $composableBuilder(
    column: $table.totalCostAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemStatus => $composableBuilder(
    column: $table.itemStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PurchaseOrderItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseOrderItemsTable> {
  $$PurchaseOrderItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purchaseOrderUuid => $composableBuilder(
    column: $table.purchaseOrderUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get salesOrderItemUuid => $composableBuilder(
    column: $table.salesOrderItemUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productNameSnapshot => $composableBuilder(
    column: $table.productNameSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productCodeSnapshot => $composableBuilder(
    column: $table.productCodeSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specificationSnapshot => $composableBuilder(
    column: $table.specificationSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantityValue => $composableBuilder(
    column: $table.quantityValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitCostAmount => $composableBuilder(
    column: $table.unitCostAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalCostAmount => $composableBuilder(
    column: $table.totalCostAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemStatus => $composableBuilder(
    column: $table.itemStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PurchaseOrderItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseOrderItemsTable> {
  $$PurchaseOrderItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get purchaseOrderUuid => $composableBuilder(
    column: $table.purchaseOrderUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get salesOrderItemUuid => $composableBuilder(
    column: $table.salesOrderItemUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productNameSnapshot => $composableBuilder(
    column: $table.productNameSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productCodeSnapshot => $composableBuilder(
    column: $table.productCodeSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specificationSnapshot => $composableBuilder(
    column: $table.specificationSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantityValue => $composableBuilder(
    column: $table.quantityValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => column,
  );

  GeneratedColumn<int> get unitCostAmount => $composableBuilder(
    column: $table.unitCostAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalCostAmount => $composableBuilder(
    column: $table.totalCostAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get itemStatus => $composableBuilder(
    column: $table.itemStatus,
    builder: (column) => column,
  );
}

class $$PurchaseOrderItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PurchaseOrderItemsTable,
          PurchaseOrderItem,
          $$PurchaseOrderItemsTableFilterComposer,
          $$PurchaseOrderItemsTableOrderingComposer,
          $$PurchaseOrderItemsTableAnnotationComposer,
          $$PurchaseOrderItemsTableCreateCompanionBuilder,
          $$PurchaseOrderItemsTableUpdateCompanionBuilder,
          (
            PurchaseOrderItem,
            BaseReferences<
              _$AppDatabase,
              $PurchaseOrderItemsTable,
              PurchaseOrderItem
            >,
          ),
          PurchaseOrderItem,
          PrefetchHooks Function()
        > {
  $$PurchaseOrderItemsTableTableManager(
    _$AppDatabase db,
    $PurchaseOrderItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseOrderItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseOrderItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseOrderItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> purchaseOrderUuid = const Value.absent(),
                Value<String?> salesOrderItemUuid = const Value.absent(),
                Value<String?> productUuid = const Value.absent(),
                Value<String> productNameSnapshot = const Value.absent(),
                Value<String?> productCodeSnapshot = const Value.absent(),
                Value<String?> specificationSnapshot = const Value.absent(),
                Value<double?> quantityValue = const Value.absent(),
                Value<String?> quantityUnit = const Value.absent(),
                Value<int> unitCostAmount = const Value.absent(),
                Value<int> totalCostAmount = const Value.absent(),
                Value<String> itemStatus = const Value.absent(),
              }) => PurchaseOrderItemsCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                purchaseOrderUuid: purchaseOrderUuid,
                salesOrderItemUuid: salesOrderItemUuid,
                productUuid: productUuid,
                productNameSnapshot: productNameSnapshot,
                productCodeSnapshot: productCodeSnapshot,
                specificationSnapshot: specificationSnapshot,
                quantityValue: quantityValue,
                quantityUnit: quantityUnit,
                unitCostAmount: unitCostAmount,
                totalCostAmount: totalCostAmount,
                itemStatus: itemStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String purchaseOrderUuid,
                Value<String?> salesOrderItemUuid = const Value.absent(),
                Value<String?> productUuid = const Value.absent(),
                required String productNameSnapshot,
                Value<String?> productCodeSnapshot = const Value.absent(),
                Value<String?> specificationSnapshot = const Value.absent(),
                Value<double?> quantityValue = const Value.absent(),
                Value<String?> quantityUnit = const Value.absent(),
                Value<int> unitCostAmount = const Value.absent(),
                Value<int> totalCostAmount = const Value.absent(),
                Value<String> itemStatus = const Value.absent(),
              }) => PurchaseOrderItemsCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                purchaseOrderUuid: purchaseOrderUuid,
                salesOrderItemUuid: salesOrderItemUuid,
                productUuid: productUuid,
                productNameSnapshot: productNameSnapshot,
                productCodeSnapshot: productCodeSnapshot,
                specificationSnapshot: specificationSnapshot,
                quantityValue: quantityValue,
                quantityUnit: quantityUnit,
                unitCostAmount: unitCostAmount,
                totalCostAmount: totalCostAmount,
                itemStatus: itemStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PurchaseOrderItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PurchaseOrderItemsTable,
      PurchaseOrderItem,
      $$PurchaseOrderItemsTableFilterComposer,
      $$PurchaseOrderItemsTableOrderingComposer,
      $$PurchaseOrderItemsTableAnnotationComposer,
      $$PurchaseOrderItemsTableCreateCompanionBuilder,
      $$PurchaseOrderItemsTableUpdateCompanionBuilder,
      (
        PurchaseOrderItem,
        BaseReferences<
          _$AppDatabase,
          $PurchaseOrderItemsTable,
          PurchaseOrderItem
        >,
      ),
      PurchaseOrderItem,
      PrefetchHooks Function()
    >;
typedef $$ShipmentsTableCreateCompanionBuilder =
    ShipmentsCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String shipmentNo,
      Value<String?> orderUuid,
      Value<String?> customerUuid,
      Value<String?> addressUuid,
      Value<String?> carrier,
      Value<String?> trackingNo,
      Value<DateTime?> shipDate,
      Value<int> shippingFee,
      Value<String> shipmentStatus,
    });
typedef $$ShipmentsTableUpdateCompanionBuilder =
    ShipmentsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> shipmentNo,
      Value<String?> orderUuid,
      Value<String?> customerUuid,
      Value<String?> addressUuid,
      Value<String?> carrier,
      Value<String?> trackingNo,
      Value<DateTime?> shipDate,
      Value<int> shippingFee,
      Value<String> shipmentStatus,
    });

class $$ShipmentsTableFilterComposer
    extends Composer<_$AppDatabase, $ShipmentsTable> {
  $$ShipmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shipmentNo => $composableBuilder(
    column: $table.shipmentNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderUuid => $composableBuilder(
    column: $table.orderUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerUuid => $composableBuilder(
    column: $table.customerUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressUuid => $composableBuilder(
    column: $table.addressUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get carrier => $composableBuilder(
    column: $table.carrier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trackingNo => $composableBuilder(
    column: $table.trackingNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get shipDate => $composableBuilder(
    column: $table.shipDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get shippingFee => $composableBuilder(
    column: $table.shippingFee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shipmentStatus => $composableBuilder(
    column: $table.shipmentStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ShipmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShipmentsTable> {
  $$ShipmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shipmentNo => $composableBuilder(
    column: $table.shipmentNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderUuid => $composableBuilder(
    column: $table.orderUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerUuid => $composableBuilder(
    column: $table.customerUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressUuid => $composableBuilder(
    column: $table.addressUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get carrier => $composableBuilder(
    column: $table.carrier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trackingNo => $composableBuilder(
    column: $table.trackingNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get shipDate => $composableBuilder(
    column: $table.shipDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get shippingFee => $composableBuilder(
    column: $table.shippingFee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shipmentStatus => $composableBuilder(
    column: $table.shipmentStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShipmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShipmentsTable> {
  $$ShipmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get shipmentNo => $composableBuilder(
    column: $table.shipmentNo,
    builder: (column) => column,
  );

  GeneratedColumn<String> get orderUuid =>
      $composableBuilder(column: $table.orderUuid, builder: (column) => column);

  GeneratedColumn<String> get customerUuid => $composableBuilder(
    column: $table.customerUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get addressUuid => $composableBuilder(
    column: $table.addressUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get carrier =>
      $composableBuilder(column: $table.carrier, builder: (column) => column);

  GeneratedColumn<String> get trackingNo => $composableBuilder(
    column: $table.trackingNo,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get shipDate =>
      $composableBuilder(column: $table.shipDate, builder: (column) => column);

  GeneratedColumn<int> get shippingFee => $composableBuilder(
    column: $table.shippingFee,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shipmentStatus => $composableBuilder(
    column: $table.shipmentStatus,
    builder: (column) => column,
  );
}

class $$ShipmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShipmentsTable,
          Shipment,
          $$ShipmentsTableFilterComposer,
          $$ShipmentsTableOrderingComposer,
          $$ShipmentsTableAnnotationComposer,
          $$ShipmentsTableCreateCompanionBuilder,
          $$ShipmentsTableUpdateCompanionBuilder,
          (Shipment, BaseReferences<_$AppDatabase, $ShipmentsTable, Shipment>),
          Shipment,
          PrefetchHooks Function()
        > {
  $$ShipmentsTableTableManager(_$AppDatabase db, $ShipmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShipmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShipmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShipmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> shipmentNo = const Value.absent(),
                Value<String?> orderUuid = const Value.absent(),
                Value<String?> customerUuid = const Value.absent(),
                Value<String?> addressUuid = const Value.absent(),
                Value<String?> carrier = const Value.absent(),
                Value<String?> trackingNo = const Value.absent(),
                Value<DateTime?> shipDate = const Value.absent(),
                Value<int> shippingFee = const Value.absent(),
                Value<String> shipmentStatus = const Value.absent(),
              }) => ShipmentsCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                shipmentNo: shipmentNo,
                orderUuid: orderUuid,
                customerUuid: customerUuid,
                addressUuid: addressUuid,
                carrier: carrier,
                trackingNo: trackingNo,
                shipDate: shipDate,
                shippingFee: shippingFee,
                shipmentStatus: shipmentStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String shipmentNo,
                Value<String?> orderUuid = const Value.absent(),
                Value<String?> customerUuid = const Value.absent(),
                Value<String?> addressUuid = const Value.absent(),
                Value<String?> carrier = const Value.absent(),
                Value<String?> trackingNo = const Value.absent(),
                Value<DateTime?> shipDate = const Value.absent(),
                Value<int> shippingFee = const Value.absent(),
                Value<String> shipmentStatus = const Value.absent(),
              }) => ShipmentsCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                shipmentNo: shipmentNo,
                orderUuid: orderUuid,
                customerUuid: customerUuid,
                addressUuid: addressUuid,
                carrier: carrier,
                trackingNo: trackingNo,
                shipDate: shipDate,
                shippingFee: shippingFee,
                shipmentStatus: shipmentStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ShipmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShipmentsTable,
      Shipment,
      $$ShipmentsTableFilterComposer,
      $$ShipmentsTableOrderingComposer,
      $$ShipmentsTableAnnotationComposer,
      $$ShipmentsTableCreateCompanionBuilder,
      $$ShipmentsTableUpdateCompanionBuilder,
      (Shipment, BaseReferences<_$AppDatabase, $ShipmentsTable, Shipment>),
      Shipment,
      PrefetchHooks Function()
    >;
typedef $$ShipmentItemsTableCreateCompanionBuilder =
    ShipmentItemsCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String shipmentUuid,
      Value<String?> orderUuid,
      required String orderItemUuid,
      Value<String?> productUuid,
      Value<double?> quantityValue,
      Value<String?> quantityUnit,
      Value<String> itemStatus,
    });
typedef $$ShipmentItemsTableUpdateCompanionBuilder =
    ShipmentItemsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> shipmentUuid,
      Value<String?> orderUuid,
      Value<String> orderItemUuid,
      Value<String?> productUuid,
      Value<double?> quantityValue,
      Value<String?> quantityUnit,
      Value<String> itemStatus,
    });

class $$ShipmentItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ShipmentItemsTable> {
  $$ShipmentItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shipmentUuid => $composableBuilder(
    column: $table.shipmentUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderUuid => $composableBuilder(
    column: $table.orderUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderItemUuid => $composableBuilder(
    column: $table.orderItemUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantityValue => $composableBuilder(
    column: $table.quantityValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemStatus => $composableBuilder(
    column: $table.itemStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ShipmentItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ShipmentItemsTable> {
  $$ShipmentItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shipmentUuid => $composableBuilder(
    column: $table.shipmentUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderUuid => $composableBuilder(
    column: $table.orderUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderItemUuid => $composableBuilder(
    column: $table.orderItemUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantityValue => $composableBuilder(
    column: $table.quantityValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemStatus => $composableBuilder(
    column: $table.itemStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ShipmentItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShipmentItemsTable> {
  $$ShipmentItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get shipmentUuid => $composableBuilder(
    column: $table.shipmentUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get orderUuid =>
      $composableBuilder(column: $table.orderUuid, builder: (column) => column);

  GeneratedColumn<String> get orderItemUuid => $composableBuilder(
    column: $table.orderItemUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantityValue => $composableBuilder(
    column: $table.quantityValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => column,
  );

  GeneratedColumn<String> get itemStatus => $composableBuilder(
    column: $table.itemStatus,
    builder: (column) => column,
  );
}

class $$ShipmentItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShipmentItemsTable,
          ShipmentItem,
          $$ShipmentItemsTableFilterComposer,
          $$ShipmentItemsTableOrderingComposer,
          $$ShipmentItemsTableAnnotationComposer,
          $$ShipmentItemsTableCreateCompanionBuilder,
          $$ShipmentItemsTableUpdateCompanionBuilder,
          (
            ShipmentItem,
            BaseReferences<_$AppDatabase, $ShipmentItemsTable, ShipmentItem>,
          ),
          ShipmentItem,
          PrefetchHooks Function()
        > {
  $$ShipmentItemsTableTableManager(_$AppDatabase db, $ShipmentItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShipmentItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShipmentItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShipmentItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> shipmentUuid = const Value.absent(),
                Value<String?> orderUuid = const Value.absent(),
                Value<String> orderItemUuid = const Value.absent(),
                Value<String?> productUuid = const Value.absent(),
                Value<double?> quantityValue = const Value.absent(),
                Value<String?> quantityUnit = const Value.absent(),
                Value<String> itemStatus = const Value.absent(),
              }) => ShipmentItemsCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                shipmentUuid: shipmentUuid,
                orderUuid: orderUuid,
                orderItemUuid: orderItemUuid,
                productUuid: productUuid,
                quantityValue: quantityValue,
                quantityUnit: quantityUnit,
                itemStatus: itemStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String shipmentUuid,
                Value<String?> orderUuid = const Value.absent(),
                required String orderItemUuid,
                Value<String?> productUuid = const Value.absent(),
                Value<double?> quantityValue = const Value.absent(),
                Value<String?> quantityUnit = const Value.absent(),
                Value<String> itemStatus = const Value.absent(),
              }) => ShipmentItemsCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                shipmentUuid: shipmentUuid,
                orderUuid: orderUuid,
                orderItemUuid: orderItemUuid,
                productUuid: productUuid,
                quantityValue: quantityValue,
                quantityUnit: quantityUnit,
                itemStatus: itemStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ShipmentItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShipmentItemsTable,
      ShipmentItem,
      $$ShipmentItemsTableFilterComposer,
      $$ShipmentItemsTableOrderingComposer,
      $$ShipmentItemsTableAnnotationComposer,
      $$ShipmentItemsTableCreateCompanionBuilder,
      $$ShipmentItemsTableUpdateCompanionBuilder,
      (
        ShipmentItem,
        BaseReferences<_$AppDatabase, $ShipmentItemsTable, ShipmentItem>,
      ),
      ShipmentItem,
      PrefetchHooks Function()
    >;
typedef $$InventoryItemsTableCreateCompanionBuilder =
    InventoryItemsCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String?> productUuid,
      required String productNameSnapshot,
      Value<String?> productCodeSnapshot,
      Value<String?> specificationSnapshot,
      Value<double> quantityValue,
      Value<String?> quantityUnit,
      Value<String?> warehouseName,
      Value<String> inventoryStatus,
    });
typedef $$InventoryItemsTableUpdateCompanionBuilder =
    InventoryItemsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String?> productUuid,
      Value<String> productNameSnapshot,
      Value<String?> productCodeSnapshot,
      Value<String?> specificationSnapshot,
      Value<double> quantityValue,
      Value<String?> quantityUnit,
      Value<String?> warehouseName,
      Value<String> inventoryStatus,
    });

class $$InventoryItemsTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productNameSnapshot => $composableBuilder(
    column: $table.productNameSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productCodeSnapshot => $composableBuilder(
    column: $table.productCodeSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specificationSnapshot => $composableBuilder(
    column: $table.specificationSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantityValue => $composableBuilder(
    column: $table.quantityValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get warehouseName => $composableBuilder(
    column: $table.warehouseName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get inventoryStatus => $composableBuilder(
    column: $table.inventoryStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InventoryItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productNameSnapshot => $composableBuilder(
    column: $table.productNameSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productCodeSnapshot => $composableBuilder(
    column: $table.productCodeSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specificationSnapshot => $composableBuilder(
    column: $table.specificationSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantityValue => $composableBuilder(
    column: $table.quantityValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get warehouseName => $composableBuilder(
    column: $table.warehouseName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get inventoryStatus => $composableBuilder(
    column: $table.inventoryStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InventoryItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productNameSnapshot => $composableBuilder(
    column: $table.productNameSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productCodeSnapshot => $composableBuilder(
    column: $table.productCodeSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<String> get specificationSnapshot => $composableBuilder(
    column: $table.specificationSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantityValue => $composableBuilder(
    column: $table.quantityValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => column,
  );

  GeneratedColumn<String> get warehouseName => $composableBuilder(
    column: $table.warehouseName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get inventoryStatus => $composableBuilder(
    column: $table.inventoryStatus,
    builder: (column) => column,
  );
}

class $$InventoryItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InventoryItemsTable,
          InventoryItem,
          $$InventoryItemsTableFilterComposer,
          $$InventoryItemsTableOrderingComposer,
          $$InventoryItemsTableAnnotationComposer,
          $$InventoryItemsTableCreateCompanionBuilder,
          $$InventoryItemsTableUpdateCompanionBuilder,
          (
            InventoryItem,
            BaseReferences<_$AppDatabase, $InventoryItemsTable, InventoryItem>,
          ),
          InventoryItem,
          PrefetchHooks Function()
        > {
  $$InventoryItemsTableTableManager(
    _$AppDatabase db,
    $InventoryItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String?> productUuid = const Value.absent(),
                Value<String> productNameSnapshot = const Value.absent(),
                Value<String?> productCodeSnapshot = const Value.absent(),
                Value<String?> specificationSnapshot = const Value.absent(),
                Value<double> quantityValue = const Value.absent(),
                Value<String?> quantityUnit = const Value.absent(),
                Value<String?> warehouseName = const Value.absent(),
                Value<String> inventoryStatus = const Value.absent(),
              }) => InventoryItemsCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                productUuid: productUuid,
                productNameSnapshot: productNameSnapshot,
                productCodeSnapshot: productCodeSnapshot,
                specificationSnapshot: specificationSnapshot,
                quantityValue: quantityValue,
                quantityUnit: quantityUnit,
                warehouseName: warehouseName,
                inventoryStatus: inventoryStatus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String?> productUuid = const Value.absent(),
                required String productNameSnapshot,
                Value<String?> productCodeSnapshot = const Value.absent(),
                Value<String?> specificationSnapshot = const Value.absent(),
                Value<double> quantityValue = const Value.absent(),
                Value<String?> quantityUnit = const Value.absent(),
                Value<String?> warehouseName = const Value.absent(),
                Value<String> inventoryStatus = const Value.absent(),
              }) => InventoryItemsCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                productUuid: productUuid,
                productNameSnapshot: productNameSnapshot,
                productCodeSnapshot: productCodeSnapshot,
                specificationSnapshot: specificationSnapshot,
                quantityValue: quantityValue,
                quantityUnit: quantityUnit,
                warehouseName: warehouseName,
                inventoryStatus: inventoryStatus,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InventoryItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InventoryItemsTable,
      InventoryItem,
      $$InventoryItemsTableFilterComposer,
      $$InventoryItemsTableOrderingComposer,
      $$InventoryItemsTableAnnotationComposer,
      $$InventoryItemsTableCreateCompanionBuilder,
      $$InventoryItemsTableUpdateCompanionBuilder,
      (
        InventoryItem,
        BaseReferences<_$AppDatabase, $InventoryItemsTable, InventoryItem>,
      ),
      InventoryItem,
      PrefetchHooks Function()
    >;
typedef $$InventoryLogsTableCreateCompanionBuilder =
    InventoryLogsCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String?> inventoryItemUuid,
      Value<String?> productUuid,
      Value<String?> relatedType,
      Value<String?> relatedUuid,
      required String changeType,
      required double quantityChangeValue,
      Value<String?> quantityUnit,
      Value<double?> beforeQuantityValue,
      Value<double?> afterQuantityValue,
      Value<DateTime> operatedAt,
      Value<String?> operatorName,
    });
typedef $$InventoryLogsTableUpdateCompanionBuilder =
    InventoryLogsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String?> inventoryItemUuid,
      Value<String?> productUuid,
      Value<String?> relatedType,
      Value<String?> relatedUuid,
      Value<String> changeType,
      Value<double> quantityChangeValue,
      Value<String?> quantityUnit,
      Value<double?> beforeQuantityValue,
      Value<double?> afterQuantityValue,
      Value<DateTime> operatedAt,
      Value<String?> operatorName,
    });

class $$InventoryLogsTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryLogsTable> {
  $$InventoryLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get inventoryItemUuid => $composableBuilder(
    column: $table.inventoryItemUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedType => $composableBuilder(
    column: $table.relatedType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedUuid => $composableBuilder(
    column: $table.relatedUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get changeType => $composableBuilder(
    column: $table.changeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantityChangeValue => $composableBuilder(
    column: $table.quantityChangeValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get beforeQuantityValue => $composableBuilder(
    column: $table.beforeQuantityValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get afterQuantityValue => $composableBuilder(
    column: $table.afterQuantityValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get operatedAt => $composableBuilder(
    column: $table.operatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operatorName => $composableBuilder(
    column: $table.operatorName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InventoryLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryLogsTable> {
  $$InventoryLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get inventoryItemUuid => $composableBuilder(
    column: $table.inventoryItemUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedType => $composableBuilder(
    column: $table.relatedType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedUuid => $composableBuilder(
    column: $table.relatedUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get changeType => $composableBuilder(
    column: $table.changeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantityChangeValue => $composableBuilder(
    column: $table.quantityChangeValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get beforeQuantityValue => $composableBuilder(
    column: $table.beforeQuantityValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get afterQuantityValue => $composableBuilder(
    column: $table.afterQuantityValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get operatedAt => $composableBuilder(
    column: $table.operatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operatorName => $composableBuilder(
    column: $table.operatorName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InventoryLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryLogsTable> {
  $$InventoryLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get inventoryItemUuid => $composableBuilder(
    column: $table.inventoryItemUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productUuid => $composableBuilder(
    column: $table.productUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get relatedType => $composableBuilder(
    column: $table.relatedType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get relatedUuid => $composableBuilder(
    column: $table.relatedUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get changeType => $composableBuilder(
    column: $table.changeType,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantityChangeValue => $composableBuilder(
    column: $table.quantityChangeValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get quantityUnit => $composableBuilder(
    column: $table.quantityUnit,
    builder: (column) => column,
  );

  GeneratedColumn<double> get beforeQuantityValue => $composableBuilder(
    column: $table.beforeQuantityValue,
    builder: (column) => column,
  );

  GeneratedColumn<double> get afterQuantityValue => $composableBuilder(
    column: $table.afterQuantityValue,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get operatedAt => $composableBuilder(
    column: $table.operatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get operatorName => $composableBuilder(
    column: $table.operatorName,
    builder: (column) => column,
  );
}

class $$InventoryLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InventoryLogsTable,
          InventoryLog,
          $$InventoryLogsTableFilterComposer,
          $$InventoryLogsTableOrderingComposer,
          $$InventoryLogsTableAnnotationComposer,
          $$InventoryLogsTableCreateCompanionBuilder,
          $$InventoryLogsTableUpdateCompanionBuilder,
          (
            InventoryLog,
            BaseReferences<_$AppDatabase, $InventoryLogsTable, InventoryLog>,
          ),
          InventoryLog,
          PrefetchHooks Function()
        > {
  $$InventoryLogsTableTableManager(_$AppDatabase db, $InventoryLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String?> inventoryItemUuid = const Value.absent(),
                Value<String?> productUuid = const Value.absent(),
                Value<String?> relatedType = const Value.absent(),
                Value<String?> relatedUuid = const Value.absent(),
                Value<String> changeType = const Value.absent(),
                Value<double> quantityChangeValue = const Value.absent(),
                Value<String?> quantityUnit = const Value.absent(),
                Value<double?> beforeQuantityValue = const Value.absent(),
                Value<double?> afterQuantityValue = const Value.absent(),
                Value<DateTime> operatedAt = const Value.absent(),
                Value<String?> operatorName = const Value.absent(),
              }) => InventoryLogsCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                inventoryItemUuid: inventoryItemUuid,
                productUuid: productUuid,
                relatedType: relatedType,
                relatedUuid: relatedUuid,
                changeType: changeType,
                quantityChangeValue: quantityChangeValue,
                quantityUnit: quantityUnit,
                beforeQuantityValue: beforeQuantityValue,
                afterQuantityValue: afterQuantityValue,
                operatedAt: operatedAt,
                operatorName: operatorName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String?> inventoryItemUuid = const Value.absent(),
                Value<String?> productUuid = const Value.absent(),
                Value<String?> relatedType = const Value.absent(),
                Value<String?> relatedUuid = const Value.absent(),
                required String changeType,
                required double quantityChangeValue,
                Value<String?> quantityUnit = const Value.absent(),
                Value<double?> beforeQuantityValue = const Value.absent(),
                Value<double?> afterQuantityValue = const Value.absent(),
                Value<DateTime> operatedAt = const Value.absent(),
                Value<String?> operatorName = const Value.absent(),
              }) => InventoryLogsCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                inventoryItemUuid: inventoryItemUuid,
                productUuid: productUuid,
                relatedType: relatedType,
                relatedUuid: relatedUuid,
                changeType: changeType,
                quantityChangeValue: quantityChangeValue,
                quantityUnit: quantityUnit,
                beforeQuantityValue: beforeQuantityValue,
                afterQuantityValue: afterQuantityValue,
                operatedAt: operatedAt,
                operatorName: operatorName,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InventoryLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InventoryLogsTable,
      InventoryLog,
      $$InventoryLogsTableFilterComposer,
      $$InventoryLogsTableOrderingComposer,
      $$InventoryLogsTableAnnotationComposer,
      $$InventoryLogsTableCreateCompanionBuilder,
      $$InventoryLogsTableUpdateCompanionBuilder,
      (
        InventoryLog,
        BaseReferences<_$AppDatabase, $InventoryLogsTable, InventoryLog>,
      ),
      InventoryLog,
      PrefetchHooks Function()
    >;
typedef $$ExpenseItemsTableCreateCompanionBuilder =
    ExpenseItemsCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String relatedType,
      required String relatedUuid,
      required String expenseType,
      required int amount,
      Value<DateTime?> expenseDate,
      Value<String?> orderUuid,
      Value<String?> supplierUuid,
    });
typedef $$ExpenseItemsTableUpdateCompanionBuilder =
    ExpenseItemsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> relatedType,
      Value<String> relatedUuid,
      Value<String> expenseType,
      Value<int> amount,
      Value<DateTime?> expenseDate,
      Value<String?> orderUuid,
      Value<String?> supplierUuid,
    });

class $$ExpenseItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ExpenseItemsTable> {
  $$ExpenseItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedType => $composableBuilder(
    column: $table.relatedType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedUuid => $composableBuilder(
    column: $table.relatedUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expenseType => $composableBuilder(
    column: $table.expenseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expenseDate => $composableBuilder(
    column: $table.expenseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderUuid => $composableBuilder(
    column: $table.orderUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supplierUuid => $composableBuilder(
    column: $table.supplierUuid,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExpenseItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpenseItemsTable> {
  $$ExpenseItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedType => $composableBuilder(
    column: $table.relatedType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedUuid => $composableBuilder(
    column: $table.relatedUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expenseType => $composableBuilder(
    column: $table.expenseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expenseDate => $composableBuilder(
    column: $table.expenseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderUuid => $composableBuilder(
    column: $table.orderUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supplierUuid => $composableBuilder(
    column: $table.supplierUuid,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExpenseItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpenseItemsTable> {
  $$ExpenseItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get relatedType => $composableBuilder(
    column: $table.relatedType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get relatedUuid => $composableBuilder(
    column: $table.relatedUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get expenseType => $composableBuilder(
    column: $table.expenseType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get expenseDate => $composableBuilder(
    column: $table.expenseDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get orderUuid =>
      $composableBuilder(column: $table.orderUuid, builder: (column) => column);

  GeneratedColumn<String> get supplierUuid => $composableBuilder(
    column: $table.supplierUuid,
    builder: (column) => column,
  );
}

class $$ExpenseItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpenseItemsTable,
          ExpenseItem,
          $$ExpenseItemsTableFilterComposer,
          $$ExpenseItemsTableOrderingComposer,
          $$ExpenseItemsTableAnnotationComposer,
          $$ExpenseItemsTableCreateCompanionBuilder,
          $$ExpenseItemsTableUpdateCompanionBuilder,
          (
            ExpenseItem,
            BaseReferences<_$AppDatabase, $ExpenseItemsTable, ExpenseItem>,
          ),
          ExpenseItem,
          PrefetchHooks Function()
        > {
  $$ExpenseItemsTableTableManager(_$AppDatabase db, $ExpenseItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpenseItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpenseItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpenseItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> relatedType = const Value.absent(),
                Value<String> relatedUuid = const Value.absent(),
                Value<String> expenseType = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<DateTime?> expenseDate = const Value.absent(),
                Value<String?> orderUuid = const Value.absent(),
                Value<String?> supplierUuid = const Value.absent(),
              }) => ExpenseItemsCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                relatedType: relatedType,
                relatedUuid: relatedUuid,
                expenseType: expenseType,
                amount: amount,
                expenseDate: expenseDate,
                orderUuid: orderUuid,
                supplierUuid: supplierUuid,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String relatedType,
                required String relatedUuid,
                required String expenseType,
                required int amount,
                Value<DateTime?> expenseDate = const Value.absent(),
                Value<String?> orderUuid = const Value.absent(),
                Value<String?> supplierUuid = const Value.absent(),
              }) => ExpenseItemsCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                relatedType: relatedType,
                relatedUuid: relatedUuid,
                expenseType: expenseType,
                amount: amount,
                expenseDate: expenseDate,
                orderUuid: orderUuid,
                supplierUuid: supplierUuid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExpenseItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpenseItemsTable,
      ExpenseItem,
      $$ExpenseItemsTableFilterComposer,
      $$ExpenseItemsTableOrderingComposer,
      $$ExpenseItemsTableAnnotationComposer,
      $$ExpenseItemsTableCreateCompanionBuilder,
      $$ExpenseItemsTableUpdateCompanionBuilder,
      (
        ExpenseItem,
        BaseReferences<_$AppDatabase, $ExpenseItemsTable, ExpenseItem>,
      ),
      ExpenseItem,
      PrefetchHooks Function()
    >;
typedef $$PaymentsTableCreateCompanionBuilder =
    PaymentsCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String relatedType,
      required String relatedUuid,
      Value<String> paymentType,
      required int amount,
      Value<DateTime?> paymentDate,
      Value<String> paymentStatus,
      Value<String?> accountName,
    });
typedef $$PaymentsTableUpdateCompanionBuilder =
    PaymentsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> relatedType,
      Value<String> relatedUuid,
      Value<String> paymentType,
      Value<int> amount,
      Value<DateTime?> paymentDate,
      Value<String> paymentStatus,
      Value<String?> accountName,
    });

class $$PaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedType => $composableBuilder(
    column: $table.relatedType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedUuid => $composableBuilder(
    column: $table.relatedUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentType => $composableBuilder(
    column: $table.paymentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountName => $composableBuilder(
    column: $table.accountName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedType => $composableBuilder(
    column: $table.relatedType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedUuid => $composableBuilder(
    column: $table.relatedUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentType => $composableBuilder(
    column: $table.paymentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountName => $composableBuilder(
    column: $table.accountName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get relatedType => $composableBuilder(
    column: $table.relatedType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get relatedUuid => $composableBuilder(
    column: $table.relatedUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentType => $composableBuilder(
    column: $table.paymentType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accountName => $composableBuilder(
    column: $table.accountName,
    builder: (column) => column,
  );
}

class $$PaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentsTable,
          Payment,
          $$PaymentsTableFilterComposer,
          $$PaymentsTableOrderingComposer,
          $$PaymentsTableAnnotationComposer,
          $$PaymentsTableCreateCompanionBuilder,
          $$PaymentsTableUpdateCompanionBuilder,
          (Payment, BaseReferences<_$AppDatabase, $PaymentsTable, Payment>),
          Payment,
          PrefetchHooks Function()
        > {
  $$PaymentsTableTableManager(_$AppDatabase db, $PaymentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> relatedType = const Value.absent(),
                Value<String> relatedUuid = const Value.absent(),
                Value<String> paymentType = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<DateTime?> paymentDate = const Value.absent(),
                Value<String> paymentStatus = const Value.absent(),
                Value<String?> accountName = const Value.absent(),
              }) => PaymentsCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                relatedType: relatedType,
                relatedUuid: relatedUuid,
                paymentType: paymentType,
                amount: amount,
                paymentDate: paymentDate,
                paymentStatus: paymentStatus,
                accountName: accountName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String relatedType,
                required String relatedUuid,
                Value<String> paymentType = const Value.absent(),
                required int amount,
                Value<DateTime?> paymentDate = const Value.absent(),
                Value<String> paymentStatus = const Value.absent(),
                Value<String?> accountName = const Value.absent(),
              }) => PaymentsCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                relatedType: relatedType,
                relatedUuid: relatedUuid,
                paymentType: paymentType,
                amount: amount,
                paymentDate: paymentDate,
                paymentStatus: paymentStatus,
                accountName: accountName,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentsTable,
      Payment,
      $$PaymentsTableFilterComposer,
      $$PaymentsTableOrderingComposer,
      $$PaymentsTableAnnotationComposer,
      $$PaymentsTableCreateCompanionBuilder,
      $$PaymentsTableUpdateCompanionBuilder,
      (Payment, BaseReferences<_$AppDatabase, $PaymentsTable, Payment>),
      Payment,
      PrefetchHooks Function()
    >;
typedef $$AttachmentsTableCreateCompanionBuilder =
    AttachmentsCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String relatedType,
      required String relatedUuid,
      required String fileName,
      required String filePath,
      Value<String?> fileType,
      Value<int?> fileSize,
      Value<DateTime> attachedAt,
    });
typedef $$AttachmentsTableUpdateCompanionBuilder =
    AttachmentsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> relatedType,
      Value<String> relatedUuid,
      Value<String> fileName,
      Value<String> filePath,
      Value<String?> fileType,
      Value<int?> fileSize,
      Value<DateTime> attachedAt,
    });

class $$AttachmentsTableFilterComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedType => $composableBuilder(
    column: $table.relatedType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedUuid => $composableBuilder(
    column: $table.relatedUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fileSize => $composableBuilder(
    column: $table.fileSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get attachedAt => $composableBuilder(
    column: $table.attachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AttachmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedType => $composableBuilder(
    column: $table.relatedType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedUuid => $composableBuilder(
    column: $table.relatedUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fileSize => $composableBuilder(
    column: $table.fileSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get attachedAt => $composableBuilder(
    column: $table.attachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AttachmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get relatedType => $composableBuilder(
    column: $table.relatedType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get relatedUuid => $composableBuilder(
    column: $table.relatedUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get fileType =>
      $composableBuilder(column: $table.fileType, builder: (column) => column);

  GeneratedColumn<int> get fileSize =>
      $composableBuilder(column: $table.fileSize, builder: (column) => column);

  GeneratedColumn<DateTime> get attachedAt => $composableBuilder(
    column: $table.attachedAt,
    builder: (column) => column,
  );
}

class $$AttachmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AttachmentsTable,
          Attachment,
          $$AttachmentsTableFilterComposer,
          $$AttachmentsTableOrderingComposer,
          $$AttachmentsTableAnnotationComposer,
          $$AttachmentsTableCreateCompanionBuilder,
          $$AttachmentsTableUpdateCompanionBuilder,
          (
            Attachment,
            BaseReferences<_$AppDatabase, $AttachmentsTable, Attachment>,
          ),
          Attachment,
          PrefetchHooks Function()
        > {
  $$AttachmentsTableTableManager(_$AppDatabase db, $AttachmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttachmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> relatedType = const Value.absent(),
                Value<String> relatedUuid = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<String?> fileType = const Value.absent(),
                Value<int?> fileSize = const Value.absent(),
                Value<DateTime> attachedAt = const Value.absent(),
              }) => AttachmentsCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                relatedType: relatedType,
                relatedUuid: relatedUuid,
                fileName: fileName,
                filePath: filePath,
                fileType: fileType,
                fileSize: fileSize,
                attachedAt: attachedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String relatedType,
                required String relatedUuid,
                required String fileName,
                required String filePath,
                Value<String?> fileType = const Value.absent(),
                Value<int?> fileSize = const Value.absent(),
                Value<DateTime> attachedAt = const Value.absent(),
              }) => AttachmentsCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                relatedType: relatedType,
                relatedUuid: relatedUuid,
                fileName: fileName,
                filePath: filePath,
                fileType: fileType,
                fileSize: fileSize,
                attachedAt: attachedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AttachmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AttachmentsTable,
      Attachment,
      $$AttachmentsTableFilterComposer,
      $$AttachmentsTableOrderingComposer,
      $$AttachmentsTableAnnotationComposer,
      $$AttachmentsTableCreateCompanionBuilder,
      $$AttachmentsTableUpdateCompanionBuilder,
      (
        Attachment,
        BaseReferences<_$AppDatabase, $AttachmentsTable, Attachment>,
      ),
      Attachment,
      PrefetchHooks Function()
    >;
typedef $$AuditLogsTableCreateCompanionBuilder =
    AuditLogsCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String entityType,
      required String entityUuid,
      required String actionType,
      Value<String?> oldValue,
      Value<String?> newValue,
      Value<String?> operatorName,
      Value<DateTime> operatedAt,
    });
typedef $$AuditLogsTableUpdateCompanionBuilder =
    AuditLogsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> entityType,
      Value<String> entityUuid,
      Value<String> actionType,
      Value<String?> oldValue,
      Value<String?> newValue,
      Value<String?> operatorName,
      Value<DateTime> operatedAt,
    });

class $$AuditLogsTableFilterComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityUuid => $composableBuilder(
    column: $table.entityUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get oldValue => $composableBuilder(
    column: $table.oldValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get newValue => $composableBuilder(
    column: $table.newValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get operatorName => $composableBuilder(
    column: $table.operatorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get operatedAt => $composableBuilder(
    column: $table.operatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AuditLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityUuid => $composableBuilder(
    column: $table.entityUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get oldValue => $composableBuilder(
    column: $table.oldValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get newValue => $composableBuilder(
    column: $table.newValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get operatorName => $composableBuilder(
    column: $table.operatorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get operatedAt => $composableBuilder(
    column: $table.operatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuditLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityUuid => $composableBuilder(
    column: $table.entityUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get oldValue =>
      $composableBuilder(column: $table.oldValue, builder: (column) => column);

  GeneratedColumn<String> get newValue =>
      $composableBuilder(column: $table.newValue, builder: (column) => column);

  GeneratedColumn<String> get operatorName => $composableBuilder(
    column: $table.operatorName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get operatedAt => $composableBuilder(
    column: $table.operatedAt,
    builder: (column) => column,
  );
}

class $$AuditLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditLogsTable,
          AuditLog,
          $$AuditLogsTableFilterComposer,
          $$AuditLogsTableOrderingComposer,
          $$AuditLogsTableAnnotationComposer,
          $$AuditLogsTableCreateCompanionBuilder,
          $$AuditLogsTableUpdateCompanionBuilder,
          (AuditLog, BaseReferences<_$AppDatabase, $AuditLogsTable, AuditLog>),
          AuditLog,
          PrefetchHooks Function()
        > {
  $$AuditLogsTableTableManager(_$AppDatabase db, $AuditLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityUuid = const Value.absent(),
                Value<String> actionType = const Value.absent(),
                Value<String?> oldValue = const Value.absent(),
                Value<String?> newValue = const Value.absent(),
                Value<String?> operatorName = const Value.absent(),
                Value<DateTime> operatedAt = const Value.absent(),
              }) => AuditLogsCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                entityType: entityType,
                entityUuid: entityUuid,
                actionType: actionType,
                oldValue: oldValue,
                newValue: newValue,
                operatorName: operatorName,
                operatedAt: operatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String entityType,
                required String entityUuid,
                required String actionType,
                Value<String?> oldValue = const Value.absent(),
                Value<String?> newValue = const Value.absent(),
                Value<String?> operatorName = const Value.absent(),
                Value<DateTime> operatedAt = const Value.absent(),
              }) => AuditLogsCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                entityType: entityType,
                entityUuid: entityUuid,
                actionType: actionType,
                oldValue: oldValue,
                newValue: newValue,
                operatorName: operatorName,
                operatedAt: operatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AuditLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditLogsTable,
      AuditLog,
      $$AuditLogsTableFilterComposer,
      $$AuditLogsTableOrderingComposer,
      $$AuditLogsTableAnnotationComposer,
      $$AuditLogsTableCreateCompanionBuilder,
      $$AuditLogsTableUpdateCompanionBuilder,
      (AuditLog, BaseReferences<_$AppDatabase, $AuditLogsTable, AuditLog>),
      AuditLog,
      PrefetchHooks Function()
    >;
typedef $$DictionariesTableCreateCompanionBuilder =
    DictionariesCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String dictType,
      required String dictKey,
      required String dictLabel,
      Value<int> sortOrder,
      Value<bool> isEnabled,
    });
typedef $$DictionariesTableUpdateCompanionBuilder =
    DictionariesCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> dictType,
      Value<String> dictKey,
      Value<String> dictLabel,
      Value<int> sortOrder,
      Value<bool> isEnabled,
    });

class $$DictionariesTableFilterComposer
    extends Composer<_$AppDatabase, $DictionariesTable> {
  $$DictionariesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dictType => $composableBuilder(
    column: $table.dictType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dictKey => $composableBuilder(
    column: $table.dictKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dictLabel => $composableBuilder(
    column: $table.dictLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DictionariesTableOrderingComposer
    extends Composer<_$AppDatabase, $DictionariesTable> {
  $$DictionariesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dictType => $composableBuilder(
    column: $table.dictType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dictKey => $composableBuilder(
    column: $table.dictKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dictLabel => $composableBuilder(
    column: $table.dictLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DictionariesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DictionariesTable> {
  $$DictionariesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get dictType =>
      $composableBuilder(column: $table.dictType, builder: (column) => column);

  GeneratedColumn<String> get dictKey =>
      $composableBuilder(column: $table.dictKey, builder: (column) => column);

  GeneratedColumn<String> get dictLabel =>
      $composableBuilder(column: $table.dictLabel, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);
}

class $$DictionariesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DictionariesTable,
          Dictionary,
          $$DictionariesTableFilterComposer,
          $$DictionariesTableOrderingComposer,
          $$DictionariesTableAnnotationComposer,
          $$DictionariesTableCreateCompanionBuilder,
          $$DictionariesTableUpdateCompanionBuilder,
          (
            Dictionary,
            BaseReferences<_$AppDatabase, $DictionariesTable, Dictionary>,
          ),
          Dictionary,
          PrefetchHooks Function()
        > {
  $$DictionariesTableTableManager(_$AppDatabase db, $DictionariesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DictionariesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DictionariesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DictionariesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> dictType = const Value.absent(),
                Value<String> dictKey = const Value.absent(),
                Value<String> dictLabel = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
              }) => DictionariesCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                dictType: dictType,
                dictKey: dictKey,
                dictLabel: dictLabel,
                sortOrder: sortOrder,
                isEnabled: isEnabled,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String dictType,
                required String dictKey,
                required String dictLabel,
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
              }) => DictionariesCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                dictType: dictType,
                dictKey: dictKey,
                dictLabel: dictLabel,
                sortOrder: sortOrder,
                isEnabled: isEnabled,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DictionariesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DictionariesTable,
      Dictionary,
      $$DictionariesTableFilterComposer,
      $$DictionariesTableOrderingComposer,
      $$DictionariesTableAnnotationComposer,
      $$DictionariesTableCreateCompanionBuilder,
      $$DictionariesTableUpdateCompanionBuilder,
      (
        Dictionary,
        BaseReferences<_$AppDatabase, $DictionariesTable, Dictionary>,
      ),
      Dictionary,
      PrefetchHooks Function()
    >;
typedef $$CustomFieldsTableCreateCompanionBuilder =
    CustomFieldsCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String entityType,
      required String fieldKey,
      required String fieldLabel,
      Value<String> fieldType,
      Value<bool> isRequired,
      Value<bool> isEnabled,
      Value<int> sortOrder,
      Value<String?> optionsJson,
    });
typedef $$CustomFieldsTableUpdateCompanionBuilder =
    CustomFieldsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> entityType,
      Value<String> fieldKey,
      Value<String> fieldLabel,
      Value<String> fieldType,
      Value<bool> isRequired,
      Value<bool> isEnabled,
      Value<int> sortOrder,
      Value<String?> optionsJson,
    });

class $$CustomFieldsTableFilterComposer
    extends Composer<_$AppDatabase, $CustomFieldsTable> {
  $$CustomFieldsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fieldKey => $composableBuilder(
    column: $table.fieldKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fieldLabel => $composableBuilder(
    column: $table.fieldLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fieldType => $composableBuilder(
    column: $table.fieldType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRequired => $composableBuilder(
    column: $table.isRequired,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get optionsJson => $composableBuilder(
    column: $table.optionsJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CustomFieldsTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomFieldsTable> {
  $$CustomFieldsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fieldKey => $composableBuilder(
    column: $table.fieldKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fieldLabel => $composableBuilder(
    column: $table.fieldLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fieldType => $composableBuilder(
    column: $table.fieldType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRequired => $composableBuilder(
    column: $table.isRequired,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get optionsJson => $composableBuilder(
    column: $table.optionsJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomFieldsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomFieldsTable> {
  $$CustomFieldsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fieldKey =>
      $composableBuilder(column: $table.fieldKey, builder: (column) => column);

  GeneratedColumn<String> get fieldLabel => $composableBuilder(
    column: $table.fieldLabel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fieldType =>
      $composableBuilder(column: $table.fieldType, builder: (column) => column);

  GeneratedColumn<bool> get isRequired => $composableBuilder(
    column: $table.isRequired,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<String> get optionsJson => $composableBuilder(
    column: $table.optionsJson,
    builder: (column) => column,
  );
}

class $$CustomFieldsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomFieldsTable,
          CustomField,
          $$CustomFieldsTableFilterComposer,
          $$CustomFieldsTableOrderingComposer,
          $$CustomFieldsTableAnnotationComposer,
          $$CustomFieldsTableCreateCompanionBuilder,
          $$CustomFieldsTableUpdateCompanionBuilder,
          (
            CustomField,
            BaseReferences<_$AppDatabase, $CustomFieldsTable, CustomField>,
          ),
          CustomField,
          PrefetchHooks Function()
        > {
  $$CustomFieldsTableTableManager(_$AppDatabase db, $CustomFieldsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomFieldsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomFieldsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomFieldsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> fieldKey = const Value.absent(),
                Value<String> fieldLabel = const Value.absent(),
                Value<String> fieldType = const Value.absent(),
                Value<bool> isRequired = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<String?> optionsJson = const Value.absent(),
              }) => CustomFieldsCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                entityType: entityType,
                fieldKey: fieldKey,
                fieldLabel: fieldLabel,
                fieldType: fieldType,
                isRequired: isRequired,
                isEnabled: isEnabled,
                sortOrder: sortOrder,
                optionsJson: optionsJson,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String entityType,
                required String fieldKey,
                required String fieldLabel,
                Value<String> fieldType = const Value.absent(),
                Value<bool> isRequired = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<String?> optionsJson = const Value.absent(),
              }) => CustomFieldsCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                entityType: entityType,
                fieldKey: fieldKey,
                fieldLabel: fieldLabel,
                fieldType: fieldType,
                isRequired: isRequired,
                isEnabled: isEnabled,
                sortOrder: sortOrder,
                optionsJson: optionsJson,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CustomFieldsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomFieldsTable,
      CustomField,
      $$CustomFieldsTableFilterComposer,
      $$CustomFieldsTableOrderingComposer,
      $$CustomFieldsTableAnnotationComposer,
      $$CustomFieldsTableCreateCompanionBuilder,
      $$CustomFieldsTableUpdateCompanionBuilder,
      (
        CustomField,
        BaseReferences<_$AppDatabase, $CustomFieldsTable, CustomField>,
      ),
      CustomField,
      PrefetchHooks Function()
    >;
typedef $$CustomFieldValuesTableCreateCompanionBuilder =
    CustomFieldValuesCompanion Function({
      Value<int> id,
      required String uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      required String entityType,
      required String entityUuid,
      required String fieldUuid,
      required String fieldKey,
      Value<String?> fieldValue,
    });
typedef $$CustomFieldValuesTableUpdateCompanionBuilder =
    CustomFieldValuesCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> deletedAt,
      Value<String> syncStatus,
      Value<String?> deviceId,
      Value<int> version,
      Value<String?> remark,
      Value<String> entityType,
      Value<String> entityUuid,
      Value<String> fieldUuid,
      Value<String> fieldKey,
      Value<String?> fieldValue,
    });

class $$CustomFieldValuesTableFilterComposer
    extends Composer<_$AppDatabase, $CustomFieldValuesTable> {
  $$CustomFieldValuesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityUuid => $composableBuilder(
    column: $table.entityUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fieldUuid => $composableBuilder(
    column: $table.fieldUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fieldKey => $composableBuilder(
    column: $table.fieldKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fieldValue => $composableBuilder(
    column: $table.fieldValue,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CustomFieldValuesTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomFieldValuesTable> {
  $$CustomFieldValuesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityUuid => $composableBuilder(
    column: $table.entityUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fieldUuid => $composableBuilder(
    column: $table.fieldUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fieldKey => $composableBuilder(
    column: $table.fieldKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fieldValue => $composableBuilder(
    column: $table.fieldValue,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomFieldValuesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomFieldValuesTable> {
  $$CustomFieldValuesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityUuid => $composableBuilder(
    column: $table.entityUuid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fieldUuid =>
      $composableBuilder(column: $table.fieldUuid, builder: (column) => column);

  GeneratedColumn<String> get fieldKey =>
      $composableBuilder(column: $table.fieldKey, builder: (column) => column);

  GeneratedColumn<String> get fieldValue => $composableBuilder(
    column: $table.fieldValue,
    builder: (column) => column,
  );
}

class $$CustomFieldValuesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomFieldValuesTable,
          CustomFieldValue,
          $$CustomFieldValuesTableFilterComposer,
          $$CustomFieldValuesTableOrderingComposer,
          $$CustomFieldValuesTableAnnotationComposer,
          $$CustomFieldValuesTableCreateCompanionBuilder,
          $$CustomFieldValuesTableUpdateCompanionBuilder,
          (
            CustomFieldValue,
            BaseReferences<
              _$AppDatabase,
              $CustomFieldValuesTable,
              CustomFieldValue
            >,
          ),
          CustomFieldValue,
          PrefetchHooks Function()
        > {
  $$CustomFieldValuesTableTableManager(
    _$AppDatabase db,
    $CustomFieldValuesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomFieldValuesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomFieldValuesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomFieldValuesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityUuid = const Value.absent(),
                Value<String> fieldUuid = const Value.absent(),
                Value<String> fieldKey = const Value.absent(),
                Value<String?> fieldValue = const Value.absent(),
              }) => CustomFieldValuesCompanion(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                entityType: entityType,
                entityUuid: entityUuid,
                fieldUuid: fieldUuid,
                fieldKey: fieldKey,
                fieldValue: fieldValue,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> remark = const Value.absent(),
                required String entityType,
                required String entityUuid,
                required String fieldUuid,
                required String fieldKey,
                Value<String?> fieldValue = const Value.absent(),
              }) => CustomFieldValuesCompanion.insert(
                id: id,
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deletedAt: deletedAt,
                syncStatus: syncStatus,
                deviceId: deviceId,
                version: version,
                remark: remark,
                entityType: entityType,
                entityUuid: entityUuid,
                fieldUuid: fieldUuid,
                fieldKey: fieldKey,
                fieldValue: fieldValue,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CustomFieldValuesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomFieldValuesTable,
      CustomFieldValue,
      $$CustomFieldValuesTableFilterComposer,
      $$CustomFieldValuesTableOrderingComposer,
      $$CustomFieldValuesTableAnnotationComposer,
      $$CustomFieldValuesTableCreateCompanionBuilder,
      $$CustomFieldValuesTableUpdateCompanionBuilder,
      (
        CustomFieldValue,
        BaseReferences<
          _$AppDatabase,
          $CustomFieldValuesTable,
          CustomFieldValue
        >,
      ),
      CustomFieldValue,
      PrefetchHooks Function()
    >;
typedef $$SchemaMigrationEntriesTableCreateCompanionBuilder =
    SchemaMigrationEntriesCompanion Function({
      Value<int> id,
      required int version,
      Value<String> description,
      required DateTime appliedAt,
    });
typedef $$SchemaMigrationEntriesTableUpdateCompanionBuilder =
    SchemaMigrationEntriesCompanion Function({
      Value<int> id,
      Value<int> version,
      Value<String> description,
      Value<DateTime> appliedAt,
    });

class $$SchemaMigrationEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $SchemaMigrationEntriesTable> {
  $$SchemaMigrationEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get appliedAt => $composableBuilder(
    column: $table.appliedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SchemaMigrationEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SchemaMigrationEntriesTable> {
  $$SchemaMigrationEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get appliedAt => $composableBuilder(
    column: $table.appliedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SchemaMigrationEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SchemaMigrationEntriesTable> {
  $$SchemaMigrationEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get appliedAt =>
      $composableBuilder(column: $table.appliedAt, builder: (column) => column);
}

class $$SchemaMigrationEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SchemaMigrationEntriesTable,
          SchemaMigrationEntry,
          $$SchemaMigrationEntriesTableFilterComposer,
          $$SchemaMigrationEntriesTableOrderingComposer,
          $$SchemaMigrationEntriesTableAnnotationComposer,
          $$SchemaMigrationEntriesTableCreateCompanionBuilder,
          $$SchemaMigrationEntriesTableUpdateCompanionBuilder,
          (
            SchemaMigrationEntry,
            BaseReferences<
              _$AppDatabase,
              $SchemaMigrationEntriesTable,
              SchemaMigrationEntry
            >,
          ),
          SchemaMigrationEntry,
          PrefetchHooks Function()
        > {
  $$SchemaMigrationEntriesTableTableManager(
    _$AppDatabase db,
    $SchemaMigrationEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SchemaMigrationEntriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$SchemaMigrationEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SchemaMigrationEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> appliedAt = const Value.absent(),
              }) => SchemaMigrationEntriesCompanion(
                id: id,
                version: version,
                description: description,
                appliedAt: appliedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int version,
                Value<String> description = const Value.absent(),
                required DateTime appliedAt,
              }) => SchemaMigrationEntriesCompanion.insert(
                id: id,
                version: version,
                description: description,
                appliedAt: appliedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SchemaMigrationEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SchemaMigrationEntriesTable,
      SchemaMigrationEntry,
      $$SchemaMigrationEntriesTableFilterComposer,
      $$SchemaMigrationEntriesTableOrderingComposer,
      $$SchemaMigrationEntriesTableAnnotationComposer,
      $$SchemaMigrationEntriesTableCreateCompanionBuilder,
      $$SchemaMigrationEntriesTableUpdateCompanionBuilder,
      (
        SchemaMigrationEntry,
        BaseReferences<
          _$AppDatabase,
          $SchemaMigrationEntriesTable,
          SchemaMigrationEntry
        >,
      ),
      SchemaMigrationEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$CustomerAddressesTableTableManager get customerAddresses =>
      $$CustomerAddressesTableTableManager(_db, _db.customerAddresses);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$ProductElementsTableTableManager get productElements =>
      $$ProductElementsTableTableManager(_db, _db.productElements);
  $$SuppliersTableTableManager get suppliers =>
      $$SuppliersTableTableManager(_db, _db.suppliers);
  $$SalesOrdersTableTableManager get salesOrders =>
      $$SalesOrdersTableTableManager(_db, _db.salesOrders);
  $$SalesOrderItemsTableTableManager get salesOrderItems =>
      $$SalesOrderItemsTableTableManager(_db, _db.salesOrderItems);
  $$PurchaseOrdersTableTableManager get purchaseOrders =>
      $$PurchaseOrdersTableTableManager(_db, _db.purchaseOrders);
  $$PurchaseOrderItemsTableTableManager get purchaseOrderItems =>
      $$PurchaseOrderItemsTableTableManager(_db, _db.purchaseOrderItems);
  $$ShipmentsTableTableManager get shipments =>
      $$ShipmentsTableTableManager(_db, _db.shipments);
  $$ShipmentItemsTableTableManager get shipmentItems =>
      $$ShipmentItemsTableTableManager(_db, _db.shipmentItems);
  $$InventoryItemsTableTableManager get inventoryItems =>
      $$InventoryItemsTableTableManager(_db, _db.inventoryItems);
  $$InventoryLogsTableTableManager get inventoryLogs =>
      $$InventoryLogsTableTableManager(_db, _db.inventoryLogs);
  $$ExpenseItemsTableTableManager get expenseItems =>
      $$ExpenseItemsTableTableManager(_db, _db.expenseItems);
  $$PaymentsTableTableManager get payments =>
      $$PaymentsTableTableManager(_db, _db.payments);
  $$AttachmentsTableTableManager get attachments =>
      $$AttachmentsTableTableManager(_db, _db.attachments);
  $$AuditLogsTableTableManager get auditLogs =>
      $$AuditLogsTableTableManager(_db, _db.auditLogs);
  $$DictionariesTableTableManager get dictionaries =>
      $$DictionariesTableTableManager(_db, _db.dictionaries);
  $$CustomFieldsTableTableManager get customFields =>
      $$CustomFieldsTableTableManager(_db, _db.customFields);
  $$CustomFieldValuesTableTableManager get customFieldValues =>
      $$CustomFieldValuesTableTableManager(_db, _db.customFieldValues);
  $$SchemaMigrationEntriesTableTableManager get schemaMigrationEntries =>
      $$SchemaMigrationEntriesTableTableManager(
        _db,
        _db.schemaMigrationEntries,
      );
}
