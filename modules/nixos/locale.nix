{ lib, ... }:
let
  extraLocale = "ru_RU.UTF-8"; # Язык даты, времени, адресов и тд
in {
  # Автоопределение часового пояса (например, ЕКБ) вместо жёсткого Moscow.
  # Fallback нужен на случай, если геоопределение временно недоступно.
  time.timeZone = lib.mkDefault "Etc/UTC";
  services.automatic-timezoned.enable = true;

  i18n = {
    defaultLocale = "en_US.UTF-8"; # Язык системы

    extraLocaleSettings = {
      LC_ADDRESS = extraLocale;
      LC_IDENTIFICATION = extraLocale;
      LC_MEASUREMENT = extraLocale;
      LC_MONETARY = extraLocale;
      LC_NAME = extraLocale;
      LC_NUMERIC = extraLocale;
      LC_PAPER = extraLocale;
      LC_TELEPHONE = extraLocale;
      LC_TIME = extraLocale;
    };
  };
}