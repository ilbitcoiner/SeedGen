# SEEDGEN Pi V9.1

Immagine per Raspberry Pi Zero v1.3 con display ST7789 240×240. L’aggiornamento aggiunge il controllo finale del checksum BIP39 nella verifica della copia, il menu Power con Restart e Power off, la voce Passphrase e il logo Bitvero nei menu.

## Build e verifica

- [Sorgenti del frontend e della build](https://github.com/ilbitcoiner/SeedGen/tree/51d33e3e1f3b5bf4bed39e61859bffc1fba0559e/raspberry/240x240)
- Immagine `seedgen_os.v1.0.2.pi0.v9.img`, 128 MiB
- SHA-256 `b7406c0cffeefc9ebf46d9533197af4f302977a05eec1dcfb4f5b7d57da4db3b`
- Fingerprint della chiave GPG per `pi-v9.1` `667AAA68AD2D90BBFC682D7E3A5AAF7EB3389C20`

Il log del Mac registra il completamento della build. La verifica ha confermato la firma di `SHA256SUMS` e la corrispondenza del checksum dell’immagine. I quattro moduli del frontend, il core, i tre dizionari, i due font e i file di licenza e attribuzione estratti dall’immagine coincidono byte per byte con il commit sorgente. I 56 test host sono passati sul commit della PR. Il rapporto distingue i test host dalle prove sul dispositivo eseguite sulle revisioni precedenti.

Scaricare l’immagine, `SHA256SUMS`, `SHA256SUMS.asc` e `SEEDGEN-Pi-release-key.asc` dalla stessa release. Confrontare il fingerprint, verificare firma e checksum, poi scrivere l’immagine su microSD con Raspberry Pi Imager. [Guida di verifica](https://github.com/ilbitcoiner/SeedGen/blob/main/docs/VERIFICA.md) · [Rapporto dei test](https://github.com/ilbitcoiner/SeedGen/blob/51d33e3e1f3b5bf4bed39e61859bffc1fba0559e/raspberry/240x240/REPORT_TEST.txt)
