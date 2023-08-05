import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/domain/entities/entities.dart';
import 'package:rick_and_morty_app/presentation/pages/pages.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return HomePage.route();
      case "/characters_page":
        return CharactersPage.route();
      case "/character_detail_page":
        return CharacterDetailPage.route(
          character: settings.arguments as Character,
        );
      case "/episodes_page":
        return EpisodesPage.route();
      case "/locations_page":
        return LocationsPage.route();
      default:
        return HomePage.route();
    }
  }
}
