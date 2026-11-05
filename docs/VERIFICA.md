# Verificare una release Raspberry

Il checksum identifica il file; la firma collega il manifest alla chiave del manutentore. Nessuno dei due dimostra l’assenza di vulnerabilità.

## 1. Chiave e fingerprint

Scaricare dalla stessa release `SEEDGEN-Pi-release-key.asc`, `SHA256SUMS`, `SHA256SUMS.asc` e l’immagine. La chiave originale in `docs/upstream/chiave_pubblica_gpg.asc` appartiene a un’altra distribuzione e non va usata per certificare questa immagine.

Con GnuPG installato:

```bash
gpg --show-keys --with-fingerprint SEEDGEN-Pi-release-key.asc
```

Confrontare il fingerprint **completo** con quello comunicato dal manutentore tramite un canale indipendente e affidabile. Una chiave scaricata insieme al file non autentica da sola l’identità dell’autore.

```bash
gpg --import SEEDGEN-Pi-release-key.asc
gpg --verify SHA256SUMS.asc SHA256SUMS
```

Procedere solo con firma valida e chiave corrispondente al fingerprint atteso. Un avviso sulla fiducia locale della chiave non sostituisce il confronto del fingerprint. In caso di firma non valida o chiave diversa, fermarsi.

## 2. Hash dell’immagine

Nella cartella contenente immagine e manifest, su Mac:

```bash
shasum -a 256 -c SHA256SUMS
```

Su Linux:

```bash
sha256sum -c SHA256SUMS
```

Tutte le righe devono risultare `OK`. Un hash differente richiede un nuovo download e una verifica della provenienza, non l’aggiornamento manuale del checksum.

## Cosa non sono queste firme

Le firme di commit GitHub e i checksum dei sorgenti non sono la firma della SD compilata. Gli hash del core originale, dei font o dei dizionari non devono essere presentati come hash dell’immagine Raspberry. Le firme della release si creano sui file effettivamente distribuiti.
