# Compilare SEEDGEN Pi V9 (240×240)

Questo documento riguarda il fork Raspberry. La guida CLI/Linux originale è in [docs/upstream/BUILD.md](docs/upstream/BUILD.md).

## Requisiti

Git, Docker con Compose e `shasum`. Su Mac: Docker Desktop avviato, Terminale e connessione Internet stabile. Su Apple silicon lo script usa `linux/amd64`; la compilazione emulata può richiedere diverse ore. Non c’è una stima affidabile valida per ogni computer. Lasciare spazio libero sufficiente per Buildroot e Docker; lo script non ripulisce automaticamente il disco del computer.

## Da un clone nuovo

```bash
git clone https://github.com/ilbitcoiner/SeedGen.git
cd SeedGen/raspberry/240x240
caffeinate -i bash build-v9.sh
```

Su Linux sostituire l’ultima riga con `bash build-v9.sh`. È necessario partire dalla cartella `raspberry/240x240`: lo script usa la directory corrente come base.

Lo script scarica SeedGen v1.0.2, SeedSigner OS 0.8.7 e SeedSigner 0.8.7, verifica il core vendorizzato, prepara l’overlay con frontend/font/dizionari, porta l’immagine a 128 MiB e avvia Buildroot con `--pi0 --skip-repo`.

L’applicazione nella SD viene installata in `/opt/src/`; il suo entrypoint è il `main.py` di questo profilo. Il repository SeedSigner scaricato serve per dipendenze e driver; il menu avviato è quello di SEEDGEN.

## Risultato

Attendere **`[8/8] DONE`** e l’uscita del contenitore con codice 0. Solo allora utilizzare:

```text
raspberry/240x240/images/seedgen_os.v1.0.2.pi0.v9.img
```

`images/SHA256SUMS-v9` è il checksum locale della build; può contenere un percorso assoluto. Per la release si prepara un manifest portabile con soli nomi di file, come descritto in [RELEASE.md](docs/RELEASE.md).

## Ripetere una build

Non avviare due build nella stessa cartella. Docker viene ricreato e lo script upstream può cancellare `/output`: anche un nuovo tentativo può ricompilare tutto. La presenza di `work/` non garantisce una ripresa rapida.

Una build fallita non produce una nuova immagine valida; un file rimasto in `images/` potrebbe essere una build precedente. Controllare sempre il messaggio finale e il percorso stampato dal tentativo corrente.

## Problemi già incontrati

- `unable to resolve host address`: controllare prima Internet sul Mac, incluso l’hotspot. Se il Mac naviga ma Docker no, riavviare Docker Desktop e riprovare. Tenere il Raspberry scollegato durante la build, per evitare instradamenti tramite USB gadget.
- `Cannot connect to Docker daemon`: avviare Docker Desktop e attendere che sia pronto.
- Avviso piattaforma amd64/arm64: la build su Apple silicon usa l’emulazione amd64.
- `Disk full` nella creazione FAT: verificare che il post-image contenga `count=128`, come applicato da questo script. Controllare separatamente spazio disco e spazio Docker.
- `cannot stat package/initscripts/init.d/*`: verificare che `rcS` e `rcK` esistano sia sul Mac sia nel contenitore; non cancellare sorgenti o cache alla cieca.

## Riproducibilità e test

Le versioni nominali delle sorgenti sono fissate, ma gli script non verificano l’hash di ogni dipendenza transitiva e non garantiscono build bit-per-bit riproducibili. `SS_TAG` e altre variabili possono alterare la build: per la release usare i valori predefiniti e registrare i commit effettivi.

[Test host e verifica del sorgente](docs/TEST.md). La build completa e l’avvio fisico non vengono eseguiti dai test host.
