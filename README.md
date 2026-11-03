# configs

Mis archivos de configuración para macOS (Apple Silicon). Cada archivo vive en este repo y en su ubicación original hay un enlace simbólico que apunta acá.

La config de Neovim partió de [craftzdog/dotfiles-public](https://github.com/craftzdog/dotfiles-public).

## Qué hay

| En el repo | Enlazado desde | Qué es |
|---|---|---|
| `.zshrc`, `.zprofile`, `.zshenv` | `~/` | Shell: zsh + Oh My Zsh + Starship |
| `.config/nvim/` | `~/.config/nvim` | Neovim (LazyVim) |
| `.config/ghostty/config` | `~/.config/ghostty/config` | Terminal Ghostty (fuente) |
| `Library/Application Support/com.mitchellh.ghostty/config` | `~/Library/Application Support/com.mitchellh.ghostty/config` | Ghostty (tema, fuente, atajos) |
| `.config/herdr/config.toml` | `~/.config/herdr/config.toml` | herdr (atajos y tema) |
| `.config/aerospace/` | `~/.config/aerospace` | AeroSpace (ventanas en mosaico) |
| `.config/sketchybar/` | `~/.config/sketchybar` | SketchyBar (barra con workspaces, reloj y batería) |
| `.config/borders/` | `~/.config/borders` | JankyBorders (borde en la ventana activa) |
| `.gitconfig` | `~/.gitconfig` | Git |
| `.gitignore_global` | `~/.gitignore` | Archivos que git ignora en todos los repos |
| `Brewfile` | — | Todo lo instalado con Homebrew |

No están acá: `~/.gitconfig-spacedev` (identidad de trabajo) y la config de Claude Code (vive en el repo `claude-dotfiles`).

## Shell

- **Plugins de Oh My Zsh**: `git`, `zsh-autosuggestions`, `fast-syntax-highlighting`
- **Prompt**: [Starship](https://starship.rs) (configuración por defecto)
- **fzf**: `Ctrl+R` historial · `Ctrl+T` archivos · `Alt+C` carpetas
- **zoxide**: `z <parte-del-nombre>` para saltar a una carpeta
- **Alias**: `ls`/`ll`/`la` → eza · `cat` → bat
- **Node** con nvm · **Java** con `JAVA_HOME` (JDK 17)

Las claves (Anthropic, Obsidian) no están en el repo: `.zshrc` las lee del llavero de macOS.

## Ventanas: AeroSpace

AeroSpace acomoda las ventanas en mosaico, con 5 workspaces. Los atajos salen de la capa **WM** del Kyria: se mantiene el pulgar derecho exterior y la pantallita muestra el mapa. Cada tecla manda Hyper (`Cmd+Opt+Ctrl+Shift`) o Meh (`Opt+Ctrl+Shift`) + una tecla, así que no chocan con Neovim, herdr ni las tildes.

| Capa WM | Hace |
|---|---|
| `Q W E R T` | Ir al workspace 1–5 |
| `A S D F G` | Mandar la ventana al workspace 1–5 |
| `H J K L` | Foco ← ↓ ↑ → (pasa al otro monitor) |
| `Y U I O` | Mover la ventana ← ↓ ↑ → |
| `Z X C V B` | Mosaico · acordeón · flotante · pantalla completa · workspace anterior |
| `N M , .` | Achicar · agrandar · mandar el workspace al otro monitor · resetear el layout |

Monitores fijos: 1 (terminal) y 2 (navegador) en el monitor externo; 3, 4 y 5 en la pantalla de la Mac. Sin monitor externo, todo va a la Mac.

El keymap del Kyria vive en `~/Proyects/keyboard/firmware/rev4_layout`.

## Instalar en una Mac nueva

1. **Homebrew** y lo que está en el `Brewfile`:
   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   eval "$(/opt/homebrew/bin/brew shellenv)"
   git clone <este-repo> ~/Proyects/configs
   brew bundle --file=~/Proyects/configs/Brewfile
   ```

2. **Oh My Zsh** y sus plugins:
   ```sh
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
   git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
   git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
   ```

3. **nvm** ([instrucciones](https://github.com/nvm-sh/nvm#installing-and-updating)), **Rust** ([rustup](https://rustup.rs), `.zshenv` carga `~/.cargo/env`; para Neovim: `rustup component add rust-analyzer`) y **Java 17**: `brew install --cask temurin@17`

4. **Enlaces** (el instalador de Oh My Zsh crea un `~/.zshrc` que hay que borrar antes):
   ```sh
   C=~/Proyects/configs
   rm -f ~/.zshrc
   ln -s $C/.zshrc ~/.zshrc
   ln -s $C/.zprofile ~/.zprofile
   ln -s $C/.zshenv ~/.zshenv
   ln -s $C/.gitconfig ~/.gitconfig
   ln -s $C/.gitignore_global ~/.gitignore
   mkdir -p ~/.config/ghostty ~/.config/herdr "$HOME/Library/Application Support/com.mitchellh.ghostty"
   ln -s $C/.config/nvim ~/.config/nvim
   ln -s $C/.config/ghostty/config ~/.config/ghostty/config
   ln -s "$C/Library/Application Support/com.mitchellh.ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
   ln -s $C/.config/herdr/config.toml ~/.config/herdr/config.toml
   ln -s $C/.config/aerospace ~/.config/aerospace
   ln -s $C/.config/sketchybar ~/.config/sketchybar
   ln -s $C/.config/borders ~/.config/borders
   ```

5. **Claves en el llavero** (cada comando pide el valor):
   ```sh
   security add-generic-password -a "$USER" -s anthropic-api-key -w
   security add-generic-password -a "$USER" -s obsidian-api-key -w
   security add-generic-password -a "$USER" -s obsidian-api-key-onsend-vault -w
   ```

6. **Ventanas**:
   - Abrir AeroSpace y darle permiso en *Ajustes del Sistema → Privacidad y seguridad → Accesibilidad*. Arranca solo al iniciar sesión.
   - Barra y bordes: `brew services start sketchybar && brew services start borders`
   - Ajustes de macOS:
     ```sh
     defaults write com.apple.dock expose-group-apps -bool true && killall Dock   # Mission Control agrupa por app
     defaults write -g NSWindowShouldDragOnGesture -bool true                    # mover ventanas con Ctrl+Cmd+arrastrar
     defaults write com.apple.spaces spans-displays -bool true                   # un solo Space para los dos monitores (hay que cerrar sesión)
     ```
   - Ocultar la barra de menú: *Ajustes del Sistema → Centro de control → Ocultar automáticamente la barra de menú → Siempre*.

## Mantenimiento

- Después de instalar o desinstalar algo con brew: `brew bundle dump --file=Brewfile --force`
