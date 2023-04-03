import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/app.dart';

import 'common/blocs/chatty_bloc_observer.dart';
import 'common/settings/settings_controller.dart';
import 'common/settings/settings_service.dart';
import 'modules/firebase/widgets/firebase_initializer.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  Bloc.observer = ChattyBlocObserver();

  runApp(
    MyApp(),
  );

}
