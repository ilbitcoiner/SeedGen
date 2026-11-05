# SEEDGEN per Raspberry Pi — by Bitvero

Generatore di seed BIP39 e password da **soli dadi fisici D6**, con interfaccia per Raspberry Pi Zero e schermo 240×240.

Questo repository è un fork di [SatoSats/SeedGen](https://github.com/SatoSats/SeedGen). Il progetto originale e la sua cronologia sono conservati. Il porting Raspberry, l’interfaccia e le estensioni sono il contributo di **Andrea (@ilbitcoiner) / Bitvero**. Non è una release ufficiale di SeedSigner o del progetto originale.

## Versione corrente

**SEEDGEN Pi V9**, basata sul core SeedGen **v1.0.2**. V9 è la versione selezionata dopo le prove funzionali del manutentore; non indica un audit di sicurezza indipendente.

La distribuzione di questo fork riguarda **esclusivamente lo schermo piccolo 240×240**. SeedSigner Plus / 320×240 non fa parte della release.

**Stato della release:** i sorgenti sono disponibili. L’immagine compilata sul Mac del manutentore, i checksum e la sua firma devono ancora essere caricati. Finché non sono presenti gli asset nella pagina Releases, non esiste un download dell’immagine pronto all’uso.

[Release e download](https://github.com/ilbitcoiner/SeedGen/releases) · [Installazione](docs/INSTALLAZIONE.md) · [Uso](docs/USO.md) · [Compilazione](BUILD.md) · [Verifica e firme](docs/VERIFICA.md)

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
- **Password:** soltanto Custom, Diceware classico (6–9 parole) e Diceware BIP39.
- **Verifica:** inserimento e controllo di una mnemonic BIP39.
- **Strumenti:** integrità, Audit Mode, test pulsanti, lingua e spegnimento.
- Interfaccia con caratteri grandi, riquadri blu, selezione arancione e avvio **SEEDGEN — by Bitvero**.
- Freccia Indietro selezionabile con il joystick e Power in alto a destra, con conferma.
- Italiano, inglese, francese e spagnolo per l’interfaccia. La lingua torna italiano al riavvio; le wordlist restano inglesi.

**Diceware BIP39 genera una password con parole BIP39, non una mnemonic wallet.** Per una mnemonic usare Seed BIP39.

## Iniziare

Quando la release sarà completa:

1. Scaricare immagine, `SHA256SUMS`, `SHA256SUMS.asc` e chiave pubblica dalla stessa release.
2. [Verificare firma, fingerprint e checksum](docs/VERIFICA.md).
3. Scrivere l’immagine su una microSD dedicata con Raspberry Pi Imager, senza personalizzazioni, e attendere la verifica.
4. Inserire la SD nel Raspberry spento e collegare l’alimentazione alla porta **PWR IN**.

La scrittura cancella il contenuto della SD scelta. Non serve installare Raspberry Pi OS prima.

## Sorgenti e test

Il frontend usato sul dispositivo è in [`raspberry/240x240/`](raspberry/240x240/). Il core originale congelato, i dizionari e le attribuzioni sono in `vendor/`. I file storici alla radice appartengono alla versione CLI/Linux originale: non installano l’immagine Raspberry.

```bash
python3 -m venv .venv
. .venv/bin/activate
python3 -m pip install -r requirements-dev.txt
cd raspberry/240x240
python3 -m unittest -v test_ui test_passwords test_navigation
```

48 test host coprono il core, i formati, la navigazione e le traduzioni. Non sostituiscono le prove su Raspberry né un audit. [Dettagli](docs/TEST.md).

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
