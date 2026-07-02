<p align="center">
  <h1 align="center">JinXiaoCun 2026</h1>
  <p align="center">
    A local-first Windows inventory, order, shipment, finance, and data-quality system for scientific materials.
    <br />
    面向科研材料订单、进销存、发货、费用利润与数据质量检查的 Windows 本地优先桌面软件。
  </p>
</p>

<p align="center">
  <img alt="Flutter" src="https://img.shields.io/badge/Flutter-Windows-02569B?logo=flutter&logoColor=white">
  <img alt="Dart" src="https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white">
  <img alt="SQLite" src="https://img.shields.io/badge/SQLite-local--first-003B57?logo=sqlite&logoColor=white">
  <img alt="Drift" src="https://img.shields.io/badge/Drift-ORM-5C6BC0">
  <img alt="Riverpod" src="https://img.shields.io/badge/Riverpod-state%20management-40BFB4">
  <img alt="Status" src="https://img.shields.io/badge/status-active%20prototype-2E7D32">
</p>

<p align="center">
  <a href="#中文说明">中文</a>
  ·
  <a href="#english">English</a>
  ·
  <a href="#快速开始">快速开始</a>
  ·
  <a href="#architecture">Architecture</a>
  ·
  <a href="#development-boundaries--二次开发边界">Development Boundaries</a>
</p>

---

## 中文说明

**JinXiaoCun 2026** 是一款专门面向科研材料业务的 Windows 本地桌面软件。它覆盖科研材料、合金样品、靶材、金属颗粒、定制加工产品、二次加工产品，以及厂家采购/加工订单场景。

它不是通用 ERP，也不是简单 Excel 替代品。第一版重点是建立一个可维护、可扩展、离线可用的本地业务系统，让未来移动端、云同步、多设备一致性、附件同步和多人协作可以在现有架构上继续演进。

### 核心特性

- **本地优先**：运行时不依赖服务器，业务数据保存在本机 SQLite。
- **科研材料业务建模**：订单、客户、产品、厂家、发货、费用、利润和异常提醒围绕材料订单流程设计。
- **分层架构**：UI、ViewModel、Service、Repository、Database 明确隔离。
- **金额安全**：数据库金额字段统一使用整数分存储，避免浮点误差。
- **软删除与审计**：核心业务数据软删除，关键操作写入 `audit_logs`。
- **Excel 工作流**：支持订单 Excel 导入预览、确认导入和订单导出。
- **本地备份恢复**：支持启动备份、手动备份、备份列表、恢复前保护性备份。
- **数据质量检查**：自动识别未发货、缺销售金额、缺成本、负毛利、重复单号、库存不足等风险。

### 当前状态

| 模块 | 状态 | 说明 |
| --- | --- | --- |
| Windows Flutter 项目 | Done | 当前根目录即项目根目录 |
| 设计系统与通用组件 | Done | `shared/theme`、`shared/widgets`、`shared/layout` |
| SQLite + Drift | Done | 本机应用数据目录保存 `inventory.db` |
| 核心数据库表 | Done | 订单、客户、产品、厂家、发货、库存、费用、日志、字典、附件等 |
| Repository 层 | Done | 基础 list / get / create / update / softDelete / search |
| Service 层 | Done | 金额、状态、导入导出、备份、异常检查、日志 |
| 订单 / 客户 / 产品 / 厂家 | Done | 基础增删改查与详情 |
| 发货与分批发货 | Done | 一单多快递、多产品同快递、分批发货基础流程 |
| 费用与利润 | Done | 订单费用录入、成本利润计算 |
| 首页看板 | Done | 经营概览、待处理事项、异常提醒、最近订单/发货 |
| Excel 导入 / 导出 | Done | 预览、确认导入、导出文件 |
| 本地备份恢复 | Done | 手动备份、启动备份、备份列表和恢复 |
| 自动化测试 | Basic | 数据库初始化和应用启动基础测试 |

### 快速开始

#### 环境要求

- Windows 10 / 11
- Flutter SDK
- Dart SDK 随 Flutter 安装
- Visual Studio Windows desktop build tools
- Windows 开发人员模式，用于 Flutter 插件 symlink 支持

#### 安装依赖

```bash
flutter pub get
```

#### 生成 Drift 代码

```bash
dart run build_runner build --delete-conflicting-outputs
```

#### 静态检查与测试

```bash
flutter analyze
flutter test
```

#### 运行 Windows 桌面端

```bash
flutter run -d windows
```

如果出现 `Building with plugins requires symlink support`，请在 Windows 设置中开启“开发人员模式”。

