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

Aprire il riquadro Passphrase per accedere a Tipo passphrase. Il menu offre:

- **Custom:** unione dei gruppi di caratteri selezionati, forza nominale 64/128/256 bit. Non è garantito che ogni gruppo compaia almeno una volta.
- **Diceware classico:** percorso originale, da 6 a 9 parole del dizionario Diceware lungo.
- **Diceware BIP39:** password con parole del dizionario BIP39 e forza nominale 64/128/256 bit. Non aggiunge checksum e **non è una mnemonic wallet**.

La fonte è soltanto Dadi fisici D6. Nei formati che chiedono un separatore sono disponibili Space, punto e Capitalise. La voce None richiede di scegliere un altro formato: concatenare parole di lunghezza variabile può rendere ambigui i confini.

Nella visualizzazione completa delle parole, `*` rappresenta uno spazio: non copiare l’asterisco. Le righe di una password Custom vanno concatenate senza aggiungere spazi o ritorni a capo. Completare la verifica della trascrizione; per le password di parole controllare anche separatori e maiuscole.

## Verifica e strumenti

Verifica BIP39 controlla parole e checksum di una mnemonic inserita. Non verifica indirizzi, saldo o provenienza del wallet.

Strumenti offre test di integrità, Audit Mode, test pulsanti, Lingua e spegnimento. Audit Mode mostra parametri matematici pubblici; non è un audit di sicurezza indipendente.

Lingua permette Italiano, English, Français, Español. La preferenza resta in RAM e torna italiano al riavvio. Le wordlist sono inglesi e le parole/password non vengono tradotte.
