# Verifiche della V9 240×240

## Test host

```bash
python3 -m venv .venv
. .venv/bin/activate
python3 -m pip install -r requirements-dev.txt
cd raspberry/240x240
python3 -m unittest -v test_ui test_passwords test_navigation
```

Sono presenti **48 test**: 18 UI/core, 10 password, 20 navigazione/lingue. Il test del core esegue anche i 14 self-test originali; questi non sono 14 test aggiuntivi da sommare ai 48.

Copertura: tutte le lunghezze BIP39, checksum, indici Diceware, rifiuto dei blocchi, input non validi, integrità dei file, blocco rete/swap, conservazione del testo, forza nominale dei nuovi formati, spazi piccoli esaustivi del decoder, navigazione Indietro/Power, conferma spegnimento, quattro lingue e mancata traduzione dei segreti.

I test del decoder esaminano la mappatura matematica; non attestano uniformità del processo fisico o dell’intero flusso condizionato dal filtro diagnostico.

## Integrità e sintassi

```bash
cd raspberry/240x240/vendor
shasum -a 256 -c SHA256SUMS
```

Da `raspberry/240x240/`:

```bash
python3 -m py_compile main.py password_tools.py ui_views.py i18n.py
bash -n build-v9.sh
```

Il file `REPORT_TEST.txt` è il rapporto host della preparazione V9, non una certificazione hardware. Il manutentore ha indicato di aver provato e approvato funzionalmente la V9 sullo schermo piccolo. Non è disponibile un verbale indipendente di tutte le combinazioni hardware/input e non è stato eseguito qui un nuovo build Docker completo.

## Corrispondenza del frontend

La preparazione del repository conserva byte-per-byte i quattro moduli, i font, i dizionari e lo script di build della V9 fornita al manutentore. La documentazione è riorganizzata per l’uso pubblico. Il profilo Plus non è incluso.

Lo script di preparazione della release ha superato il controllo sintattico Bash. La firma GPG effettiva dovrà essere eseguita e verificata sul Mac del manutentore; in questo ambiente gpg-agent non si avvia, quindi non viene dichiarata una prova crittografica completa dello script.
