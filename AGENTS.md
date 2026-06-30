# AGENTS.md

## Project Root

This repository root is the folder:

```text
JinXiaoCun_2026
```

Treat the current working directory as the project root.

Do **not** create another nested `JinXiaoCun_2026` folder inside this directory.

If initializing Flutter, initialize the project directly in the current directory, for example:

```bash
flutter create . --project-name jin_xiao_cun_2026 --platforms=windows
```

If the directory is not empty, inspect existing files first. Do not delete user files unless explicitly instructed.

---

## Project Purpose

This project is a Windows local-first desktop inventory/order management system for:

- Scientific materials
- Alloy samples
- Sputtering targets
- Metal particles
- Customized processing products
- Secondary processing products
- Supplier/manufacturer purchase and processing workflows

This is **not** a generic inventory system and not just an Excel replacement.

The first version is:

- Windows desktop
- Local only
- Offline by default
- No server dependency
- SQLite local database
- Excel import/export
- Local backup and restore
- Order, customer, product, supplier, shipment, cost, and profit management

Future versions may support:

- Android/iOS mobile clients
- Cloud sync
- Multi-device consistency
- Attachments sync
- Multi-user collaboration
- More product types
- More order statuses
- More fee types
- More custom fields

The most important goal is:

> Build a maintainable, extensible, local-first system from the beginning, so future mobile sync, cloud sync, UI redesign, and feature expansion do not require rewriting the whole project.

---

## Tech Stack

Use the following stack unless explicitly changed by the user:

- Flutter
- Dart
- Windows desktop first
- SQLite for local storage
- Drift for database access
- Riverpod or an equivalent clear state management approach
- Clean Architecture / layered architecture

The application business functions should work offline.

Development may use internet access to fetch dependencies, but runtime business functionality must not require a network connection in V1.

---

## Architecture

Use this dependency direction:

```text
UI / Presentation
→ ViewModel / Provider
→ Service
→ Repository
→ Drift / SQLite
```

### Layer Responsibilities

#### UI / Presentation Layer

Responsible only for:

- Displaying pages
- Rendering widgets
- Handling user interactions
- Calling ViewModels / Providers

The UI layer must not:

- Access SQLite directly
- Import or call `AppDatabase` directly
- Write SQL
- Calculate order totals, costs, profit, profit rate, inventory quantity, or shipment completion status
- Make business decisions about order status or shipment status

#### ViewModel / Provider Layer

Responsible for:

- Page state
- Loading state
- Error state
- Search/filter state
- Selected records
- Calling Services
- Exposing UI-friendly state

#### Service Layer

Responsible for business rules, including:

- Creating and updating orders
- Refreshing order amount fields
- Calculating total sale amount
- Calculating total cost amount
- Calculating profit
- Calculating profit rate
- Determining shipment completion
- Determining order status
- Handling split shipments
- Handling inventory deduction
- Excel import cleanup and validation
- Excel export logic
- Backup and restore logic
- Data quality checks
- Audit log recording

#### Repository Layer

Responsible for database access only:

- Query
- Insert
- Update
- Soft delete
- Search
- Pagination where needed

Repository must not contain complex business calculations.

#### Database Layer

Responsible for:

- Drift tables
- SQLite initialization
- Database file path
- Indexes
- Migration strategy
- Schema versioning

---

## Hard Architecture Rules

- UI must not directly access SQLite.
- UI must not directly import or call `AppDatabase`.
- UI must not write SQL.
- UI must not calculate order totals, costs, profit, profit rate, inventory quantity, or shipment completion status.
- UI must not determine final order status.
- Repository handles database access only.
- Service handles business logic.
- ViewModel / Provider handles page state.
- Presentation handles display and user interaction only.
- Shared UI components must be placed under `lib/shared/widgets`.
- Theme tokens must be placed under `lib/shared/theme`.
- Database schema changes must be implemented through migrations.
- Do not make large unrelated rewrites.
- Do not rewrite completed modules unless explicitly requested.

---

## Directory Rules

Preferred structure:

