import 'dart:io';

import 'package:flutter/material.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen(this.name, {Key? key, required this.sharedFiles})
      : super(key: key);

  final String name;

  final List<File> sharedFiles;

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: (() => Navigator.of(context).pop()),
              icon: Icon(Icons.arrow_back)),
          title: Text(widget.name)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22.0),
          child: Column(
            children: List.of(widget.sharedFiles)
                .map((file) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      width: double.infinity,
                      height: 200.0,
                      child: Image.file(file, fit: BoxFit.cover),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
