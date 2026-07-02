# JinXiaoCun 2026

JinXiaoCun 2026 是一款面向 Windows 本地使用的科研材料订单进销存软件。它不是通用 ERP，也不是简单 Excel 替代品，而是围绕科研材料、合金样品、靶材、金属颗粒、定制加工产品、二次加工产品以及厂家采购/加工流程设计的本地优先桌面系统。

第一版目标是离线可用、无需服务器、数据保存在本机 SQLite，并支持订单、客户、产品、厂家、发货、费用、利润、Excel 导入导出、本地备份恢复和异常提醒。

## 技术栈

- Flutter / Dart
- Windows desktop
- SQLite
- Drift
- Riverpod
- 分层架构 / Clean Architecture 思路
- Excel 读写、文件选择、本地路径、本地日志和备份

## 如何运行

首次拉取项目后执行：

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter run -d windows
```

Windows 运行 Flutter 插件时需要系统开启开发人员模式，否则可能出现 symlink support 报错。可在 Windows 设置中开启“开发人员模式”。

## 项目目录说明

```text
lib/
├─ app/                    应用入口、Provider 组合和桌面工作区
├─ core/                   通用基础能力预留
├─ data/
│  ├─ database/            Drift 数据库、表定义、迁移和数据库路径
│  └─ repositories/        数据访问层，只封装查询、写入、软删除
├─ domain/
│  └─ services/            业务规则层，金额、状态、导入导出、备份、异常检查
├─ features/               各业务模块 UI、ViewModel 和局部组件
└─ shared/
   ├─ theme/               颜色、字体、间距、圆角、阴影、ThemeData
   ├─ widgets/             通用按钮、表格、卡片、弹窗、状态标签等
   └─ layout/              Windows 桌面外壳、侧边导航、顶部栏
```

## 数据库说明

数据库使用 Drift + SQLite，数据库文件默认位于本机应用数据目录，不放在源码目录。

核心原则：

- 核心表使用 `uuid` 做业务关联，不能依赖本地自增 ID。
- 金额字段用整数“分”存储，例如 `250000` 表示 `2500.00` 元。
- 核心业务数据删除使用软删除，即写入 `deleted_at`。
- 核心表预留 `created_at`、`updated_at`、`deleted_at`、`sync_status`、`device_id`、`version`。
- 数据库结构变化必须通过 migration。
- 状态、费用类型、客户类型、产品类型、厂家类型、快递公司等通过 `dictionaries` 初始化和读取。

## 已实现功能

- Flutter Windows 项目和标准目录结构。
- 统一 UI theme、通用组件和桌面布局。
- Drift SQLite 数据库基础、核心表和迁移机制。
- Repository 层基础 CRUD、搜索和软删除。
- Service 层基础业务能力、金额计算、状态刷新、日志、字典。
- 订单、客户、产品、厂家、发货、费用利润、首页看板。
- Excel 导入预览和确认导入流程。
- Excel 导出流程。
- 本地备份、备份列表和恢复流程。
- 异常提醒和数据质量检查。

## 开发规则

依赖方向必须保持：

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
- Repository 只负责数据访问，不写复杂业务规则。
- Service 负责业务规则、金额计算、状态判断、导入导出、备份和异常检查。
- ViewModel 负责页面状态。
- 页面优先复用 `shared/widgets`。
- 颜色、字体、圆角、间距、阴影必须来自 `shared/theme`。
- 核心业务数据不得物理删除。
- 核心业务修改应写入 `audit_logs`。

## UI 二次开发

如果后续只想重做 UI，允许修改：

```text
lib/features/*/presentation/
lib/features/*/widgets/
lib/shared/theme/
lib/shared/widgets/
lib/shared/layout/
```

禁止为了 UI 重做而随意修改：

```text
lib/data/
lib/domain/
lib/data/database/
lib/data/repositories/
lib/domain/services/
```

UI 重做时应继续通过 ViewModel 获取状态，通过 Service 触发业务动作，不要把数据库访问或业务计算塞回页面。

## 业务模块二次开发

新增或扩展业务模块时建议按这个顺序：

1. 先确认数据表是否已有字段，必要时设计 migration。
2. 在 Repository 中补充基础查询或写入方法。
3. 在 Service 中实现业务规则。
4. 在 ViewModel 中组织页面状态。
5. 在 Presentation 和 Widgets 中实现 UI。
6. 运行 `flutter analyze`，必要时补充测试。

如果要新增订单状态、费用类型、产品类型或厂家类型，优先扩展字典初始化或字典管理能力，不要在 UI 中硬编码。

## 注意事项

- 当前项目根目录就是 `JinXiaoCun_2026`，不要再创建同名子目录。
- Windows 运行插件需要开发人员模式。
- 本地数据库、备份文件、导入导出文件和构建产物不应提交到 Git。
- 修改数据库表结构后需要运行 build_runner 重新生成 Drift 代码。
- 每个阶段或维护任务完成后必须运行 `flutter analyze`，通过后再提交和推送。

## 常用命令

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter run -d windows
powershell -ExecutionPolicy Bypass -File scripts/stage_finish.ps1 "stage-xx: message"
```
