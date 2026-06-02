# claude-plugins-official

Claude Code 官方插件市场目录，包含官方维护和精选的 Claude Code 插件。本目录同时保留了若干本地插件副本，便于统一收藏、查看和二次整理。

## 插件市场配置

- Marketplace 配置：[.claude-plugin/marketplace.json](.claude-plugin/marketplace.json)
- Marketplace 名称：`claude-plugins-official`
- 本地插件入口：当前目录下的各插件子目录

## 本地插件

<!-- AUTO-GENERATED:LOCAL-PLUGINS -->
| 插件 | 类别 | 说明 | 主要内容 |
|---|---|---|---|
| `code-modernization` | development | 结构化遗留系统现代化流程，覆盖评估、拓扑映射、业务规则提取、重构规划、转换和安全加固。 | 7 个 commands、5 个 agents |
| `feature-dev` | development | 面向新功能开发的 7 阶段工作流，包含需求澄清、代码探索、架构设计、实现和质量审查。 | 1 个 command、3 个 agents |
| `ralph-loop` | development | Ralph Wiggum 式自引用迭代循环，通过 Stop hook 让 Claude 持续执行同一个任务直到完成。 | 3 个 commands、1 个 Stop hook、1 个 setup script |
| `security-guidance` | security | Claude 生成代码的安全审查插件，包含模式提醒、Stop diff LLM 审查和提交级 agentic 安全审查。 | hooks 安全审查系统 |
<!-- /AUTO-GENERATED:LOCAL-PLUGINS -->

## 使用方式

在 Claude Code 中按插件名安装，例如：

```bash
/plugin install security-guidance@claude-plugins-official
```

本地收藏用途下，也可以直接进入对应子目录查看 README、commands、agents、hooks 或 scripts。
