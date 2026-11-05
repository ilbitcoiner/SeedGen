# Installare la versione 240×240

## Download

Aprire [Releases](https://github.com/ilbitcoiner/SeedGen/releases). Cercare la release **SEEDGEN Pi V9 — 240×240** e gli asset:

- `seedgen_os.v1.0.2.pi0.v9.img`;
- `SHA256SUMS` e `SHA256SUMS.asc`;
- `SEEDGEN-Pi-release-key.asc`; il fingerprint completo è pubblicato nelle note della release e nel repository.

La release Pi V9 è pubblicata con questi quattro asset. Gli archivi automatici GitHub “Source code” contengono sorgenti, non la SD pronta. Non usare vecchi binari Linux x86_64 ereditati dall’upstream sul Raspberry.

## Verifica e scrittura

1. [Verificare firma e checksum](VERIFICA.md) prima di scrivere la SD.
2. Collegare una microSD dedicata al computer.
3. Aprire Raspberry Pi Imager e scegliere il dispositivo Raspberry Pi Zero.
4. In OS selezionare **Usa immagine personalizzata** e aprire il file `.img` verificato.
5. Selezionare la microSD corretta. **Tutti i dati di quella scheda saranno cancellati.**
6. Saltare le personalizzazioni: niente Wi-Fi, SSH, utente o password di Raspberry Pi OS.
7. Avviare la scrittura e attendere anche la verifica. Dopo l’espulsione rimuovere la SD.

## Primo avvio

Con Raspberry spento, inserire la SD e collegare l’alimentazione alla porta **PWR IN**. Il dispositivo mostra SEEDGEN/by Bitvero, esegue i controlli iniziali e apre la home.

Provare prima menu, pulsanti, Indietro e spegnimento con dati pubblici di prova. Il superamento dei self-test non equivale a un audit. Per spegnere, selezionare Power e confermare; scollegare l’alimentazione solo dopo l’arresto.

Questa immagine è per Pi Zero originale v1.3 e Waveshare 240×240. Il profilo Plus è escluso. [Hardware e pin](HARDWARE.md) · [Comandi e funzioni](USO.md).
