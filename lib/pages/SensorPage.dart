import 'package:flutter/material.dart';
import 'package:graduation_project/components/ActuatorCard.dart';
import 'package:graduation_project/components/SensorCard.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({super.key});

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: const <Widget>[
            SensorCard(
              sensorName: "temperature",
              payload: "23.5℃",
            ),
            SensorCard(
              sensorName: "humidity",
              payload: "67%RH",
            ),
            SensorCard(
              sensorName: "light",
              payload: "1250lux",
            ),
            SensorCard(
              sensorName: "Co2",
              payload: "336ppm",
            ),
            ActuatorCard(),
            ActuatorCard(),
            ActuatorCard(),
            ActuatorCard(),
            ActuatorCard(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Hello")));
          },
          backgroundColor: Colors.orange,
          child: const Icon(Icons.add),
        ));
  }
}
