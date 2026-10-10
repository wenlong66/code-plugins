# code-plugins

个人觉得比较好用的 Claude Code、Codex 插件、技能及配套工具统一管理收藏。

## 内容

- `ecc/`：按 common、media-ai、seo、social 等场景整理的自定义 agents、commands、skills。
- `plugin-basics/`：日常仓库工作流插件，包含代码库 onboarding、文档查询、ADR、知识管理、会话报告和代码简化等能力。
- `claude-plugin-common/`：Claude Code 常用插件集合，覆盖文档处理、前端设计、MCP 开发、Web 应用测试等场景。
- `claude-plugins-official/`：官方插件市场目录及本地插件副本。
- `superpowers-ext/`：在 superpowers 方法论基础上扩展的工程技能。
- Git submodules：第三方或独立维护的插件、技能、MCP 项目和 Python 工具。

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
| `agent-skills` | https://github.com/wenlong66/agent-skills.git | Addy Osmani 的生产级 AI 编码代理工程技能，覆盖 spec、plan、build、test、review、simplify 和 ship 等流程。 |
| `andrej-karpathy-skills` | https://github.com/multica-ai/andrej-karpathy-skills.git | 受 Karpathy 启发的 Claude Code 行为准则，强调先思考、保持简单、精准修改和可验证执行。 |
| `caveman` | https://github.com/JuliusBrussee/caveman.git | 面向 Claude Code、Codex 等代理的“穴居人式”精简表达插件，用更少 token 保持技术准确性。 |
| `chrome-devtools-mcp` | https://github.com/ChromeDevTools/chrome-devtools-mcp | 通过 MCP 让代理控制 Chrome，检查控制台、网络请求和性能 trace，适合浏览器调试与性能分析。 |
| `claude-code-gs` | https://github.com/wenlong66/claude-code-gs.git | Claude Code 游戏工作室模板，提供面向游戏开发的多 agent、skills、hooks 和项目流程。 |
| `claude-code-novel` | https://github.com/wenlong66/claude-code-novel.git | 基于 Claude Code 的长篇网文创作系统，用于管理角色、伏笔、世界观和章节连续性。 |
| `claude-mem` | https://github.com/wenlong66/claude-mem.git | Claude Code 持久记忆压缩系统，跨会话保存、检索和注入相关开发上下文。 |
| `codegraph` | https://github.com/colbymchenry/codegraph.git | 本地优先的代码语义图与 MCP 工具，为 Claude Code、Codex 等代理提供结构搜索、调用链和影响范围分析。 |
| `godot-mcp` | https://github.com/Coding-Solo/godot-mcp.git | Godot 引擎 MCP 服务器，让 AI 代理启动编辑器、运行项目、捕获调试输出并控制 Godot 项目执行。 |
| `gstack` | https://github.com/wenlong66/gstack.git | Garry Tan 的 Claude Code 工程团队技能栈，包含评审、QA、浏览器、发布和安全等工作流。 |
| `hyperframes` | https://github.com/heygen-com/hyperframes.git | 用 HTML、CSS 和可寻址动画生成确定性 MP4 视频的开源框架，内置面向 AI 代理的创作技能。 |
| `impeccable` | https://github.com/wenlong66/impeccable.git | 面向 AI 编码代理的前端设计技能，提供设计审查、润色、可访问性检查和反模式检测等命令。 |
| `markitdown` | https://github.com/microsoft/markitdown.git | 微软维护的文档转 Markdown Python 工具，支持 PDF、Word、Excel、PowerPoint、HTML 等格式，便于生成适合 LLM 阅读的文本。 |
| `matt-plus` | https://github.com/wenlong66/matt-plus.git | Matt Pocock 相关 Claude Code/Codex 技能的扩展与补充。 |
| `mattpocock-skills` | https://github.com/wenlong66/mattpocock-skills.git | Matt Pocock 的真实工程 AI 代理技能，覆盖 grilling、spec/ticket 流程、TDD、代码评审、领域建模和架构改进。 |
| `playwright-cli` | https://github.com/microsoft/playwright-cli | 微软维护的浏览器自动化 CLI，可配合 Skills 完成页面操作、截图和测试，适合编码代理的命令行工作流。 |
| `ponytail` | https://github.com/wenlong66/ponytail.git | 面向 AI 代理的极简工程技能，强调复用现有代码、标准库和平台能力，只写任务真正需要的最小实现。 |
| `security-audit-skill` | https://github.com/cloudflare/security-audit-skill.git | Cloudflare 的安全审计技能，覆盖架构侦察、漏洞挖掘、候选验证、独立复核和结构化报告。 |
| `superpowers` | https://github.com/wenlong66/superpowers.git | 面向编码代理的软件开发方法论插件，通过组合 skills 规范头脑风暴、计划、TDD、执行和验证流程。 |
| `ui-ux-pro-max-skill` | https://github.com/nextlevelbuilder/ui-ux-pro-max-skill.git | AI UI/UX 设计智能技能，提供设计系统、风格、配色、字体、图表和平台化前端建议。 |
| `unity-mcp` | https://github.com/CoplayDev/unity-mcp.git | MCP for Unity，让 AI 助手通过 MCP 控制 Unity Editor、管理场景资产、脚本和测试。 |
| `vercel-skills` | https://github.com/wenlong66/vercel-skills.git | 面向 Vercel 项目的 AI 代理技能集合，覆盖部署、React/Next 最佳实践、Web 设计审查与文档写作规范。 |
<!-- /AUTO-GENERATED:SUBMODULES -->