### 本地数据目录

第一版运行数据不放在源码目录。推荐结构如下：

```text
JinXiaoCun_2026_data/
├─ database/
│  └─ inventory.db
├─ backup/
├─ import/
├─ export/
├─ attachments/
└─ logs/
```

在 Windows 上，该目录通常位于 `%LOCALAPPDATA%` 或应用可访问的用户数据目录下。

### 项目结构

```text
lib/
├─ app/                    应用入口、Provider 组合、桌面工作区
├─ core/                   通用基础能力预留
├─ data/
│  ├─ database/            Drift 数据库、表定义、迁移、路径
│  └─ repositories/        数据访问层
├─ domain/
│  └─ services/            业务规则层
├─ features/               各业务模块
│  ├─ dashboard/
│  ├─ orders/
│  ├─ customers/
│  ├─ products/
│  ├─ suppliers/
│  ├─ shipments/
│  ├─ inventory/
│  ├─ finance/
│  └─ settings/
└─ shared/
   ├─ theme/               颜色、字体、间距、圆角、阴影、ThemeData
   ├─ widgets/             通用组件
   └─ layout/              桌面端布局
```

### 架构原则

```text
UI / Presentation
-> ViewModel / Provider
-> Service
-> Repository
-> Drift / SQLite
```

硬性规则：

- UI 不得直接访问 SQLite、Drift 或 `AppDatabase`。
- UI 不得写 SQL。
- UI 不得计算订单金额、成本、毛利、库存或最终订单状态。
- Repository 只负责数据访问。
- Service 负责业务规则、金额计算、状态判断、导入导出、备份和异常检查。
- ViewModel 负责页面状态。
- 页面优先复用 `shared/widgets`。
- 颜色、字体、圆角、间距、阴影必须来自 `shared/theme`。
- 核心业务数据不得物理删除。
- 核心业务修改应写入 `audit_logs`。

### 数据库约束

- 核心表使用 `uuid` 做业务关联。
- 金额字段使用整数分存储，例如 `250000` 表示 `2500.00` 元。
- 删除核心业务数据时写入 `deleted_at`，不物理删除。
- 核心表预留 `created_at`、`updated_at`、`deleted_at`、`sync_status`、`device_id`、`version`。
- 数据库结构变化必须通过 migration。
- 状态、费用类型、产品类型、客户类型、厂家类型和快递公司通过 `dictionaries` 管理。

### 二次开发边界

如果只重做 UI，允许修改：

```text
lib/features/*/presentation/
lib/features/*/widgets/
lib/shared/theme/
lib/shared/widgets/
lib/shared/layout/
```

禁止为了 UI 重做随意修改：

```text
lib/data/
lib/domain/
lib/data/database/
lib/data/repositories/
lib/domain/services/
```

新增业务模块建议顺序：

1. 先确认数据库结构和 migration。
2. 在 Repository 增加数据访问方法。
3. 在 Service 实现业务规则。
4. 在 ViewModel 组织页面状态。
5. 在 Presentation / Widgets 实现 UI。
6. 运行 `flutter analyze` 和必要测试。

### 文档

- [`PROJECT_RULES.md`](PROJECT_RULES.md)：项目硬性规则
- [`ARCHITECTURE.md`](ARCHITECTURE.md)：分层架构说明
- [`DATABASE_SCHEMA.md`](DATABASE_SCHEMA.md)：数据库规划与实现状态
- [`UI_GUIDE.md`](UI_GUIDE.md)：UI 设计系统与二开边界
- [`DEVELOPMENT_ROADMAP.md`](DEVELOPMENT_ROADMAP.md)：阶段路线与后续建议

### 路线图

- 完善客户、产品、厂家选择器，减少手动 UUID 输入。
- 完善库存入库、出库、盘点和库存流水 UI。
- 完善采购/加工单模块。
- 增强导入导出模板、样例文件和错误报告。
- 增加更多自动化测试和端到端场景测试。
- 准备移动端适配和未来同步协议。

---

## English

**JinXiaoCun 2026** is a local-first Windows desktop application for scientific-material order management, inventory workflows, shipments, finance, profit analysis, backups, Excel import/export, and data-quality checks.

It is not a generic ERP and not a spreadsheet clone. The product is designed for scientific materials, alloy samples, sputtering targets, metal particles, custom processing products, secondary processing products, and supplier/manufacturer workflows.

The first version focuses on a maintainable offline desktop foundation. Future versions may add Android/iOS clients, cloud sync, multi-device consistency, attachment sync, and collaboration without rewriting the core business layers.

