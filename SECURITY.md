# Sicurezza del fork Raspberry

Questa pagina riguarda SEEDGEN Pi V9. Il documento originale CLI/Linux è conservato in `docs/upstream/SECURITY.md` e non descrive da solo il frontend LCD.

## Stato e limiti

V9 è la versione selezionata dal manutentore dopo prove funzionali. Non è dichiarato un audit di sicurezza indipendente. Test automatici, firma di una release e approvazione dell’interfaccia hanno scopi differenti e non dimostrano la sicurezza complessiva.

- L’entropia primaria è inserita da dadi fisici D6. Dadi non equi, lanci dipendenti o input scelti intenzionalmente possono compromettere il risultato.
- Il controllo diagnostico dei lanci non misura l’entropia. Il rejection sampling del decoder evita il bias della semplice riduzione modulo, ma il filtro preliminare condiziona i blocchi accettati; non si dichiara uniformità esatta dell’intero processo filtrato.
- Il frontend verifica hash del core/dizionari e richiede PASS per tutti i self-test previsti. Il controllo non certifica un sistema operativo o hardware affidabile.
- Prima della generazione/verifica controlla passivamente rete e swap; non effettua il controllo attivo di raggiungibilità del launcher CLI originale. Un sistema compromesso può alterare o aggirare questi controlli.
- Nessun segreto è intenzionalmente salvato o stampato dal frontend. CPython non garantisce la cancellazione sicura dalla RAM; log, crash, sistema operativo e accesso fisico richiedono valutazione separata.
- Le wordlist restano inglesi. Diceware BIP39 è una password, non una mnemonic con checksum.
- L’assenza di derivazione indirizzi, saldi e firma transazioni significa che SEEDGEN non è un wallet.

## Segnalazioni

Per problemi funzionali pubblicare soltanto dati di prova nel repository del fork. **Mai allegare seed, password, chiavi private o dati di produzione.** Per una vulnerabilità sensibile verificare prima se GitHub mostra un canale di segnalazione privata nel repository; altrimenti concordare privatamente con il manutentore un canale adatto prima di divulgarne i dettagli. Non sono promessi tempi di risposta o un canale privato che non risulti configurato.

## Release

Le immagini Raspberry devono avere manifest SHA-256 e firma del manutentore. La chiave ereditata dall’upstream, conservata in `docs/upstream/`, non firma questi artefatti. Confrontare fingerprint e firma seguendo `docs/VERIFICA.md`. Una release pubblicata è immutabile: un cambiamento di immagine richiede una nuova versione.
