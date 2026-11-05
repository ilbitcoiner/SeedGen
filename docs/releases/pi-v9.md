# SEEDGEN Pi V9 — Raspberry Pi Zero / 240×240

Versione per Raspberry Pi Zero originale v1.3 ARMv6 con Waveshare ST7789 240×240, joystick e tre tasti. **SeedSigner Plus / 320×240 escluso.**

Fork di [SatoSats/SeedGen](https://github.com/SatoSats/SeedGen), con core v1.0.2 invariato. Porting, interfaccia e distribuzione di Andrea (@ilbitcoiner) / Bitvero. V9 identifica l’iterazione del porting Raspberry.

## Funzioni

Seed BIP39 da 12 a 24 parole; password Custom, Diceware classico e Diceware BIP39, soltanto da dadi fisici D6. Caratteri grandi, splash SEEDGEN/by Bitvero, Indietro selezionabile con joystick, Power con conferma e interfaccia IT/EN/FR/ES. Le wordlist restano inglesi; la lingua torna italiano al riavvio. Diceware BIP39 è una password, non una mnemonic con checksum.

## Download e verifica

Allegare a questa release i seguenti asset:

- `seedgen_os.v1.0.2.pi0.v9.img`
- `SHA256SUMS`
- `SHA256SUMS.asc`
- `SEEDGEN-Pi-release-key.asc`
- `RELEASE-FINGERPRINT.txt`

Immagine: **134217728 byte (128 MiB)**.

SHA-256:

```text
f96cbb535cb990fa5c973234c2a7ed9f975a860ee5a75212219d82bff2231e45
```

Chiave Ed25519: **Bitvero - SEEDGEN (ilbitcoiner)**. Fingerprint completo:

```text
04E489B5747151B692A54AD62A776C850F91B398
```

Firma creata sul Mac del manutentore e verificata con esito GOODSIG/VALIDSIG il 5 novembre 2026; hash dell’immagine corrispondente al manifest firmato. Confrontare il fingerprint anche tramite un canale indipendente del manutentore.

```bash
gpg --show-keys --with-fingerprint SEEDGEN-Pi-release-key.asc
gpg --import SEEDGEN-Pi-release-key.asc
gpg --verify SHA256SUMS.asc SHA256SUMS
shasum -a 256 -c SHA256SUMS
```

Su Linux è disponibile anche `sha256sum -c SHA256SUMS`. [Guida completa](https://github.com/ilbitcoiner/SeedGen/blob/main/docs/VERIFICA.md).

## Installazione

Usare l’immagine personalizzata in Raspberry Pi Imager, senza personalizzazioni, e attendere la verifica della scrittura. La SD selezionata viene cancellata. Inserirla nel Raspberry spento e alimentare dalla porta PWR IN. Gli archivi automatici “Source code” non sono immagini avviabili.

## Provenienza e verifiche

I quattro moduli frontend, il core, i dizionari e i font estratti dall’immagine coincidono con i sorgenti del commit `031df5148318c7e0ae30f88c301e07fa111e2c8a`. Marker: SEEDGEN_PI_V9_MARKER; versioni dichiarate nella build: SeedGen v1.0.2, SeedSigner OS 0.8.7, pi0. I commit effettivi di tutte le dipendenze della build storica non sono stati acquisiti: non viene dichiarata riproducibilità bit-per-bit.

48 test host superati. Il manutentore ha provato e approvato funzionalmente la V9 sullo schermo piccolo. La verifica statica non equivale a una nuova prova fisica di tutte le funzioni. [Rapporto](https://github.com/ilbitcoiner/SeedGen/blob/main/docs/releases/pi-v9/IMAGE-VERIFICATION.md).

## Limiti

Non viene dichiarato un audit indipendente. La forza nominale assume dadi equi e indipendenti; il filtro diagnostico non certifica l’entropia. CPython non garantisce cancellazione sicura della RAM. SEEDGEN non è un wallet e non firma transazioni.

Licenze e attribuzioni di SatoSats, SeedSigner, EFF e DejaVu sono conservate. [Crediti](https://github.com/ilbitcoiner/SeedGen/blob/main/CREDITS.md).
