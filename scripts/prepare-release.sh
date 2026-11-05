#!/usr/bin/env bash
# Prepare only the small-display image. Signing stays on the maintainer's machine.
set -euo pipefail
if [ "$#" -ne 2 ]; then
  echo 'Uso: bash scripts/prepare-release.sh /percorso/seedgen_os.v1.0.2.pi0.v9.img FINGERPRINT_COMPLETO' >&2
  exit 2
fi
image_path="$1"
fingerprint="$(printf '%s' "$2" | tr '[:lower:]' '[:upper:]')"
case "$fingerprint" in *[!0-9A-F]*|'') echo 'Fingerprint non valido: usare solo le cifre esadecimali complete, senza spazi.' >&2; exit 2;; esac
if [ "${#fingerprint}" -ne 40 ] && [ "${#fingerprint}" -ne 64 ]; then
  echo 'Usare il fingerprint completo della chiave, non un ID breve.' >&2; exit 2
fi
expected_name='seedgen_os.v1.0.2.pi0.v9.img'
if [ ! -f "$image_path" ] || [ "$(basename "$image_path")" != "$expected_name" ]; then
  echo "Serve l'immagine V9 per lo schermo piccolo: $expected_name" >&2
  exit 2
fi
image_bytes="$(wc -c < "$image_path" | tr -d '[:space:]')"
if [ "$image_bytes" != 134217728 ]; then
  echo 'Dimensione inattesa: la build V9 di questo profilo produce 128 MiB. Controllare il file.' >&2
  exit 2
fi
command -v gpg >/dev/null
command -v shasum >/dev/null
# Require the exact primary fingerprint, not an ambiguous selector.
actual_fingerprint="$(gpg --batch --with-colons --fingerprint --list-secret-keys "$fingerprint" | awk -F: '$1=="fpr" {print $10; exit}')"
if [ "$actual_fingerprint" != "$fingerprint" ]; then
  echo 'La chiave privata corrispondente non è disponibile con questo fingerprint.' >&2
  exit 2
fi
repo_root="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$repo_root/dist"
release_dir="$repo_root/dist/pi-v9"
# Atomic mkdir refuses to overwrite an existing prepared release.
mkdir "$release_dir"
cp "$image_path" "$release_dir/$expected_name"
(
  cd "$release_dir"
  shasum -a 256 "$expected_name" > SHA256SUMS
  gpg --armor --local-user "$fingerprint" --output SHA256SUMS.asc --detach-sign SHA256SUMS
  gpg --armor --export "$fingerprint" > SEEDGEN-Pi-release-key.asc
  test -s SEEDGEN-Pi-release-key.asc
  printf '%s\n' "$fingerprint" > RELEASE-FINGERPRINT.txt
  gpg --verify SHA256SUMS.asc SHA256SUMS
  shasum -a 256 -c SHA256SUMS
)
printf 'Asset preparati: %s\n' "$release_dir"
printf 'Controllare fingerprint e prove hardware prima di pubblicare. Nessuna release è stata caricata.\n'
