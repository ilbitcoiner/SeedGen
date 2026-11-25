# SEEDGEN per Raspberry Pi — by Bitvero

Generatore di seed BIP39 e password da **soli dadi fisici D6**, con interfaccia per Raspberry Pi Zero e schermo 240×240.

Questo repository è un fork di [SatoSats/SeedGen](https://github.com/SatoSats/SeedGen). Il progetto originale e la sua cronologia sono conservati. Il porting Raspberry, l’interfaccia e le estensioni sono il contributo di **Andrea (@ilbitcoiner) / Bitvero**. Non è una release ufficiale di SeedSigner o del progetto originale.

## Versioni

**SEEDGEN Pi V9.3** è la release corrente per Raspberry Pi Zero con display 240×240, basata sul core SeedGen **v1.0.2**.

- [Release Pi V9.3 — Interfaccia semplificata](https://github.com/ilbitcoiner/SeedGen/releases/tag/pi-v9.3)
- [Sorgenti e istruzioni di compilazione](https://github.com/ilbitcoiner/SeedGen/tree/pi-v9.3/raspberry/README.md) · [Rapporto dei test](https://github.com/ilbitcoiner/SeedGen/tree/pi-v9.3/raspberry/240x240/REPORT_TEST.txt) · [PR #1](https://github.com/SatoSats/SeedGen/pull/1)
- [Release precedente Pi V9.1](https://github.com/ilbitcoiner/SeedGen/releases/tag/pi-v9.1) · [Release Pi V9](https://github.com/ilbitcoiner/SeedGen/releases/tag/pi-v9)

La versione di sviluppo aggiunge il cursore persistente dei dadi e i suggerimenti sopra la tastiera. [Guida aggiornata](raspberry/README.md).

### Download Pi V9.3

- [Immagine SD — 128 MiB](https://github.com/ilbitcoiner/SeedGen/releases/download/pi-v9.3/seedgen-pi-v9.3.img)
- [Checksum SHA256SUMS](https://github.com/ilbitcoiner/SeedGen/releases/download/pi-v9.3/SHA256SUMS)
- [Firma SHA256SUMS.asc](https://github.com/ilbitcoiner/SeedGen/releases/download/pi-v9.3/SHA256SUMS.asc)
- [Chiave pubblica del manutentore](https://github.com/ilbitcoiner/SeedGen/releases/download/pi-v9.3/SEEDGEN-Pi-release-key.asc)

Fingerprint GPG di Pi V9.3 `3F4E3C778F5D63EC1B0985F85823FC25A5186930`. Prima di scrivere la SD, [verificare fingerprint, firma e checksum](docs/VERIFICA.md).


## Hardware

| Componente | Profilo di questa versione |
|---|---|
| Scheda | Raspberry Pi Zero originale v1.3, ARMv6 |
| Schermo | Waveshare 1,3" ST7789, 240×240 |
| Comandi | Joystick a cinque direzioni e KEY1 / KEY2 / KEY3 |
| Supporto | microSD dedicata |

Non usare questa immagine come profilo per Pi Zero 2 W, Pi 4/5, Luckfox o SeedSigner Plus. [Piedinatura](docs/HARDWARE.md).

## Cosa offre

- **Seed BIP39:** 12, 15, 18, 21 o 24 parole, con controllo checksum e verifica della trascrizione.
- **Passphrase:** accesso diretto a Diceware classico da 6 a 9 parole, con tastiera a schermo per l’inserimento.
- **Verifica:** inserimento e controllo di una mnemonic BIP39.
- **Strumenti:** integrità, Audit Mode, test pulsanti, lingua e spegnimento.
- Interfaccia con caratteri grandi, riquadri blu, selezione arancione e avvio **SEEDGEN — by Bitvero**.
- Freccia Indietro selezionabile con il joystick. Il menu Power offre Restart e Power off con conferma.
- Italiano, inglese, francese e spagnolo per l’interfaccia. La lingua torna italiano al riavvio; le wordlist restano inglesi.

## Iniziare

Per installare [Pi V9.3](https://github.com/ilbitcoiner/SeedGen/releases/tag/pi-v9.3) seguire questi passaggi.

1. Scaricare immagine, `SHA256SUMS`, `SHA256SUMS.asc` e chiave pubblica dalla stessa release.
2. [Verificare firma, fingerprint e checksum](docs/VERIFICA.md).
3. Scrivere l’immagine su una microSD dedicata con Raspberry Pi Imager, senza personalizzazioni, e attendere la verifica.
4. Inserire la SD nel Raspberry spento e collegare l’alimentazione alla porta **PWR IN**.

La scrittura cancella il contenuto della SD scelta. Non serve installare Raspberry Pi OS prima.

## Sorgenti e test

Il frontend usato sul dispositivo è in [`raspberry/240x240/`](https://github.com/ilbitcoiner/SeedGen/tree/pi-v9.3/raspberry/240x240/). Il core originale congelato, i dizionari e le attribuzioni sono in `vendor/`. I file storici alla radice appartengono alla versione CLI/Linux originale: non installano l’immagine Raspberry.

```bash
python3 -m venv .venv
. .venv/bin/activate
python3 -m pip install -r requirements-dev.txt
cd raspberry/240x240
python3 -m unittest -v test_ui test_passwords test_navigation
```

58 test host sul ramo di sviluppo coprono il core, i formati, la navigazione e le traduzioni. Non sostituiscono le prove su Raspberry né un audit. [Dettagli](docs/TEST.md).

## Limiti da conoscere

SEEDGEN non conserva fondi, non deriva indirizzi e non firma transazioni. L’entropia primaria proviene dai lanci inseriti: niente camera, RNG di sistema o BIP85 nel percorso di generazione.

Il frontend blocca generazione e verifica se rileva swap attiva o interfacce di rete non-loopback amministrativamente attive. È un controllo passivo, non una garanzia di isolamento del sistema operativo. CPython non garantisce la cancellazione sicura dei segreti dalla RAM.

La forza nominale assume dadi equi e lanci indipendenti. Il filtro diagnostico sulla distribuzione dei lanci non misura né certifica l’entropia e condiziona l’insieme dei blocchi accettati. Nessun audit indipendente viene dichiarato. [Sicurezza e limiti](SECURITY.md).

## Crediti e licenze

- **SatoSats:** autore di SeedGen, core v1.0.2 e logica originale BIP39/Diceware; licenza MIT conservata.
- **Andrea / @ilbitcoiner — Bitvero:** porting Raspberry, interfaccia, navigazione, lingue, branding, integrazione password e distribuzione di questo fork.
- **SeedSigner:** sistema di build e driver della versione 0.8.7, con le rispettive licenze.
- **EFF:** dizionari Diceware; **DejaVu:** font inclusi con licenza.

[Crediti completi](CREDITS.md) · [Licenza originale](LICENSE) · [Licenza delle aggiunte](raspberry/LICENSE) · [Documentazione originale conservata](docs/upstream/README.md).
