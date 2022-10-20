import 'package:flutter/material.dart';

class RefreshCard extends StatefulWidget {
  const RefreshCard({super.key, required this.name});

  final String name;

  @override
  State<RefreshCard> createState() => _RefreshCardState();
}

class _RefreshCardState extends State<RefreshCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListTile(
              leading: const Icon(Icons.refresh_outlined),
              title: const Text('Refresh'),
              subtitle: Text('刷新你的${widget.name}列表,若${widget.name}没有出现'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: TextButton(
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Refresh',
                        ),
                      ]),
                  onPressed: () {
                    setState(() {});
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("刷新成功")));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
