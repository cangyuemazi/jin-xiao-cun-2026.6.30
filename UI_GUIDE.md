# UI 设计指南

本文件约束 JinXiaoCun_2026 的界面风格、布局方式和组件使用原则。

## 风格关键词

- 简洁。
- 高级。
- 现代。
- 克制。
- 清晰。
- 留白。
- 低饱和。
- 卡片化。
- 状态标签。
- 表格高级感。
- 信息密度适中。

## 参考方向

- Notion 的简洁。
- Linear 的高级感。
- 飞书后台的清晰。
- 现代 SaaS 管理后台。
- Raycast 的精致感。

## 布局原则

第一版 Windows 桌面端采用：

```text
左侧导航栏 + 顶部工具栏 + 中间内容区
```

界面应适合长期录单、查询、对账和发货管理，避免老旧 ERP 风格。

## 设计系统

必须建立统一设计系统：

- 颜色系统。
- 字体系统。
- 间距系统。
- 圆角系统。
- 阴影系统。
- 按钮组件。
- 输入框组件。
- 表格组件。
- 卡片组件。
- 弹窗组件。
- 状态标签组件。
- 空状态组件。
- 确认弹窗组件。

页面中不得随意硬编码颜色、字体、圆角、间距。通用样式必须放在 `shared/theme`，通用组件必须放在 `shared/widgets`。

## 页面规则

- 页面优先组合通用组件，而不是重复写局部样式。
- 表格需要保持清晰、稳定、可扫描。
- 状态应使用统一状态标签表达。
- 表单输入应清晰标注字段含义和错误状态。
- 弹窗用于确认、编辑和关键操作，不用于承载复杂页面。
- 页面信息密度应适中，避免大面积空洞或过度拥挤。

## 后续 UI 可替换范围

后期 UI 重构应优先修改：

```text
lib/features/*/presentation/
lib/features/*/widgets/
lib/shared/theme/
lib/shared/widgets/
lib/shared/layout/
```

不得为了 UI 调整随意修改：

```text
lib/data/
lib/domain/
lib/core/backup/
lib/core/logger/
lib/data/database/
lib/data/repositories/
lib/domain/services/
```

## 第 20 阶段 UI 基线

当前界面基线：

- 桌面端采用左侧导航、顶部工具栏、中间内容区。
- 页面主体使用 `SectionHeader`、`AppCard`、`AppTable`、`StatusBadge`、`AppButton`、`AppTextField` 等通用组件。
- 颜色使用 `AppColors`。
- 字体使用 `AppTextStyles` 或 Flutter Theme 中由 `AppTheme` 统一生成的样式。
- 间距使用 `AppSpacing`。
- 圆角使用 `AppRadius`。
- 阴影使用 `AppShadows`。

后续 UI 优化建议：

- 优先优化 `shared/theme`，再让各页面自然继承。
- 优先增强 `shared/widgets`，不要在页面中重复写局部组件。
- 状态标签展示文案应优先来自字典 label，页面可以仅根据状态 code 选择视觉 tone。
- 表格列宽、空状态、筛选提示和危险操作确认应保持各模块一致。
- 不要为了页面方便直接读取数据库或计算业务结果。
