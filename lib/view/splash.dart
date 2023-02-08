import 'package:flutter/material.dart';
import 'package:therapy/view/welcome.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => GetStarted()),
        ));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_bg.png'),
            fit: BoxFit.fill
          )
        ),
        child: Center(
          child: Image.asset(
              'assets/images/splash_logo.png',
          width: MediaQuery.of(context).size.width - 100,),
        ),
      ),
    );
  }
}
