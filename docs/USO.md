# Uso di SEEDGEN Pi V9

## Navigazione

| Schermata | Comando |
|---|---|
| Home | Frecce per scegliere un riquadro, centro/KEY2 per aprire |
| Power | Su da un riquadro superiore e centro per aprire. Scegliere Restart o Power off e confermare |
| Menu | Su/Giù per la voce, centro/KEY2 per confermare |
| Indietro nei menu | Su dalla prima voce oppure Sinistra, poi centro sulla freccia |
| Informazioni/parole/password | Su per selezionare Indietro; centro per uscire; Giù per tornare al contenuto |
| Scorciatoia Indietro | KEY3 |
| Griglia dadi | Sinistra/Destra nella riga, Giù per cambiare riga, centro/KEY2 per inserire il lancio fisico |
| Indietro nella griglia | Su dalla riga inferiore, ancora Su dalla superiore, poi centro |
| Correggere un lancio | KEY1 cancella l’ultimo; alla fine confermare o correggere il blocco |

La griglia **non lancia dadi virtuali**: registra il valore del dado fisico. Tornare indietro durante una generazione annulla il blocco; non crea una sessione salvata.

## Seed BIP39

| Parole | Bit nominali | Lanci iniziali |
|---:|---:|---:|
| 12 | 128 | 50 |
| 15 | 160 | 62 |
| 18 | 192 | 75 |
| 21 | 224 | 87 |
| 24 | 256 | 100 |

La logica originale può rifiutare un blocco: in tal caso rifare tutti i lanci richiesti. Trascrivere le parole nell’ordine e reinserirle dal foglio. “Copia verificata” richiede corrispondenza delle parole e checksum BIP39 valido. I controlli richiedono dadi equi e lanci indipendenti; non certificano la qualità fisica dell’entropia.

## Passphrase

Aprire il riquadro Passphrase e scegliere da 6 a 9 parole Diceware. Immettere cinque lanci di dado D6 per parola. Trascrivere e verificare la copia nell’ordine mostrato.

## Verifica e strumenti

Verifica BIP39 controlla parole e checksum di una mnemonic inserita. Non verifica indirizzi, saldo o provenienza del wallet.

Strumenti offre test di integrità, Audit Mode, Lingua e spegnimento. Audit Mode mostra parametri matematici pubblici; non è un audit di sicurezza indipendente.

Lingua permette Italiano, English, Français, Español. La preferenza resta in RAM e torna italiano al riavvio. Le wordlist sono inglesi e le parole/password non vengono tradotte.

## Cursore e suggerimenti nel codice in sviluppo

Dopo ogni lancio confermato il cursore resta sulla faccia registrata. Nella verifica, le corrispondenze appaiono dalla prima lettera sopra la tastiera. KEY2 accetta la corrispondenza unica o apre l’elenco. Il tasto centrale permette di continuare a digitare. La release binaria v9.3 precede queste modifiche.
