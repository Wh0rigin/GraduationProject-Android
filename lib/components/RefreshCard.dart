import 'package:flutter/material.dart';

class RefreshCard extends StatefulWidget {
  const RefreshCard({super.key});

  @override
  State<RefreshCard> createState() => _RefreshCardState();
}

class _RefreshCardState extends State<RefreshCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: Icon(Icons.refresh_outlined),
              title: Text('Refresh'),
              subtitle: Text('刷新你的设备列表,若设备没有出现'),
            ),
            TextButton(
              child: const Text(
                'Refresh',
              ),
              onPressed: () {
                setState(() {});
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("刷新成功")));
              },
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
