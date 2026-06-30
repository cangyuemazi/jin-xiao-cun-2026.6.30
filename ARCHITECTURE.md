# 项目架构

本项目采用分层架构，并遵循 Clean Architecture 思路。目标是让 UI、业务规则、数据访问和数据库实现相互隔离，便于未来扩展到移动端、云同步和多人协作。

## 分层结构

```text
UI 界面层
↓
ViewModel / Provider 状态管理层
↓
Service 业务逻辑层
↓
Repository 数据访问层
↓
Database SQLite / Drift 层
```

## UI 界面层

职责：

- 展示页面和组件。
- 接收用户输入。
- 调用 ViewModel / Provider 暴露的状态和动作。
- 使用 `shared/widgets` 中的通用组件。
- 使用 `shared/theme` 中的颜色、字体、间距、圆角等设计系统。

禁止：

- 禁止直接访问 SQLite。
- 禁止直接写 SQL。
- 禁止直接调用 Drift database。
- 禁止直接计算订单金额、成本、毛利、库存、订单状态。
- 禁止绕过 ViewModel / Provider 直接调用 Repository。

## ViewModel / Provider 层

职责：

- 管理页面状态。
- 管理加载、保存、错误、筛选、分页和选中项。
- 调用 Service 层完成业务动作。
- 将 Service 返回的数据转换为页面可展示状态。

禁止：

- 禁止直接写 SQL。
- 禁止承载复杂业务规则。
- 禁止直接修改数据库表。

## Service 层

职责：

- 承载业务规则。
- 创建、更新和校验订单。
- 计算销售额、成本、毛利、毛利率。
- 判断发货状态、库存扣减、异常提醒。
- 处理 Excel 导入清洗、导出、本地备份和操作日志。
- 组合多个 Repository 完成业务流程。

禁止：

- 禁止依赖 UI 组件。
- 禁止返回 UI 控件或页面对象。
- 禁止把数据库表结构暴露给 UI 层。

## Repository 层

职责：

- 封装数据库访问。
- 提供面向业务的查询和写入方法。
- 屏蔽 Drift 和 SQLite 细节。
- 负责软删除、基础查询和必要的数据转换。

禁止：

- 禁止包含页面展示逻辑。
- 禁止包含复杂业务规则。
- 禁止让 UI 层直接依赖 Repository。

## Database 层

职责：

- 定义 Drift tables。
- 管理 SQLite 连接。
- 管理数据库 migration。
- 定义索引、约束和基础查询。
- 初始化字典和基础数据。

禁止：

- 禁止包含 UI 逻辑。
- 禁止包含页面状态。
- 禁止在无 migration 的情况下随意变更表结构。

## 依赖方向

依赖只能从上层流向下层：

```text
UI -> ViewModel / Provider -> Service -> Repository -> Database
```

下层不得反向依赖上层。业务能力应优先放在 Service 层，数据库访问必须通过 Repository 层。
