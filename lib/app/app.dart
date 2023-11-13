
import 'package:bookaway/routes/app_route.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BookAway",
      initialRoute: AppRoute.signupRoute,
      routes: AppRoute.getApplicationRoute(),
    );
  }
}