```text
lib/
│
├─ main.dart
│
├─ app/
│   ├─ app.dart
│   ├─ routes.dart
│   └─ app_config.dart
│
├─ core/
│   ├─ constants/
│   ├─ utils/
│   ├─ errors/
│   ├─ backup/
│   ├─ logger/
│   └─ result/
│
├─ data/
│   ├─ database/
│   │   ├─ app_database.dart
│   │   ├─ tables/
│   │   └─ migrations/
│   │
│   └─ repositories/
│       ├─ order_repository.dart
│       ├─ customer_repository.dart
│       ├─ product_repository.dart
│       ├─ supplier_repository.dart
│       ├─ shipment_repository.dart
│       ├─ finance_repository.dart
│       └─ inventory_repository.dart
│
├─ domain/
│   ├─ models/
│   └─ services/
│       ├─ order_service.dart
│       ├─ finance_service.dart
│       ├─ shipment_service.dart
│       ├─ inventory_service.dart
│       ├─ import_service.dart
│       ├─ export_service.dart
│       └─ backup_service.dart
│
├─ features/
│   ├─ dashboard/
│   │   ├─ presentation/
│   │   ├─ view_models/
│   │   └─ widgets/
│   │
│   ├─ orders/
│   │   ├─ presentation/
│   │   ├─ view_models/
│   │   └─ widgets/
│   │
│   ├─ customers/
│   │   ├─ presentation/
│   │   ├─ view_models/
│   │   └─ widgets/
│   │
│   ├─ products/
│   │   ├─ presentation/
│   │   ├─ view_models/
│   │   └─ widgets/
│   │
│   ├─ suppliers/
│   │   ├─ presentation/
│   │   ├─ view_models/
│   │   └─ widgets/
│   │
│   ├─ shipments/
│   │   ├─ presentation/
│   │   ├─ view_models/
│   │   └─ widgets/
│   │
│   ├─ inventory/
│   │   ├─ presentation/
│   │   ├─ view_models/
│   │   └─ widgets/
│   │
│   ├─ finance/
│   │   ├─ presentation/
│   │   ├─ view_models/
│   │   └─ widgets/
│   │
│   └─ settings/
│       ├─ presentation/
│       ├─ view_models/
│       └─ widgets/
│
└─ shared/
    ├─ theme/
    │   ├─ app_colors.dart
    │   ├─ app_text_styles.dart
    │   ├─ app_spacing.dart
    │   ├─ app_radius.dart
    │   ├─ app_shadows.dart
    │   └─ app_theme.dart
    │
    ├─ widgets/
    │   ├─ app_button.dart
    │   ├─ app_table.dart
    │   ├─ app_card.dart
    │   ├─ app_dialog.dart
    │   ├─ app_text_field.dart
    │   ├─ status_badge.dart
    │   └─ empty_state.dart
    │
    └─ layout/
        ├─ desktop_shell.dart
        ├─ side_navigation.dart
        └─ top_bar.dart
```

### UI-Only Refactor Boundary

If the task is only to redesign UI, the allowed areas are:

```text
lib/features/*/presentation/
lib/features/*/widgets/
lib/shared/theme/
lib/shared/widgets/
lib/shared/layout/
```

Do not casually modify:

```text
lib/data/
lib/domain/
lib/data/database/
lib/data/repositories/
lib/domain/services/
lib/core/backup/
lib/core/logger/
```

---

## Database Rules

All core business tables must include:

- `id`
- `uuid`
- `created_at`
- `updated_at`
- `deleted_at`
- `sync_status`
- `device_id`
- `version`
- `remark`

### UUID Rule

Use UUID for business relationships and future sync.

Do not rely on local auto-increment IDs for business references.

Local auto-increment IDs may exist for SQLite convenience, but business relationships should use UUID fields.

### Soft Delete Rule

Use soft delete for core business data.

Do not physically delete core business records unless explicitly requested for non-business temporary data.

Soft delete means setting:

```text
deleted_at = current timestamp
```

Default queries should exclude rows where `deleted_at` is not null.

### Money Rule

Store money as integer fen/cents, not `double`.

Examples:

```text
250000 means ¥2500.00
113100 means ¥1131.00
1500   means ¥15.00
```

UI may display money in yuan, but database storage must use integer fen.

### Quantity Rule

Store quantity as numeric value plus unit.

Do not store only raw text like `100g` if the value is meant to be used for calculation.

Use fields like:

```text
quantity_value
quantity_unit
specification
```

If parsing fails during Excel import, preserve the original text in a remark or raw field.

### Dictionary Rule

Statuses, types, and fee categories must come from dictionaries, not hardcoded UI strings.

Examples:

- order status
- item status
- shipment status
- payment status
- invoice status
- fee type
- product type
- customer type
- supplier type
- carrier type

### Migration Rule

Database schema changes must be implemented through migrations.

Do not casually edit existing schema without a migration plan.

---

## Core Tables

Plan and implement these tables progressively:

- `customers`
- `customer_addresses`
- `products`
- `product_elements`
- `suppliers`
- `sales_orders`
- `sales_order_items`
- `purchase_orders`
- `purchase_order_items`
- `shipments`
- `shipment_items`
- `inventory_items`
- `inventory_logs`
- `expense_items`
- `payments`
- `attachments`
- `audit_logs`
- `dictionaries`
- `custom_fields`
- `custom_field_values`
- `schema_migrations`

---

