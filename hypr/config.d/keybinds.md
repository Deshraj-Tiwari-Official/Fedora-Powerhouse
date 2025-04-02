>[!NOTE]
>This does not contain simple keybinds for things like hjkl movemements of neovim.

# Hyprland
|Keybind|Action|
|-------|------|
|` + X`|Open Powermenu|
|` + R`|Open Application Menu|
|` + <enter>`|Open Terminal|
|` + Q`|Quit Application|
|` + V`|Toggle Floating|
|` + ALT+L`|Lock|
|` + F11`|Fullscreen|
|` + F12`|Exit Fullscreen|
|` + H`|Focus Left Window|
|` + L`|Focus Right Window|
|` + K`|Focus Up Window|
|` + J`|Focus Down Window|
|` + <num>`|Go to Workspace <num>|
|` + SHIFT+<num>`|Move Window to Workspace|
|` + S`|Toggle Special Workspace|
|` + SHIFT+S`|Move Window to Special Workspace|
|` + E`|Open Emoji Search|
|` + W`|Apply Next Wallpaper|
|` + F1`|Only Copy Screenshot|
|` + ALT+F1`|Copy and Save Screenshot|
|` + mouse_scroll`|Go through Workspaces|
|` + Right_Click_Drag`|Move Window|
|` + Left_Click_Drag`|Resize Window|

# Neovim
| Keybind         | Action                               | Mode  |
|---------------|--------------------------------|------|
| `;`         | Enter command mode             | n |
| `/`         | Enter search mode              | n |
|`󰁮`      | Go to parent directory| n |
| `n`         | Next search result and center  | n |
| `N`         | Previous search result and center | n |
| `K`         | Hover documentation           | n |
| `gd`        | Go to definition               | n |
| `󱁐 + sd` | Go to LSP definition          | n |
| `󱁐 + si` | Go to LSP implementation      | n |
| `󱁐 + sr` | Find LSP references           | n |
| `󱁐 + y` | Yank to system clipboard       | n, v |
| `󱁐 + p` | Paste from system clipboard    | n, v |
| `<A-p>`     | Paste without overwriting clipboard | v |
| `<`         | Indent left                    | v |
| `>`         | Indent right                   | v |
| `<C-Up>`    | Increase window height         | n |
| `<C-Down>`  | Decrease window height         | n |
| `<C-Left>`  | Increase window width          | n |
| `<C-Right>` | Decrease window width          | n |
| `<S-h>`     | Switch to previous buffer      | n |
| `<S-l>`     | Switch to next buffer          | n |
| `󱁐 + gs` | Show Git status               | n |
| `󱁐 + gc` | Show Git commit history       | n |
| `󱁐 + gb` | Show Git branches             | n |
| `󱁐 + lg` | Open LazyGit                   | n |
| `󱁐 + sw` | Grep word under cursor        | n |
| `󱁐 + ps` | Grep with input prompt        | n |
| `󱁐 + pf` | Search project files          | n |
| `<C-P>`     | Search Git-tracked files       | n |
| `󱁐 + ca` | Format file                   | n |
| `󱁐 + s` | Search and replace word under cursor | n |
| `gcc`       | Toggle line comment            | n |
| `gbc`       | Toggle block comment           | n |
| `gc{motion}` | Comment selection (line)      | n |
| `gb{motion}` | Comment selection (block)     | n |
| `gca`       | Add comment above line         | n |
| `gcb`       | Add comment below line         | n |
| `gce`       | Add comment at end of line     | n |
| `<C-n>`     | Move down in completion menu   | i |
| `<C-p>`     | Move up in completion menu     | i |
| `<C-y>`     | Confirm completion selection   | i |
| `<C-e>`     | Cancel completion              | i |
| `<Tab>`     | Expand snippet / next completion | i |
| `<S-Tab>`   | Jump back in snippet / previous completion | i |
| `J`         | Move selected text down        | v |
| `K`         | Move selected text up          | v |
| `<C-u>`     | Scroll up and center           | n |
| `<C-d>`     | Scroll down and center         | n |
| `<A-k>`     | Next quickfix item and center  | n |
| `<A-j>`     | Previous quickfix item and center | n |
| `<C-a>`     | Accept AI suggestion           | i |
| `<C-e>`     | Clear AI suggestion            | i |
| `󱁐 + di` | Show diagnostics (LSP errors) | n |
| `S`         | Flash Treesitter               | n |
| `r`         | Remote Flash                   | n |
| `R`         | Treesitter Search              | n |
| `<C-s>`     | Toggle Flash Search            | n |
| `J`         | Join line without moving cursor | n |

# Tmux
| Keybind     | Action                                     |
|-------------|--------------------------------------------|
| `C-󱁐 + [`   | Enter Selection Mode (Use Vim keybinds)    |
| `C-h`       | Select pane left                           |
| `C-j`       | Select pane down                           |
| `C-k`       | Select pane up                             |
| `C-l`       | Select pane right                          |
| `C-󱁐 + H`   | Resize pane left by 5                      |
| `C-󱁐 + J`   | Resize pane down by 6                      |
| `C-󱁐 + K`   | Resize pane up by 5                        |
| `C-󱁐 + L`   | Resize pane right by 5                     |
| `C-󱁐 + \|`   | Split window horizontally                  |
| `C-󱁐 + _`   | Split window vertically                    |
