import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/BookApi.dart';

class BookSearchCard extends StatefulWidget {
  const BookSearchCard(
      {super.key, required this.fieldValue, required this.token});
  final ValueChanged<String> fieldValue;
  final String token;

  @override
  State<BookSearchCard> createState() => _BookSearchCardState();
}

class _BookSearchCardState extends State<BookSearchCard> {
  String searchText = "";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              subtitle: Text('请使用书本的ISBN号进行搜索'),
            ),
            // container
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: CupertinoSearchTextField(onChanged: (value) async {
                  searchText = value;
                  await BookApi.getBookByIsbn(searchText, widget.token)
                      .then((value) {
                    debugPrint(value.data);
                  });
                })),

            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
