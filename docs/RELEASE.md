# Preparare la release Pi V9 — solo 240×240

Questa procedura è destinata al manutentore. La release pubblica non va dichiarata completa prima di avere immagine, firma e chiave pubblica corrette. Non allegare immagini Plus.

## 1. Congelare sorgenti e build

Registrare il commit di questo fork da cui provengono i sorgenti del frontend. La prima build è stata effettuata dalla cartella storica `seedgen-build.*/seedgen-os-v3`: confrontare i quattro moduli e i file inclusi con `raspberry/240x240/` prima di associare la build a questo commit. Non dichiarare una build riproducibile senza confronto bit-per-bit.

Registrare anche i commit effettivi dei repository scaricati in `work/` e l’ambiente Docker. Non cambiare la V9 testata senza ricompilare e riprovare.

## 2. Prova fisica

Verificare sul dispositivo piccolo: avvio e splash, pulsanti, tutte le lunghezze BIP39 e checksum con dati pubblici, tre menu password, ritorno con freccia, quattro lingue, verifica della copia, Power con annullamento e conferma. Registrare esiti e limiti nelle note, senza segreti.

I test host e il test funzionale del manutentore non sono un audit indipendente.

## 3. Preparare gli asset sul Mac

GnuPG deve essere installato. Usare una chiave di firma controllata dal manutentore, già esistente o creata localmente; **non inviare mai la chiave privata**. Il repository non contiene una chiave di firma predisposta.

Dalla radice del clone, eseguire passando il percorso reale dell’immagine testata e il fingerprint completo della propria chiave:

```bash
bash scripts/prepare-release.sh /percorso/seedgen_os.v1.0.2.pi0.v9.img FINGERPRINT_COMPLETO
```

Lo script prepara `dist/pi-v9/`, senza sovrascrivere una cartella già esistente:

- `seedgen_os.v1.0.2.pi0.v9.img`;
- `SHA256SUMS`, con nomi portabili;
- `SHA256SUMS.asc`, firma distaccata del manifest;
- `SEEDGEN-Pi-release-key.asc`, **solo la parte pubblica**;
- `RELEASE-FINGERPRINT.txt`, fingerprint della chiave usata.

Per creare una nuova chiave, usare localmente l’interfaccia interattiva di `gpg --full-generate-key`. Conservare passphrase e backup privato fuori dal repository. L’operazione di firma avviene sul Mac; la chiave privata non serve a chi prepara la documentazione.

## 4. Pubblicazione su GitHub

Nella pagina [nuova release](https://github.com/ilbitcoiner/SeedGen/releases/new) usare un nuovo tag **`pi-v9`** riferito al commit verificato, titolo **SEEDGEN Pi V9 — Raspberry Pi Zero / 240×240**, e le [note predisposte](releases/pi-v9.md). Iniziare come bozza e allegare i cinque asset preparati. Inserire nelle note fingerprint completo, commit sorgente, esiti delle prove e data.

Controllare tutti gli asset, poi pubblicare. Quando gli asset sono effettivamente disponibili aggiornare lo stato nel README. Il tag `v1.0.2` identifica l’upstream: non sostituirlo con l’immagine Raspberry.

Le firme `.asc` vanno caricate come asset, nonostante `.gitignore` escluda le firme locali. Dopo la pubblicazione i file non vanno sostituiti con build diverse: una modifica richiede una nuova versione.
