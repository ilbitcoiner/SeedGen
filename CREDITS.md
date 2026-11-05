# Autori, provenienza e licenze

## Progetto originale

[SeedGen di SatoSats](https://github.com/SatoSats/SeedGen), versione v1.0.2, commit `ad3030c5f05d1f7186d3a005d997e167f063f59a`. La cronologia Git e la licenza MIT originale sono conservate. Il file `raspberry/240x240/vendor/seedgen.py` è una copia invariata del core originale; SHA-256:

```text
a347d11ec5d23dac0799c5d19ef5495d74b744e479eb67e706c0a7ad62c2564b
```

I dizionari BIP39 e Diceware originali sono invariati. `vendor/SHA256SUMS` ne registra gli hash. Il core originale e i launcher CLI alla radice non vanno confusi con l’applicazione LCD.

## Contributo di questo fork

**Andrea (@ilbitcoiner) / Bitvero:** porting sul Raspberry Pi Zero v1.3, interfaccia 240×240, gestione joystick e pulsanti, splash SEEDGEN/by Bitvero, caratteri grandi, menu password, traduzioni IT/EN/FR/ES, navigazione Indietro e Power, test di regressione, preparazione della distribuzione e documentazione. Queste aggiunte usano la licenza MIT in `raspberry/LICENSE`.

Il logo Bitvero viene disegnato dal frontend sulla base del riferimento fornito dal manutentore. L’attribuzione del software non trasferisce diritti sui marchi di terzi e non implica approvazione da parte dei progetti originali.

## Dipendenze

- [SeedSigner OS 0.8.7](https://github.com/SeedSigner/seedsigner-os/tree/0.8.7): Buildroot e sistema di costruzione dell’immagine.
- [SeedSigner 0.8.7](https://github.com/SeedSigner/seedsigner/tree/0.8.7): driver ST7789 e dipendenze hardware. Le licenze restano nei repository scaricati e nella copia dell’applicazione installata dalla build.
- [EFF Dice](https://www.eff.org/dice): dizionario lungo originale e Short Wordlist #1. Il dizionario corto è ancora incluso per compatibilità e self-test, ma non è una voce del menu V9. Attribuzione in `raspberry/240x240/vendor/EFF-ATTRIBUTION.txt`.
- Font DejaVu Sans e DejaVu Sans Bold: licenza in `raspberry/240x240/fonts/LICENSE.txt`.
- Il flusso grafico Password Generator di [3rd Iteration](https://3rditeration.github.io/seedsigner/password_generator.html) è stato un riferimento di interfaccia. Il frontend e i nuovi formati non sono una copia byte-per-byte di quel generatore.

## Chiavi e firme

`docs/upstream/chiave_pubblica_gpg.asc` è la chiave ereditata dal progetto originale: **non certifica le immagini Raspberry di questo fork**. La release Raspberry deve contenere la chiave pubblica del suo manutentore e la firma del relativo manifest SHA-256. La chiave privata resta sul suo computer.
