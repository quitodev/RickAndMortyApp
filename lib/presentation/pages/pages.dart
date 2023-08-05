import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/domain/entities/entities.dart';
import 'package:rick_and_morty_app/domain/usecases/usecases.dart';
import 'package:rick_and_morty_app/injection_container.dart';
import 'package:rick_and_morty_app/presentation/cubit/home_cubit.dart';
import 'package:rick_and_morty_app/presentation/pages/characters/widgets/widgets.dart';
import 'package:rick_and_morty_app/presentation/pages/episodes/widgets/widgets.dart';
import 'package:rick_and_morty_app/presentation/pages/locations/widgets/widgets.dart';
import 'package:rick_and_morty_app/presentation/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'characters/character_detail_page.dart';
part 'characters/characters_page.dart';
part 'episodes/episodes_page.dart';
part 'home_page.dart';
part 'locations/locations_page.dart';
