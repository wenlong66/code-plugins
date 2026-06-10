# code-plugins

个人觉得比较好用的 Claude Code、Codex 插件和技能统一管理收藏。

## 内容

- `ecc/`：按 common、media-ai、seo、social 等场景整理的自定义 agents、commands、skills。
- `plugin-basics/`：日常仓库工作流插件，包含代码库 onboarding、文档查询、ADR、知识管理、会话报告和代码简化等能力。
- `claude-plugin-common/`：Claude Code 常用插件集合，覆盖文档处理、前端设计、MCP 开发、Web 应用测试等场景。
- `claude-plugins-official/`：官方插件市场目录及本地插件副本。
- `superpowers-ext/`：在 superpowers 方法论基础上扩展的工程技能。
- Git submodules：第三方或独立维护的插件、技能、MCP 项目。

## 克隆

```bash
git clone --recurse-submodules <repo-url>
```

如果已经克隆过本仓库：

```bash
git submodule update --init --recursive
```

## 子模块

<!-- AUTO-GENERATED:SUBMODULES -->
| 路径 | 仓库 | 说明 |
|---|---|---|
| `agent-skills` | https://github.com/addyosmani/agent-skills.git | Addy Osmani 的生产级 AI 编码代理工程技能，覆盖 spec、plan、build、test、review、simplify 和 ship 等流程。 |
| `andrej-karpathy-skills` | https://github.com/multica-ai/andrej-karpathy-skills.git | 受 Karpathy 启发的 Claude Code 行为准则，强调先思考、保持简单、精准修改和可验证执行。 |
| `caveman` | https://github.com/JuliusBrussee/caveman.git | 面向 Claude Code、Codex 等代理的“穴居人式”精简表达插件，用更少 token 保持技术准确性。 |
| `claude-code-gs` | https://github.com/wenlong66/claude-code-gs.git | Claude Code 游戏工作室模板，提供面向游戏开发的多 agent、skills、hooks 和项目流程。 |
| `claude-code-novel` | https://github.com/wenlong66/claude-code-novel.git | 基于 Claude Code 的长篇网文创作系统，用于管理角色、伏笔、世界观和章节连续性。 |
| `claude-mem` | https://github.com/thedotmack/claude-mem.git | Claude Code 持久记忆压缩系统，跨会话保存、检索和注入相关开发上下文。 |
| `codegraph` | https://github.com/colbymchenry/codegraph.git | 本地优先的代码语义图与 MCP 工具，为 Claude Code、Codex 等代理提供结构搜索、调用链和影响范围分析。 |
| `godot-mcp-pro` | https://github.com/youichi-uda/godot-mcp-pro.git | Godot 编辑器 MCP 插件，让 AI 助手通过 MCP 连接并操作 Godot 项目。 |
| `gstack` | https://github.com/wenlong66/gstack.git | Garry Tan 的 Claude Code 工程团队技能栈，包含评审、QA、浏览器、发布和安全等工作流。 |
| `hyperframes` | https://github.com/heygen-com/hyperframes.git | 用 HTML、CSS 和可寻址动画生成确定性 MP4 视频的开源框架，内置面向 AI 代理的创作技能。 |
| `superpowers` | https://github.com/obra/superpowers.git | 面向编码代理的软件开发方法论插件，通过组合 skills 规范头脑风暴、计划、TDD、执行和验证流程。 |
| `ui-ux-pro-max-skill` | https://github.com/nextlevelbuilder/ui-ux-pro-max-skill.git | AI UI/UX 设计智能技能，提供设计系统、风格、配色、字体、图表和平台化前端建议。 |
| `unity-mcp` | https://github.com/CoplayDev/unity-mcp.git | MCP for Unity，让 AI 助手通过 MCP 控制 Unity Editor、管理场景资产、脚本和测试。 |
<!-- /AUTO-GENERATED:SUBMODULES -->
