# Verifica statica dell’immagine Pi V9 — 240×240

Immagine ricevuta dal manutentore il 5 novembre 2026, dopo la sua approvazione funzionale della V9 sul dispositivo piccolo. Questo rapporto non è una firma né un audit di sicurezza.

- File: `seedgen_os.v1.0.2.pi0.v9.img`
- Dimensione: **134217728 byte (128 MiB)**.
- SHA-256: `f96cbb535cb990fa5c973234c2a7ed9f975a860ee5a75212219d82bff2231e45`.
- Commit di riferimento del frontend: `031df5148318c7e0ae30f88c301e07fa111e2c8a`.
- MBR leggibile, partizione attiva a settore 2048, 260096 settori. Il tipo MBR è 0x0c; il filesystem effettivo prodotto da mkfs.fat è FAT16, letto correttamente durante l’ispezione.
- Kernel `zImage` presente e decomprimibile, initramfs leggibile.
- Marker interno: `SEEDGEN_PI_V9_MARKER`, `SeedGen=v1.0.2`, `SeedSignerOS=0.8.7`, `Board=pi0`.

## Corrispondenza dei file

Confronto byte-per-byte riuscito tra initramfs e `raspberry/240x240/` al commit indicato:

- `main.py`, `i18n.py`, `ui_views.py`, `password_tools.py`;
- core `seedgen.py`, dizionari BIP39/Diceware/EFF corto e attribuzioni incluse;
- font DejaVu Sans/Bold e relativa licenza.

Gli hash per file sono in [IMAGE-FILES.json](IMAGE-FILES.json). Il cache bytecode CPython 3.12 incluso per il core è stato confrontato con il sorgente compilato, normalizzando soltanto il nome del percorso: il codice coincide.

## Limiti e stato

La verifica è statica: non è stato avviato qui un Raspberry e non sono stati confrontati tutti i file del sistema operativo o ricostruite tutte le dipendenze. Non dimostra riproducibilità bit-per-bit né assenza di vulnerabilità.

Il manifest [SHA256SUMS](SHA256SUMS) descrive esattamente l’immagine ricevuta. Il 5 novembre 2026 la firma distaccata [SHA256SUMS.asc](SHA256SUMS.asc) è stata verificata con GnuPG in un keyring temporaneo, ottenendo GOODSIG e VALIDSIG per il fingerprint `04E489B5747151B692A54AD62A776C850F91B398`, corrispondente a quello mostrato dal manutentore sul suo Mac. Il checksum dell’immagine è stato ricontrollato e coincide. La [chiave pubblica](SEEDGEN-Pi-release-key.asc) è disponibile; la chiave privata non è stata condivisa. I quattro asset sono stati pubblicati nella [release Pi V9](https://github.com/ilbitcoiner/SeedGen/releases/tag/pi-v9). Dimensioni e digest SHA-256 forniti dall’API GitHub corrispondono ai file immagine, manifest, firma e chiave pubblica verificati; non è stato necessario riscaricare il binario. La verifica crittografica non attesta l’affidabilità del software.
