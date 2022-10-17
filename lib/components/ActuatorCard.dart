import 'package:flutter/material.dart';

class ActuatorCard extends StatelessWidget {
  const ActuatorCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
              subtitle: Text('true'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Toggle'),
                  onPressed: () {
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
