import 'package:flutter/material.dart';
import '../services/prayer_service.dart';
import 'package:adhan/adhan.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  PrayerTimes? prayerTimes;

  @override
  void initState() {
    super.initState();
    prayerTimes = PrayerService.getPrayerTimes();
  }

  String formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("مواقيت الصلاة")),
      body: prayerTimes == null
         ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ListTile(title: const Text("الفجر"), trailing: Text(formatTime(prayerTimes!.fajr))),
                ListTile(title: const Text("الشروق"), trailing: Text(formatTime(prayerTimes!.sunrise))),
                ListTile(title: const Text("الظهر"), trailing: Text(formatTime(prayerTimes!.dhuhr))),
                ListTile(title: const Text("العصر"), trailing: Text(formatTime(prayerTimes!.asr))),
                ListTile(title: const Text("المغرب"), trailing: Text(formatTime(prayerTimes!.maghrib))),
                ListTile(title: const Text("العشاء"), trailing: Text(formatTime(prayerTimes!.isha))),
              ],
            ),
    );
  }
}