# 数据库规划

本文件记录第一版 SQLite / Drift 数据库规划。第 0 阶段只做规划，不实现表结构和 migration。

## 通用核心字段

所有核心业务表必须预留以下字段：

```text
id              本地自增 ID，仅本机使用
uuid            全局唯一 ID，未来同步使用
created_at      创建时间
updated_at      更新时间
deleted_at      删除时间，软删除使用
sync_status     同步状态，第一版预留
device_id       设备 ID，第一版预留
version         数据版本，未来同步冲突处理使用
remark          备注
```

金额字段必须使用整数“分”存储。数量字段应拆分为：

```text
quantity_value
quantity_unit
specification
```

## 规划表清单

### 客户与地址

- `customers`：客户主表。
- `customer_addresses`：客户收货地址表。

### 产品与成分

- `products`：产品主表，覆盖科研材料、合金样品、靶材、金属颗粒、定制加工产品和二次加工产品。
- `product_elements`：产品成分表，预留给材料成分和配比管理。

### 厂家与供应商

- `suppliers`：厂家 / 供应商表。

### 销售订单

- `sales_orders`：销售订单主表。
- `sales_order_items`：销售订单明细表。

### 采购与加工

- `purchase_orders`：采购 / 加工单主表。
- `purchase_order_items`：采购 / 加工单明细表。

### 发货

- `shipments`：发货单主表，支持一个订单多个快递单号。
- `shipment_items`：发货明细表，支持一个产品分批发货和多个产品共用同一快递单号。

### 库存

- `inventory_items`：库存主表。
- `inventory_logs`：库存流水表。

### 费用与收付款

- `expense_items`：费用表，记录产品成本、加工费、运费、包装费、检测费、税费和其他费用。
- `payments`：收付款表，第一版预留。

### 附件与日志

- `attachments`：附件表。
- `audit_logs`：操作日志表，记录关键业务修改。

### 字典与扩展字段

- `dictionaries`：字典表，用于订单状态、费用类型、产品类型等可配置项。
- `custom_fields`：自定义字段定义表。
- `custom_field_values`：自定义字段值表。

### 迁移

- `schema_migrations`：数据库迁移记录表。

## 软删除规则

核心业务数据删除时不得物理删除，只能写入：

```text
deleted_at = 当前时间
```

默认查询应过滤 `deleted_at IS NULL`，需要查看历史或恢复时才读取软删除数据。

## 审计日志规则

关键操作必须写入 `audit_logs`，至少包括：

- 创建订单。
- 修改订单。
- 删除订单。
- 修改销售金额。
- 修改成本。
- 修改发货时间。
- 修改快递单号。
- 修改客户地址。
- Excel 导入。
- Excel 导出。
- 备份恢复。

日志字段应包含：

```text
entity_type
entity_uuid
action_type
old_value
new_value
operator_name
operated_at
device_id
remark
```
