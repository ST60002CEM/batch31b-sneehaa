import 'package:bookaway/config/themes/themes.dart';
import 'package:bookaway/config/routes/app_route.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BookAway",
      theme: getApplicationTheme(),
      initialRoute: AppRoute.homeRoute,
      routes: AppRoute.getApplicationRoute(),
    );
  }
}
