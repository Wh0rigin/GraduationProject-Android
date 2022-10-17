import 'package:flutter/material.dart';

class SensorCard extends StatelessWidget {
  const SensorCard(
      {super.key, required this.sensorName, required this.payload});
  final String sensorName;
  final String payload;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.sensors),
              title: Text(sensorName),
              subtitle: Text(payload),
            ),
          ],
        ),
      ),
    );
  }
}
