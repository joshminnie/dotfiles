# dotfiles

## Install Developer Tools

## Commands

| Command         | Description |
| :-------------- | :---------- |
| `make git`      | Configures git with my preferred defaults |
| `make shell`    | |
| `make homebrew` | Installs Homebrew and the libraries, applications, and extensions selected by the base `Brewfile`. |
| `make ruby`     | |
| `make vscode`   | |

## Machine-Specific Homebrew Packages

The local zsh plugin exports `HOMEBREW_COMPANY` from `COMPANY` (`DELUXE` or
`HOME`). Homebrew filters its environment, so the Brewfile must use the
`HOMEBREW_`-prefixed variable instead of `COMPANY`.

Open a new terminal after changing the plugin, or select a profile explicitly:

```sh
HOMEBREW_COMPANY=DELUXE make homebrew
HOMEBREW_COMPANY=HOME make homebrew
```

Without `HOMEBREW_COMPANY`, only the shared packages are selected.
