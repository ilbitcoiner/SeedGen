# Modello di minaccia del porting Raspberry

Il [documento originale](docs/upstream/THREAT_MODEL.md) descrive SeedGen CLI v1.0.2. Il porting aggiunge driver, GPIO, frontend, traduzioni, nuovi formati e un’immagine Buildroot: il suo perimetro è più ampio.

Le proprietà e i limiti attuali sono descritti in [SECURITY.md](SECURITY.md). In particolare il frontend richiede PASS per tutti i test originali, usa controlli passivi rete/swap e non può garantire cancellazione della RAM o affidabilità dell’OS. La forza nominale dei dadi non è una misura della loro entropia fisica. Il filtro diagnostico non certifica la distribuzione finale.

Sono fuori dalle garanzie dichiarate: hardware/firmware compromessi, sistema di build compromesso, supply chain delle dipendenze, osservazione di schermo o dadi, lanci non indipendenti, accesso fisico, dump RAM e persistenza introdotta dall’OS. Non viene dichiarato un audit indipendente.
