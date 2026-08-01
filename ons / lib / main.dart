import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const OnsApp());
}

class OnsApp extends StatelessWidget {
  const OnsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "أُنس",
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF7F5EF),
        primaryColor: const Color(0xff0B6E4F),
        textTheme: GoogleFonts.cairoTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0B6E4F),
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}