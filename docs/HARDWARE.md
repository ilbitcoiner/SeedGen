# Hardware del profilo 240×240

Profilo usato per le prove funzionali del manutentore: Raspberry Pi Zero originale v1.3 ARMv6 e Waveshare 1,3" ST7789 240×240 con joystick e tre tasti. Non è un profilo generico per ogni pannello ST7789.

I pin di input usano numerazione fisica **BOARD**, non BCM:

| Comando | Pin fisico |
|---|---:|
| Su | 31 |
| Giù | 35 |
| Sinistra | 29 |
| Destra | 37 |
| Pressione centrale | 33 |
| KEY1 | 40 |
| KEY2 | 38 |
| KEY3 | 36 |

Il driver display è quello fornito da SeedSigner 0.8.7 e usa il profilo ST7789 240×240. Le impostazioni di quel driver gestiscono il collegamento SPI del pannello.

Alimentare tramite PWR IN. Il Pi Zero v1.3 non ha Wi-Fi integrato; gli adattatori e le interfacce USB sono comunque rilevati dal controllo passivo di rete quando risultano attivi. Una connessione USB dati può attivare un’interfaccia gadget: per generare segreti utilizzare il dispositivo isolato dalla rete.
