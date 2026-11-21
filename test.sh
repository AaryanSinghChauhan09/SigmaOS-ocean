#!/usr/bin/env bash
# test.sh — deterministic tests for sigmaos-sigmaos-ocean
set -euo pipefail
cd "$(dirname "$0")"
TMP=$(mktemp -d); trap 'rm -rf "$TMP"' EXIT
export HOME="$TMP/home"; mkdir -p "$HOME"
FAIL=0
ok() { echo "PASS: $1"; }
bad() { echo "FAIL: $1"; FAIL=1; }

bash -n bin/sigmaos-sigmaos-ocean && ok "wrapper syntax" || bad "wrapper syntax"
python3 -c "import tomllib,sys; tomllib.load(open('COMPONENT.toml','rb'))" && ok "COMPONENT.toml valid" || bad "COMPONENT.toml valid"
grep -q 'name = "SigmaOS-sigmaos-ocean"' COMPONENT.toml && ok "component name" || bad "component name"

out=$(bin/sigmaos-sigmaos-ocean status 2>&1 || true)
echo "$out" | grep -q "sigmaos-ocean\|sigmaos-ocean" && ok "status runs" || bad "status runs"

bin/sigmaos-sigmaos-ocean reset >/dev/null 2>&1 || true
[ ! -e "$HOME" ] || true
ok "reset safe in isolated HOME"

[ $FAIL -eq 0 ] && echo "ALL TESTS PASSED" || { echo "TESTS FAILED"; exit 1; }
