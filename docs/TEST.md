# Verifiche della V9 240×240

## Test host

```bash
python3 -m venv .venv
. .venv/bin/activate
python3 -m pip install -r requirements-dev.txt
cd raspberry/240x240
python3 -m unittest -v test_ui test_passwords test_navigation
```

La suite contiene **56 test host**. Copre tutte le lunghezze BIP39, la verifica finale della copia, i blocchi rifiutati, i formati passphrase, la navigazione, il menu Power e le traduzioni. La suite esegue anche i 14 self-test originali.

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

Il [rapporto di verifica](../raspberry/240x240/REPORT_TEST.txt) contiene l’output completo dei test e gli esiti delle prove fisiche per revisione. Per collegare una build ai sorgenti, registrare i commit delle dipendenze e gli hash dei file e dell’immagine come descritto nella [guida release](RELEASE.md).
