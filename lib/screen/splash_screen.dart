import 'package:baca_buku_app1/screen/auth/login_page.dart';
import 'package:baca_buku_app1/screen/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3 ),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    _navigateToHome();
  }

  _navigateToHome()async{
    await Future.delayed(const Duration(seconds: 3), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 180, 142, 94),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            width: 200,
            height: 200,
            color: const Color.fromARGB(255, 243, 222, 186),
          ),
        ),
      ),
    );
  }
}