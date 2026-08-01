import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/zekr_model.dart';

class ZekrCard extends StatelessWidget {
  final ZekrModel zekr;

  const ZekrCard({super.key, required this.zekr});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              zekr.text,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 18, height: 1.8),
            ),
            const SizedBox(height: 10),
            Text(
              "🔁 ${zekr.count}",
              style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            Text(
              zekr.reference,
              style: const TextStyle(color: Colors.grey),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: zekr.text));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("تم نسخ الذكر")),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}