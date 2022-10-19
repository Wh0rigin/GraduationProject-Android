import 'package:flutter/material.dart';

class ActuatorCard extends StatefulWidget {
  const ActuatorCard({super.key});

  @override
  State<ActuatorCard> createState() => _ActuatorCardState();
}

class _ActuatorCardState extends State<ActuatorCard> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.alarm),
              title: const Text('Alarm'),
              subtitle: Text(isOpen ? 'true' : 'false'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Toggle'),
                  onPressed: () {
                    setState(() {
                      isOpen = !isOpen;
                    });
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("操作成功")));
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
