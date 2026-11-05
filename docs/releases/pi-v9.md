# SEEDGEN Pi V9 — Raspberry Pi Zero / 240×240

Versione per Raspberry Pi Zero originale v1.3 ARMv6 e Waveshare ST7789 240×240. **SeedSigner Plus / 320×240 escluso.**

Fork di SatoSats/SeedGen, core v1.0.2 invariato. Porting e interfaccia di Andrea (@ilbitcoiner) / Bitvero. Questa è la prima distribuzione Raspberry di questo fork; V9 indica l’iterazione del porting.

## Funzioni

Seed BIP39 12–24 parole, Custom, Diceware classico e Diceware BIP39, soltanto da dadi fisici. Interfaccia con caratteri grandi, splash by Bitvero, Indietro selezionabile, Power con conferma e lingue IT/EN/FR/ES. I dizionari restano inglesi; la lingua torna italiano al riavvio.

## Asset richiesti prima della pubblicazione

- `seedgen_os.v1.0.2.pi0.v9.img`
- `SHA256SUMS`
- `SHA256SUMS.asc`
- `SEEDGEN-Pi-release-key.asc`
- `RELEASE-FINGERPRINT.txt`

Il manutentore deve inserire qui **fingerprint completo**, **commit sorgente**, **commit delle dipendenze effettive**, **data ed esito delle prove hardware** prima di pubblicare. Questa nota è un modello e non afferma che gli asset siano già disponibili.

Verificare firma e checksum seguendo [la guida](https://github.com/ilbitcoiner/SeedGen/blob/main/docs/VERIFICA.md), poi usare l’immagine personalizzata in Raspberry Pi Imager senza personalizzazioni. La scrittura cancella la SD selezionata. Gli archivi automatici “Source code” non sono immagini avviabili.

## Verifiche e limiti

48 test host coprono core, password, navigazione e traduzioni. La V9 è stata approvata funzionalmente dal manutentore sul dispositivo piccolo; non è dichiarato un audit indipendente. La forza nominale assume dadi equi e indipendenti e il filtro diagnostico non certifica l’entropia. CPython non garantisce la cancellazione della RAM. SEEDGEN non è un wallet e non firma transazioni.
