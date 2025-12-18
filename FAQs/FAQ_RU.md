## FAQ (Часто задаваемые вопросы)

> [🇺🇸 FAQ in English](FAQ_EN.md) | [🇮🇳 FAQ हिंदी में](FAQ_IN.md) | 🇷🇺 Русском ЧаВо | [🇮🇹 FAQ in Italiano](FAQ_IT.md)

<details>
  <summary>Почему favicon не отображается при локальной разработке?</summary>

- Откройте терминал в директории `src/` и выполните следующие команды:

```bash
# Может потребоваться пароль вашего устройства
sudo chmod 644 assets/favicon/*
sudo chmod 755 assets/favicon
```

</details>