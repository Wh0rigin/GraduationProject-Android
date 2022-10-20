import 'package:flutter/material.dart';

class BookCard extends StatefulWidget {
  const BookCard(
      {super.key, required this.bookName, required this.availableNumber});

  final bookName;
  final availableNumber;
  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.menu_book),
              title: Text(widget.bookName.toString()),
              subtitle: Text('可借阅数量:${widget.availableNumber}'),
            ),
            // container
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
