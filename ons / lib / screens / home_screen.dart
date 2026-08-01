import 'package:flutter/material.dart';
import '../widgets/menu_card.dart';
import 'tasbeeh_screen.dart';
import 'azkar_screen.dart';
import 'prayer_screen.dart';
import 'duas_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("أُنس")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [
            MenuCard(
              title: "المسبحة",
              icon: Icons.circle,
              color: const Color(0xff0B6E4F),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TasbeehScreen()),
                );
              },
            ),
            MenuCard(
              title: "الأذكار",
              icon: Icons.menu_book,
              color: const Color(0xffC49A2C),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AzkarScreen()),
                );
              },
            ),
            MenuCard(
              title: "مواقيت الصلاة",
              icon: Icons.mosque,
              color: const Color(0xff1976D2),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PrayerScreen()),
                );
              },
            ),
            MenuCard(
              title: "الأدعية",
              icon: Icons.favorite,
              color: const Color(0xff8E44AD),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DuasScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}