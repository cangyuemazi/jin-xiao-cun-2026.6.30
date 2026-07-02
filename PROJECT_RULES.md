# 项目硬性规则

本文件是 JinXiaoCun_2026 项目的最高优先级工程约束。后续所有代码修改前必须先阅读并遵守本文件。

## 根目录规则

- 当前工作目录 `JinXiaoCun_2026` 就是项目根目录。
- 禁止在当前目录下再次创建同名 `JinXiaoCun_2026` 子目录。
- 不得删除用户已有文件。
- 每个阶段只实现该阶段目标，不提前开发后续业务功能。

## 分层规则

- UI 层不得直接访问 SQLite。
- UI 层不得直接写 SQL。
- UI 层不得直接计算订单金额、成本、毛利、库存。
- 所有数据库访问必须通过 Repository。
- 所有业务规则必须放在 Service。
- 页面状态通过 ViewModel / Provider 管理。
- 所有页面优先使用 `shared/widgets` 的通用组件。
- 颜色、字体、圆角、间距不得在页面中随意硬编码，必须使用 `shared/theme`。

## 数据规则

- 核心业务数据删除必须软删除。
- 核心业务修改必须写入 `audit_logs`。
- 数据库结构变更必须通过 migration。
- 金额字段必须用整数“分”存储。
- 所有核心表必须有 `uuid`。
- 所有核心表必须预留 `created_at`、`updated_at`、`deleted_at`、`sync_status`、`device_id`、`version`。
- 第一版不实现云同步，但必须为未来同步做好结构准备。

## 禁止事项

- 禁止把 UI、业务逻辑、数据库查询写在同一个文件里。
- 禁止 UI 直接访问 SQLite。
- 禁止 UI 直接写 SQL。
- 禁止 UI 直接计算毛利、库存、订单状态。
- 禁止金额使用 `double` 直接存储。
- 禁止核心业务数据物理删除。
- 禁止硬编码订单状态、费用类型、产品类型。
- 禁止随意修改数据库结构而不写 migration。
- 禁止为了快速实现而破坏分层架构。

## 第 20 阶段后的维护基线

- 新增页面时，页面只允许调用 ViewModel / Provider。
- 新增业务动作时，优先放入 `lib/domain/services/`。
- 新增数据库查询时，优先放入 `lib/data/repositories/`。
- 新增状态、类型、费用、快递公司等枚举类数据时，优先使用 `dictionaries`，不得在 UI 中写死文案来源。
- UI 可以根据状态 code 做视觉 tone 映射，但展示文案应优先来自 Service / ViewModel 提供的字典 label。
- 只做 UI 重做时，允许修改 `lib/features/*/presentation/`、`lib/features/*/widgets/`、`lib/shared/theme/`、`lib/shared/widgets/`、`lib/shared/layout/`。
- 只做 UI 重做时，禁止随意修改 `lib/data/`、`lib/domain/`、`lib/data/database/`、`lib/data/repositories/`、`lib/domain/services/`。
- 每次完成阶段、修复、重构或维护任务后必须运行 `flutter analyze`，通过后再提交。
