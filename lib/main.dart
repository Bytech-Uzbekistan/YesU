import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'app_language_provider/app_language.dart';
import 'app_language_provider/app_localizations/localizations.dart';
import 'screens/splash/splash_screen.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(SplashScreen()
      // ChangeNotifierProvider(
      //     create: (_) => appLanguage,
      //     child: Consumer<AppLanguage>(builder: (context, model, child){
      //       return MaterialApp(
      //         theme: ThemeData(primarySwatch: Colors.blue),
      //         locale: model.appLocal,
      //         supportedLocales: [
      //           Locale('en', 'US'),
      //           Locale('ru', 'RU'),
      //           Locale('uz', 'UZ')
      //         ],
      //         localizationsDelegates: [
      //           AppLocalizations.delegate,
      //           GlobalMaterialLocalizations.delegate,
      //           GlobalWidgetsLocalizations.delegate,
      //         ],
      //         home: SplashScreen(),
      //       );
      //     },
      //     ))
  );
}
