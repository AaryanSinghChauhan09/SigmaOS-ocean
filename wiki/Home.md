# SigmaOS-sigmaos-ocean

SigmaOS integration component for **Ocean theme**.

## Commands

```bash
sigmaos-sigmaos-ocean install   # install package + deploy defaults
sigmaos-sigmaos-ocean deploy    # copy config templates to $HOME
sigmaos-sigmaos-ocean status    # binary/package/config report
sigmaos-sigmaos-ocean reset     # remove deployed config
sigmaos-sigmaos-ocean open      # launch the application
```

## Design

- Shell-based component manager (Omarchy-style per-app repos)
- Secure defaults; no secrets stored
- Deterministic `test.sh` with isolated `$HOME`
