# SigmaOS-ocean

SigmaOS integration component for **Ocean theme**.

## Commands

```bash
sigmaos-ocean install   # install package + deploy defaults
sigmaos-ocean deploy    # copy config templates to $HOME
sigmaos-ocean status    # binary/package/config report
sigmaos-ocean reset     # remove deployed config
sigmaos-ocean open      # launch the application
```

## Design

- Shell-based component manager (Omarchy-style per-app repos)
- Secure defaults; no secrets stored
- Deterministic `test.sh` with isolated `$HOME`