### Highlights

- **Local-first by design**: no server dependency in V1; data is stored in local SQLite.
- **Domain-specific workflows**: orders, customers, products, suppliers, shipments, costs, profit, and data-quality warnings for scientific-material businesses.
- **Clean layering**: Presentation, ViewModel, Service, Repository, and Database are separated.
- **Safe money storage**: all persisted money fields use integer cents/fen.
- **Soft delete and audit logs**: core business data is soft-deleted, and critical actions are recorded.
- **Excel workflow**: import preview, confirmed import, and export.
- **Local backup and restore**: manual backups, startup backups, backup list, and safe restore flow.
- **Data-quality checks**: missing shipment, missing sale amount, missing cost, negative profit, duplicate tracking numbers, missing supplier, insufficient inventory, and more.

### Feature Matrix

| Area | Status | Notes |
| --- | --- | --- |
| Flutter Windows project | Done | Root directory is the project root |
| Design system | Done | Theme tokens, shared widgets, desktop shell |
| SQLite + Drift | Done | Local `inventory.db` under the user data directory |
| Core tables | Done | Orders, customers, products, suppliers, shipments, inventory, finance, audit logs, dictionaries |
| Repository layer | Done | Base query/write/search/soft-delete operations |
| Service layer | Done | Business rules, calculations, status refresh, import/export, backup, audit log |
| Orders / Customers / Products / Suppliers | Done | Basic CRUD and detail views |
| Shipments | Done | Multiple shipments per order, multiple items per shipment, split shipment support |
| Finance | Done | Expense entry, cost aggregation, profit calculation |
| Dashboard | Done | Business overview, todos, recent orders/shipments, data-quality warnings |
| Excel import/export | Done | Preview, confirm import, export |
| Backup and restore | Done | Manual backup, launch backup, backup list, restore |
| Tests | Basic | Database initialization and app startup tests |

### Quick Start

#### Requirements

- Windows 10 / 11
- Flutter SDK
- Visual Studio Windows desktop build tools
- Windows Developer Mode enabled for Flutter plugin symlink support

#### Install dependencies

```bash
flutter pub get
```

#### Generate Drift code

```bash
dart run build_runner build --delete-conflicting-outputs
```

#### Analyze and test

```bash
flutter analyze
flutter test
```

#### Run on Windows

```bash
flutter run -d windows
```

If Flutter reports `Building with plugins requires symlink support`, enable Developer Mode in Windows settings.

### Architecture

```text
UI / Presentation
-> ViewModel / Provider
-> Service
-> Repository
-> Drift / SQLite
```

Layer responsibilities:

- **Presentation** renders pages, handles user interaction, and calls ViewModels.
- **ViewModel / Provider** owns loading state, form state, filters, selections, and UI-ready data.
- **Service** owns business rules, calculations, imports, exports, backups, status refresh, data-quality checks, and audit logging.
- **Repository** owns database access only.
- **Database** owns Drift tables, migrations, indexes, and SQLite initialization.

### Development Boundaries / 二次开发边界

UI-only redesigns may modify:

```text
lib/features/*/presentation/
lib/features/*/widgets/
lib/shared/theme/
lib/shared/widgets/
lib/shared/layout/
```

UI-only redesigns should not casually modify:

```text
lib/data/
lib/domain/
lib/data/database/
lib/data/repositories/
lib/domain/services/
```

This boundary keeps future mobile support, cloud sync, and collaboration features feasible without rewriting business logic.

### Database Rules

- Use `uuid` for business relationships.
- Store money as integer cents/fen.
- Soft-delete core business records with `deleted_at`.
- Preserve sync-ready columns: `sync_status`, `device_id`, and `version`.
- Change schema only through migrations.
- Store statuses, fee types, customer types, product types, supplier types, and carriers in dictionaries.

### Common Commands

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter run -d windows
powershell -ExecutionPolicy Bypass -File scripts/stage_finish.ps1 "docs: update README"
```

### Roadmap

- Better customer/product/supplier selectors.
- Full inventory inbound, outbound, stocktaking, and inventory-log UI.
- Purchase and processing order module.
- Stronger Excel templates, examples, and import error reports.
- More automated tests and end-to-end workflows.
- Mobile adaptation and future sync protocol.

---

## Repository Notes

- The current project root is `JinXiaoCun_2026`; do not create a nested folder with the same name.
- Runtime database files, backups, imports, exports, attachments, logs, build outputs, and local caches should not be committed.
- Run `flutter analyze` after every development, maintenance, or documentation task.
