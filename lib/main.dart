import 'package:education/pages/choice/choice_page.dart';
import 'package:education/pages/contact-user/contact_user_page.dart';
import 'package:education/pages/contact/contact_page.dart';
import 'package:education/pages/login/login_page.dart';
import 'package:education/pages/map/map_page.dart';
import 'package:education/pages/media/media_page.dart';
import 'package:education/pages/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const OnboardingPage(),
        '/login': (context) => const LoginPage(),
        '/contact': (context) => const ContactPage(),
        '/choice': (context) => const ChoicePage(),
        '/map': (context) => const MapPage(),
        '/media': (context) => const MediaPage(),
        '/contact-user': (context) => const ContactUserPage(),
      },
    );
  }
}