import 'package:fitness_control/stores/app.store.dart';
import 'package:fitness_control/views/login/login.view.dart';
import 'package:flutter/material.dart';
import 'package:fitness_control/themes/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppStore>.value(
          value: AppStore(),
        ),
      ],
      child:
      MaterialApp(
        localizationsDelegates: [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("pt","BR")
        ],
        title: 'Fitness Control',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: kPrimaryColor,
  //        brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
        ),
        home: LoginView(),
      ),
    );
  }
}