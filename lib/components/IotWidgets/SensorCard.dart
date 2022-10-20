import 'package:flutter/material.dart';
import 'package:graduation_project/api/SensorApi.dart';

class SensorCard extends StatefulWidget {
  const SensorCard(
      {super.key,
      required this.sensorName,
      required this.token,
      required this.unit});
  final String sensorName;
  final String token;
  final String unit;

  @override
  State<SensorCard> createState() => _SensorCardState();
}

class _SensorCardState extends State<SensorCard> {
  String payload = "";
  String date = "";
  void loopGet() async {
    await SensorApi.getLaterSensorData(widget.sensorName, widget.token)
        .then((value) {
      if (value.data != null) {
        debugPrint("GET:${value.data}");
        setState(() {
          if (value.data["code"] == 200 &&
              value.data["data"]["payload"] != null) {
            payload = value.data["data"]["payload"][0]["Value"].toString();
            date = value.data["data"]["payload"][0]["RecordTime"].toString();
          } else {
            payload = "null";
            date = "null";
          }
        });
      }
    });
    // Future.delayed(const Duration(seconds: 5), loopGet);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), loopGet);
    //     .then((value) => Future.delayed(const Duration(seconds: 5), loopGet));

    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.sensors),
              title: Text(widget.sensorName),
              subtitle:
                  Text(payload == "null" ? "null" : payload + widget.unit),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  date == "null" ? "null" : date,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
