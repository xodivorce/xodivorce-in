## FAQ (Domande frequenti)

> [🇺🇸 FAQ in English](FAQ_EN.md) | [🇮🇳 FAQ हिंदी में](FAQ_IN.md) | [🇷🇺 ЧаВо на Русском](FAQ_RU.md) | 🇮🇹 Italiano FAQ

<details>
  <summary>Perché la mia favicon non viene visualizzata durante lo sviluppo locale?</summary>

- Apri il terminale nella directory `src/` e incolla i seguenti comandi:

```bash
# Potrebbe essere richiesta la password del tuo dispositivo
sudo chmod 644 assets/favicon/*
sudo chmod 755 assets/favicon
```

</details>