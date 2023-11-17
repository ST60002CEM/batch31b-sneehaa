import 'package:bookaway/routes/app_route.dart';
import 'package:bookaway/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BookAway",
      home: const SplashScreen(),
      // initialRoute: AppRoute.loginRoute,
      routes: AppRoute.getApplicationRoute(),
    );
  }
}
