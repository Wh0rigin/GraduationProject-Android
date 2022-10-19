import 'package:flutter/material.dart';

class BasicCard extends StatefulWidget {
  const BasicCard({super.key});

  @override
  State<BasicCard> createState() => _BasicCardState();
}

class _BasicCardState extends State<BasicCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            ListTile(
              leading: Icon(Icons.refresh_outlined),
              title: Text('Title'),
              subtitle: Text('subtitle'),
            ),
            // container
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
