/*
enum Menu{
  Entreprise,
  Clients,
  Payments,
  Settings
}*/
enum Menu {
  enterprise,
  clients,
  payments,
  settings,
}

extension MenuExtension on Menu {
  String get displayName {
    switch (this) {
      case Menu.enterprise:
        return "Entreprise";
      case Menu.clients:
        return "Clients";
      case Menu.payments:
        return "Payments";
      case Menu.settings:
        return "Settings";
    }
  }
}
