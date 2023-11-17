import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showText = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          showText = true;
        });
      }

      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/splash.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            if (showText)
              Positioned(
                bottom: MediaQuery.of(context).size.height / 7,
                child: const Text(
                  'BookAway',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Agbalumo',
                    color: Color.fromARGB(255, 90, 123, 172),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