## Core Business Rules

### Order Amounts

Total sale amount:

```text
total sale amount = sum of sales order item sale amounts
```

Total cost amount:

```text
total cost amount = product cost + processing fee + shipping fee + packing fee + testing fee + tax fee + other fees
```

Profit:

```text
profit = total sale amount - total cost amount
```

Profit rate:

```text
profit rate = profit / total sale amount
```

If sale amount is empty or zero, do not calculate profit rate. Return a clear warning.

### Shipment Rules

- One sales order can have multiple shipments.
- One shipment can include multiple order items.
- One order item can be shipped in multiple batches.
- Shipment completion and order shipment status must be calculated in the Service layer, not UI.
- A shipment can contain multiple products using the same tracking number.
- One order can have multiple tracking numbers.

### Order Status

Order status must be dictionary-driven.

Default recommended statuses:

```text
draft               草稿
confirmed           已确认
purchasing          待采购/待加工
in_production       厂家生产中
ready_to_ship       待发货
partial_shipped     部分发货
shipped             已发货
completed           已完成
cancelled           已取消
after_sales         售后中
```

### Fee Types

Fee types must be dictionary-driven.

Default recommended fee types:

```text
product_cost        产品成本
processing_fee      加工费
shipping_fee        运费
packing_fee         包装费
testing_fee         检测费
tax_fee             税费
other_fee           其他费用
```

---

## Excel Import Rules

V1 must support importing the current order Excel format.

Expected source columns:

```text
序号
产品名称
货号
规格
重量
客户下单时间
给客户发货时间
成本价
销售金额
收件人信息
厂家
发货方式
快递单号
备注
```

Mapping:

```text
序号              → legacy_no
产品名称          → product_name_snapshot
货号              → product_code_snapshot
规格              → specification_snapshot
重量              → quantity_value + quantity_unit, preserve raw text if parsing fails
客户下单时间      → order_date
给客户发货时间    → ship_date
成本价            → expense_items / cost_amount
销售金额          → sale_amount
收件人信息        → customer + customer_address
厂家              → supplier
发货方式          → carrier
快递单号          → tracking_no
备注              → remark
```

Import must not overwrite existing data silently.

Import should provide a preview or import report.

Import should generate warnings for:

- Unable to parse money
- Unable to parse quantity or unit
- Missing customer phone
- Missing sale amount
- Missing cost
- Missing tracking number
- Missing supplier
- Invalid date
- Duplicate order number
- Duplicate tracking number

Import actions must be recorded in `audit_logs`.

---

## Excel Export Rules

Export should support:

- Full order export
- Filtered order export
- Backup-style export

Recommended export columns:

```text
订单号
客户
客户单位
产品名称
货号
规格
数量
单位
下单时间
发货时间
成本
销售金额
毛利
厂家
快递公司
快递单号
订单状态
备注
```

Exported money should be shown in yuan.

Export actions must be recorded in `audit_logs`.

---

## Backup Rules

Local data directory recommendation:

```text
JinXiaoCun_2026_data/
│
├─ database/
│   └─ inventory.db
│
├─ backup/
│
├─ import/
│
├─ export/
│
├─ attachments/
│
└─ logs/
```

Backup features:

- Auto backup on first launch of the day
- Manual backup
- Keep latest 30 backups
- Restore from backup
- Before restoring, back up the current database
- Backup and restore actions must be recorded in `audit_logs`

If automatic backup on app close is difficult in Flutter Windows, implement launch backup and manual backup first.

---

## Audit Log Rules

Key operations must write to `audit_logs`, including:

- Create order
- Update order
- Delete order
- Modify sale amount
- Modify cost
- Modify ship date
- Modify tracking number
- Modify customer address
- Excel import
- Excel export
- Backup
- Restore

Audit log fields should include:

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

---

## UI Rules

The UI should feel like a modern SaaS desktop application.

Style keywords:

- clean
- modern
- premium
- calm
- clear
- low saturation
- good spacing
- card-based
- elegant tables
- useful status badges
- appropriate information density

Reference direction:

- Notion simplicity
- Linear premium feel
- Feishu/Lark admin clarity
- Modern SaaS admin dashboard
- Raycast-like polish

Use a desktop layout:

- Left navigation
- Top toolbar
- Main content area

Do not build an old-style ERP interface.

Do not hardcode colors, text styles, radii, shadows, or spacing inside pages.

Use shared theme tokens:

- `AppColors`
- `AppTextStyles`
- `AppSpacing`
- `AppRadius`
- `AppShadows`
- `AppTheme`

Use shared widgets:

- `AppButton`
- `AppTextField`
- `AppCard`
- `AppDialog`
- `AppTable`
- `StatusBadge`
- `EmptyState`
- `SectionHeader`
- `SearchInput`

