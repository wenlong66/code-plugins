# claude-plugin-common

Claude Code 常用插件集合，集中收纳通用 skills、commands 和 agents，适合日常文档处理、前端设计、MCP 开发、CLAUDE.md 维护、Web 应用测试和会话报告等场景。

## 插件配置

- Marketplace 配置：[.claude-plugin/marketplace.json](.claude-plugin/marketplace.json)
- 插件配置：[.claude-plugin/plugin.json](.claude-plugin/plugin.json)
- 插件入口：当前目录 `./`

## 内容

<!-- AUTO-GENERATED:PLUGIN-CONTENTS -->
### Skills

| 名称 | 说明 |
|---|---|
| `canvas-design` | 创建静态视觉设计、海报、艺术图和可导出的 PNG/PDF 设计稿。 |
| `claude-md-improver` | 审计并改进仓库中的 CLAUDE.md，优化项目记忆和协作说明。 |
| `doc-coauthoring` | 结构化协作文档工作流，用于提案、技术规格、决策文档等。 |
| `docx` | 创建、读取、编辑和处理 Word `.docx` 文档。 |
| `frontend-design` | 创建高质量、非模板化的前端页面、组件和 Web UI。 |
| `mcp-builder` | 指导构建高质量 MCP 服务器和工具接口。 |
| `pdf` | 读取、创建、合并、拆分、旋转、加水印、填表和 OCR PDF。 |
| `playground` | 创建可交互的单文件 HTML playground，用控件探索并复制提示词。 |
| `pptx` | 创建、读取、编辑和处理 PowerPoint `.pptx` 演示文稿。 |
| `session-report` | 从 Claude Code transcript 生成 token、cache、subagent、skill 使用报告。 |
| `skill-creator` | 创建、改进、打包和评估 Claude Code skills。 |
| `webapp-testing` | 使用 Playwright 交互和测试本地 Web 应用。 |
| `xlsx` | 读取、编辑、清理、创建和转换电子表格文件。 |

### Commands

| 命令 | 说明 |
|---|---|
| `/code-review` | 使用多 agent 工作流审查 GitHub PR。 |
| `/revise-claude-md` | 根据当前会话学习更新 CLAUDE.md 或本地 Claude 说明。 |

### Agents

| Agent | 说明 |
|---|---|
| `code-simplifier` | 在保持行为不变的前提下简化和整理最近修改过的代码。 |
<!-- /AUTO-GENERATED:PLUGIN-CONTENTS -->
