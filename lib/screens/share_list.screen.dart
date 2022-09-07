import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_attachment/main.dart';
import 'package:share_attachment/screens/view.screen.dart';

class ShareList extends StatefulWidget {
  const ShareList({Key? key, this.files = const []}) : super(key: key);

  final List<File> files;

  // final List<File> sharedText;

  @override
  State<ShareList> createState() => _ShareListState();
}

class _ShareListState extends State<ShareList> {
  List<File> files = [];
  @override
  void initState() {
    files = widget.files;
    super.initState();
  }

  List<String> usersList = [
    'Jenish',
    'Nivedha',
    'Vignesh',
    'Saravana Priyan',
    'Karunakaran',
    'Karthikeyan'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Share To')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.grey[200],
        child: ListView.builder(
            itemCount: usersList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Card(
                  child: ListTile(
                    title: Text(usersList[index]),
                  ),
                ),
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ViewScreen(usersList[index], sharedFiles: files)));
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            title: 'Share',
                          )));
                },
              );
            }),
      ),
    );
  }
}