---

## Data Quality Checks

The system should eventually detect and display warnings for:

- Ordered but not shipped
- Shipped but sale amount missing
- Shipped but cost missing
- Cost exists but sale amount missing
- Sale amount exists but cost missing
- Tracking number missing
- Ship date missing
- Order exceeds expected delivery date
- Customer phone missing
- Supplier missing
- Negative profit
- Duplicate tracking number
- Duplicate order number
- Product unit missing
- Insufficient inventory

These checks must be implemented in Service layer, not UI.

---

## Development Process

Work in small stages.

Before changing code:

1. Read this `AGENTS.md`.
2. Read `PROJECT_RULES.md`, `ARCHITECTURE.md`, `DATABASE_SCHEMA.md`, `DEVELOPMENT_ROADMAP.md`, and `UI_GUIDE.md` if they exist.
3. Identify the current requested stage.
4. Do not implement unrelated future stages.

After changing code:

1. Summarize what changed.
2. List important files modified.
3. Run:

```bash
flutter analyze
```

4. Fix serious analyze errors.
5. Explain how to run or test the change.
6. Do not continue into the next stage unless explicitly asked.

---

## Prohibited

- Do not create a nested `JinXiaoCun_2026` directory.
- Do not mix UI, database access, and business logic in one file.
- Do not let UI directly access Drift or SQLite.
- Do not let UI directly import or use `AppDatabase`.
- Do not use `double` for money storage.
- Do not physically delete core business data.
- Do not hardcode business statuses in UI.
- Do not hardcode fee types in UI.
- Do not make huge unrelated changes.
- Do not rewrite completed modules without explicit instruction.
- Do not break existing working modules for unrelated improvements.
- Do not skip `flutter analyze` after code changes unless the environment cannot run Flutter.
- Do not silently ignore errors. Explain them and fix when possible.

---

## Response Style for Codex

When completing a task, always respond with:

1. What was done
2. Key files changed
3. Commands run
4. Analyze/test result
5. How to run or verify
6. What should be done next

Keep the implementation incremental and maintainable.

---

## Stage Completion Protocol

This protocol applies to every development stage in this project, including Stage 0 through Stage 20 and any future stage, hotfix, refactor, UI redesign, database migration, or maintenance task.

After every development stage, Codex must automatically perform the following completion workflow without waiting for the user to remind it again.

This protocol applies even if the individual stage prompt does not explicitly mention Git commit or Git push.

1. Run `flutter analyze`.

2. If `flutter analyze` reports serious errors:
   - Stop the stage completion workflow.
   - Fix the errors if they are within the current stage scope.
   - Run `flutter analyze` again.
   - Do not commit or push until `flutter analyze` passes.

3. Only when `flutter analyze` passes, run:
   - `git status`
   - `git add .`
   - `git commit -m "<stage commit message>"`
   - `git push`

4. The commit message must be clear and stage-based.

Examples:
   - `stage-00: add project planning documents`
   - `stage-01: initialize Flutter Windows project`
   - `stage-02: add project structure and base dependencies`
   - `stage-03: add shared theme system`
   - `stage-04: add shared widgets and desktop layout`
   - `stage-05: integrate SQLite and Drift foundation`
   - `stage-06: add core database tables`
   - `stage-07: add repository layer`
   - `stage-08: add service layer foundation`
   - `stage-09: add order management module`
   - `stage-10: add customer management module`
   - `stage-11: add product management module`
   - `stage-12: add supplier management module`
   - `stage-13: add shipment and batch delivery module`
   - `stage-14: add finance and profit calculation module`
   - `stage-15: add dashboard overview`
   - `stage-16: add Excel import workflow`
   - `stage-17: add Excel export workflow`
   - `stage-18: add local backup and restore`
   - `stage-19: add data quality checks`
   - `stage-20: finalize testing and documentation`

5. Do not commit secrets, passwords, tokens, local database files, backup files, build outputs, `.dart_tool`, or generated runtime data.

6. Do not change the Git remote URL unless explicitly instructed.

7. If GitHub authentication fails:
   - Stop.
   - Ask the user to authenticate locally.
   - Never ask the user to paste a token into chat.

8. If there are no file changes after a stage:
   - Do not create an empty commit.
   - Report that the working tree is clean.
   - Do not push an empty commit.

9. Do not start the next stage automatically after committing and pushing.

10. At the end of every stage, report:
    - stage name
    - analyze result
    - commit message
    - push result
    - current branch
    - whether the working tree is clean

11. Prefer using the helper script `scripts/stage_finish.ps1` for stage completion when available.

Current GitHub remote repository:
https://github.com/cangyuemazi/jin-xiao-cun-2026.6.30.git
