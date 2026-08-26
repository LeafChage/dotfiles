# Claude

## symlink
```bash
$ ln -s ~/dotfiles/claude ~/.claude

# the real CLAUDE.md is in the obsidian vault, you should create symlink to load
$ ln -s {obsidian_vault}/_claude-memory/global-instructions ~/.claude/local/global-instructions.md

```

#### For Windows
```powershell
$ New-Item -ItemType SymbolicLink -Path "C:\Users\%UserName%\.claude" -Value "C:\Users\%username%\dotfiles\claude"
```



