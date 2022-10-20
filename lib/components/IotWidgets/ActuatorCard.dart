import 'package:flutter/material.dart';
import 'package:graduation_project/api/ActuatorApi.dart';
import 'package:graduation_project/api/SensorApi.dart';

class ActuatorCard extends StatefulWidget {
  const ActuatorCard(
      {super.key, required this.actuatorName, required this.token});
  final String token;
  final String actuatorName;

  @override
  State<ActuatorCard> createState() => _ActuatorCardState();
}

class _ActuatorCardState extends State<ActuatorCard> {
  bool isOpen = false;
  String payload = "";
  String date = "";
  void loopGet() async {
    await SensorApi.getLaterSensorData(widget.actuatorName, widget.token)
        .then((value) {
      if (value.data != null) {
        debugPrint("GET:${value.data}");
        setState(() {
          if (value.data["code"] == 200 &&
              value.data["data"]["payload"] != null) {
            payload = value.data["data"]["payload"][0]["Value"].toString();
          } else {
            payload = "null";
            date = "null";
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), loopGet);
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.alarm),
              title: Text(widget.actuatorName),
              subtitle: Text(payload == '1' ? 'true' : 'false'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Toggle'),
                  onPressed: () async {
                    isOpen = !isOpen;
                    await ActuatorApi.ControlActuator(widget.actuatorName,
                            isOpen ? "1" : "0", widget.token)
                        .then((value) {
                      if (value.data != null) {
                        debugPrint("POST:${value.data}");
                        if (value.data["code"] == 422) {
                          isOpen = !isOpen;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(value.data["msg"])));
                      }
                    });
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
