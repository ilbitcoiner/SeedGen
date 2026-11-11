# Changelog del fork Raspberry

## Pi V9.1 — release firmata per 240×240

[Download e allegati di verifica](https://github.com/ilbitcoiner/SeedGen/releases/tag/pi-v9.1) · [Note della release](docs/releases/pi-v9.1.md)

- La verifica della copia convalida il checksum BIP39 delle parole reinserite.
- Dopo il logo di avvio e i controlli, si apre la home.
- Il riquadro Passphrase apre Tipo passphrase. Power offre Restart e Power off con conferma.
- Logo Bitvero in basso nelle schermate con spazio dedicato.
- [56 test host e risultati delle prove fisiche](raspberry/240x240/REPORT_TEST.txt).

## Pi V9 — pubblicata il 5 novembre 2026, solo 240×240

- Porting su Raspberry Pi Zero originale v1.3 con Waveshare ST7789 240×240.
- Splash SEEDGEN/by Bitvero, caratteri grandi e menu a riquadri.
- Menu Password limitato a Custom, Diceware classico, Diceware BIP39; soltanto dadi fisici.
- Freccia Indietro selezionabile tramite joystick nei sottomenu e flussi.
- Power in alto a destra nella home con conferma esplicita.
- Interfaccia italiano/inglese/francese/spagnolo; lingua solo in RAM, wordlist inglesi invariate.
- Core SeedGen v1.0.2 e dizionari originali invariati; controlli passivi rete/swap e test di regressione.
- Documentazione del porting, build, installazione, verifica e procedura di firma.

[Release binaria Pi V9](https://github.com/ilbitcoiner/SeedGen/releases/tag/pi-v9) pubblicata con immagine testata, manifest, firma e chiave pubblica. Dimensioni e digest SHA-256 dei quattro asset pubblicati corrispondono ai file verificati. Il profilo Plus non è incluso.

La cronologia originale è conservata in [docs/upstream/CHANGELOG.md](docs/upstream/CHANGELOG.md) e nella storia Git.
