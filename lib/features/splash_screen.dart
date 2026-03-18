import 'package:flutter/material.dart';
import 'package:watch_it/features/home/ui/view/watch_it_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _logoAnimation;
  late Animation<Offset> _imageAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _logoAnimation = Tween<Offset>(
      begin: const Offset(-1, 0), // from top
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _imageAnimation = Tween<Offset>(
      begin: const Offset(0, -0.8),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward().then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => WatchItView()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF70000),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: _logoAnimation,
            child: Image.asset("assets/images/you_tube_logo.png"),
          ),
          SlideTransition(
            position: _imageAnimation,
            child: Image.asset("assets/images/Subscribe.png"),
          ),
        ],
      ),
    );
  }
}