## 快速启动

### Chrome DevTools MCP

Requirements：Node.js LTS、npm 和当前稳定版或更新的 Google Chrome。

#### Claude Code

两种接入方式择一使用，避免重复注册同一个 MCP 服务。

**方式一：仅安装 MCP**

在终端执行以下命令，通过 `npx` 按需下载并启动 npm 包，无需全局安装或克隆源码。`--scope user` 表示所有项目均可使用：

```bash
claude mcp add --transport stdio --scope user chrome-devtools -- npx -y chrome-devtools-mcp@latest
```

重新启动 Claude Code，在会话中用 `/mcp` 检查服务连接。

**方式二：安装插件（MCP + Skills）**

如果之前单独注册过 Chrome DevTools MCP，先移除原注册及对应配置，避免与插件重复。对于上面注册到用户范围的服务，可在终端执行：

```bash
claude mcp remove --scope user chrome-devtools
```

随后在 Claude Code 会话中执行：

```text
/plugin marketplace add ChromeDevTools/chrome-devtools-mcp
/plugin install chrome-devtools-mcp@chrome-devtools-plugins
```

重启 Claude Code，使 MCP 和 Skills 加载，并用 `/mcp`、`/skills` 检查。插件安装由 Claude Code 管理，可能会拉取上游仓库；如果不希望克隆源码，使用方式一。遇到 `Failed to clone repository` 时，可查看下方故障排查文档，或改用方式一。

#### Codex

**通过 CLI 注册**：在终端执行：

```bash
codex mcp add chrome-devtools -- npx -y chrome-devtools-mcp@latest
```

