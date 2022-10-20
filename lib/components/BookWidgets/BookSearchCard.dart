import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookSearchCard extends StatefulWidget {
  const BookSearchCard(
      {super.key, required this.fieldValue, required this.token});
  final ValueChanged<String> fieldValue;
  final String token;

  @override
  State<BookSearchCard> createState() => _BookSearchCardState();
}

class _BookSearchCardState extends State<BookSearchCard> {
  Timer? _timer;

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer!.cancel();
    }
  }

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
                child: CupertinoSearchTextField(onChanged: (value) {
                  int countdownTime = 0;
                  const oneSec = Duration(seconds: 1);
                  if (_timer != null) {
                    // debugPrint('time.cancel');
                    _timer!.cancel();
                  }
                  _timer = Timer.periodic(oneSec, (timer) {
                    countdownTime++;
                    if (countdownTime >= 3) {
                      widget.fieldValue(value);
                      countdownTime = 0;
                      _timer!.cancel();
                    }
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
