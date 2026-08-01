import 'package:flutter/material.dart';
import '../data/morning_azkar.dart';
import '../data/evening_azkar.dart';
import '../widgets/zekr_card.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  bool morning = true;

  @override
  Widget build(BuildContext context) {
    final list = morning? morningAzkar : eveningAzkar;
    return Scaffold(
      appBar: AppBar(title: const Text("الأذكار")),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceChip(
                label: const Text("أذكار الصباح"),
                selected: morning,
                onSelected: (v) {
                  setState(() {
                    morning = true;
                  });
                },
              ),
              const SizedBox(width: 15),
              ChoiceChip(
                label: const Text("أذكار المساء"),
                selected:!morning,
                onSelected: (v) {
                  setState(() {
                    morning = false;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ZekrCard(zekr: list[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}