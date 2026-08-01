import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  int count = 0;
  int zekrIndex = 0;
  final List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر",
    "اللهم صل وسلم على نبينا محمد",
    "اللهم انصر أهلنا في غزة"
  ];

  @override
  void initState() {
    super.initState();
    loadCount();
  }

  Future<void> loadCount() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      count = prefs.getInt("tasbeeh_count")?? 0;
    });
  }

  Future<void> saveCount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("tasbeeh_count", count);
  }

  void tasbeeh() {
    setState(() {
      count++;
    });
    saveCount();
    Vibration.vibrate(duration: 40);
    if (count % 100 == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("اللهم بارك، أتممت $count ذكر 🌸"),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void reset() {
    setState(() {
      count = 0;
    });
    saveCount();
  }

  void changeZekr() {
    setState(() {
      zekrIndex++;
      if (zekrIndex >= azkar.length) {
        zekrIndex = 0;
      }
      count = 0;
    });
    saveCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("المسبحة")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              azkar[zekrIndex],
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff0B6E4F),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.2),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  "$count",
                  style: const TextStyle(
                    fontSize: 55,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: tasbeeh,
              child: Container(
                height: 90,
                width: 90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffD4AF37),
                ),
                child: const Icon(Icons.touch_app, size: 45, color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text("تصفير"),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: changeZekr,
                  icon: const Icon(Icons.swap_horiz),
                  label: const Text("تبديل الذكر"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}