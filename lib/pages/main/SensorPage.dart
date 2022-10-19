import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../../components/ActuatorCard.dart';
import '../../components/RefreshCard.dart';
import '../../components/SensorCard.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({super.key, required this.token});
  final String token;

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  static var sensorCards = <Widget>[];
  static var actuatorCards = <Widget>[];
  String sensorName = "";
  String sensorUnit = "";
  final TextEditingController _editingNameController = TextEditingController();
  final TextEditingController _editingUnitController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (sensorCards.isEmpty && actuatorCards.isEmpty) {
      sensorCards.addAll([
        const RefreshCard(
          name: "设备",
        ),
        SensorCard(sensorName: "temperature", token: widget.token, unit: "℃"),
      ]);
      actuatorCards.addAll([
        ActuatorCard(
          actuatorName: "lamp",
          token: widget.token,
        ),
      ]);
    }
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text(widget.token)));
    });
  }

  void addSensor(String token, String sensorType, String unit) {
    if (mounted == true) {
      setState(() {
        sensorCards.add(SensorCard(
          token: widget.token,
          sensorName: sensorName,
          unit: sensorUnit,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint("SensorPages reflush");
    // debugPrint(sensorCards.toString());
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: sensorCards + actuatorCards,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              Get.defaultDialog(
                title: "添加临时传感器",
                confirm: ElevatedButton(
                    onPressed: () {
                      if (sensorName == "") {
                        Get.snackbar("添加失败,名称不能为空", sensorName);
                        return;
                      }
                      // addSensor(widget.token, sensorName, sensorUnit);
                      sensorCards.add(SensorCard(
                        token: widget.token,
                        sensorName: sensorName,
                        unit: sensorUnit,
                      ));

                      Get.snackbar("添加成功 ", sensorName);
                      sensorName = "";
                      sensorUnit = "";
                      _editingNameController.clear();
                      _editingUnitController.clear();
                    },
                    child: const Text("OK")),
                content: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: _editingNameController,
                            decoration: const InputDecoration(
                              labelText: "传感器名称",
                              hintText: "请输入传感器名称",
                              prefixIcon: Icon(Icons.sensors),
                              suffixIcon: Icon(Icons.edit),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            ),
                            onChanged: (value) =>
                                {sensorName = value.toString()},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _editingUnitController,
                            decoration: const InputDecoration(
                                labelText: "数据单位",
                                hintText: "请输入数据单位",
                                prefixIcon: Icon(Icons.percent),
                                suffixIcon: Icon(Icons.edit),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)))),
                            onChanged: (value) =>
                                {sensorUnit = value.toString()},
                          ),
                        ])),
              ).whenComplete(() {
                setState(() {});
              });
            });
          },
          backgroundColor: Colors.orange,
          child: const Icon(Icons.add),
        ));
  }
}
