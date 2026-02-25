# 🌍 Countries App – Flutter

Application Flutter simple qui affiche la liste des pays du monde avec leur capitale, en utilisant une API publique.

---

## ✨ Fonctionnalités

- Récupération des pays depuis une API REST
- Affichage du nom du pays
- Affichage de la capitale (si disponible)
- Gestion des pays sans capitale
- Bouton de rafraîchissement des données
- Compatible Flutter Web / Android / iOS



## 🛠️ Technologies utilisées

- **Flutter**
- **Dart**
- **Dio** (pour les requêtes HTTP)
- **API REST Countries**

---

## 📦 Dépendances

Dans le fichier `pubspec.yaml` :

```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.0.0



https://restcountries.com/v3.1/all?fields=name,capital,currencies
Pour recuperer la liste de pays du monde entier et tout ce qui va avec