也可以手动将以下配置合并到 [Codex 用户配置（~/.codex/config.toml）](https://developers.openai.com/codex/mcp/#configure-with-the-cli) 中；如果已有同名配置，修改原条目，不要重复添加：

```toml
[mcp_servers.chrome-devtools]
command = "npx"
args = ["-y", "chrome-devtools-mcp@latest"]
```

**Windows 11**：按上游示例，将同一条目替换为通过 `cmd /c` 启动，并补充 Chrome 所需的环境变量、将启动超时延长到 20 秒：

```toml
[mcp_servers.chrome-devtools]
command = "cmd"
args = ["/c", "npx", "-y", "chrome-devtools-mcp@latest"]
env = { SystemRoot = "C:\\Windows", PROGRAMFILES = "C:\\Program Files" }
startup_timeout_ms = 20_000
```

环境变量路径应与本机实际安装位置一致。保存后重新启动 Codex，使配置生效。

#### 验证与隐私

注册后让代理执行以下任务验证接入；浏览器会在首次调用需要浏览器的工具时自动启动：

```text
Check the performance of https://developers.chrome.com
```

服务默认启用使用统计，性能工具也可能向 Google CrUX API 发送 trace 中的 URL。需要关闭时，在 `npx` 启动命令末尾添加 `--no-usage-statistics --no-performance-crux`，或将这两个参数追加到配置的 `args` 数组中。客户端可以读取和修改所连接浏览器中的内容，避免使用含敏感数据的个人浏览器会话。

其他客户端及更多配置见 [官方客户端配置](https://github.com/ChromeDevTools/chrome-devtools-mcp/blob/main/docs/client-configurations.md) 和 [故障排查](https://github.com/ChromeDevTools/chrome-devtools-mcp/blob/main/docs/troubleshooting.md)。

### Codegraph

```bash
npx @colbymchenry/codegraph
codegraph upgrade

cd your-project
codegraph init -i
```

### MarkItDown

[MarkItDown](https://github.com/microsoft/markitdown) 是微软维护的 Python 文档转 Markdown 工具，可将 PDF、Word、Excel、PowerPoint、HTML 等内容转换为适合 LLM 阅读的文本。它不是 Skill 或 Claude Code 插件：本仓库通过 [markitdown/](markitdown/) 子模块收藏源码，克隆或更新子模块不会自动安装 Python 包，也不需要通过插件市场安装。

**安装 CLI**：当前上游要求 Python 3.10–3.14，建议在已激活的虚拟环境中安装：

```bash
python -m pip install 'markitdown[all]'
markitdown --help
```

`[all]` 安装所有格式的可选 Python 依赖；只处理常见办公文档时，可改用 `python -m pip install 'markitdown[pdf,docx,pptx,xlsx]'`。扫描件 OCR、图像描述和云端转换可能需要额外插件、模型或服务配置，不能仅靠 `[all]` 完成。

**使用**：

```bash
markitdown path-to-file.pdf -o document.md
```

随后让 Claude Code 或 Codex 读取生成的 `document.md` 即可，无需 MCP。如果需要开发或使用本仓库固定的源码版本，可从本仓库根目录执行以下命令，替代上面的 PyPI 安装：

```bash
python -m pip install -e './markitdown/packages/markitdown[all]'
```

**可选 MCP**：需要代理直接调用转换工具时，另行安装官方 `markitdown-mcp` 包：

```bash
python -m pip install markitdown-mcp
markitdown-mcp
```

在 MCP 客户端中将 `markitdown-mcp` 配置为 stdio 启动命令；若使用虚拟环境，应填写该环境内可执行文件的绝对路径。服务提供 `convert_to_markdown(uri)`，支持 `file:`、`http:`、`https:` 和 `data:` URI。详细配置见 [官方 MCP 文档](https://github.com/microsoft/markitdown/tree/main/packages/markitdown-mcp)。

仅转换可信文件或 URL；MCP 服务可读取运行用户有权限访问的文件和网络资源，不要向公网开放。使用外部模型或云服务前，确认文档允许发送给相应服务。

### Playwright CLI

Requirements：Node.js 18+。它是 CLI 工具，不是 [Playwright MCP](https://github.com/microsoft/playwright-mcp)，不需要配置 MCP 服务器。

**安装 CLI**：

```bash
npm install -g @playwright/cli@latest
playwright-cli --help
```

**可选 Skills**：在希望代理使用该工具的目标项目目录中执行：

```bash
playwright-cli install --skills
```

不安装 Skills 也可以让代理先读取 `playwright-cli --help`，再执行浏览器操作。

**使用**：默认无头运行；需要查看浏览器窗口时加 `--headed`：

```bash
playwright-cli open https://example.com --headed
playwright-cli snapshot
playwright-cli screenshot
playwright-cli close
```

点击、填写等操作可使用 `snapshot` 输出中的元素 ref；例如 `playwright-cli click e15`，其中 `e15` 必须替换为当前页面实际的 ref。截图、网络日志及保存的浏览器状态可能包含敏感信息，分享前应检查内容。

会话管理、测试生成和更多命令见 [官方文档](https://github.com/microsoft/playwright-cli#readme)。

### Unity MCP

Requirements：Unity 2021.3 LTS → 6.x，Python 3.10+（通过 uv）。支持任意 MCP client，包括 Claude Desktop & Code、Cursor、VS Code、Windsurf、Cline、Gemini CLI 等。

安装：Unity → Package Manager → Add from git URL：

```text
https://github.com/CoplayDev/unity-mcp.git?path=/MCPForUnity#main
```

如果需要固定版本，可以将 `#main` 改为对应 tag，例如 `#v10.0.0`；也可以使用 OpenUPM：

```bash
openupm add com.coplaydev.unity-mcp
```

配置：Unity 菜单中打开 Window → MCP for Unity → Configure All Detected Clients。

示例提示词：

```text
Create a cube at the origin and add a Rigidbody.
```

