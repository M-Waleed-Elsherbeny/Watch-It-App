import 'package:flutter/material.dart';
import 'package:watch_it/core/supabase_config.dart';
import 'package:watch_it/features/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseConfig.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watch It App',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
