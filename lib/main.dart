import 'package:flutter/material.dart';
import 'package:taskmanager/app/app.bottomsheets.dart';
import 'package:taskmanager/app/app.dialogs.dart';
import 'package:taskmanager/app/app.locator.dart';
import 'package:taskmanager/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.snackbars.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  setupSnackbar();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
