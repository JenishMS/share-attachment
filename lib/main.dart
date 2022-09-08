import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:share_attachment/helper/intent.helper.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    listenShareMediaFiles(context);
    super.initState();
  }

  Future<void> shareFile() async {
    // Share.share('check out my website https://example.com');
    List<String> paths = await selectFile();
    if (paths.isEmpty) return;
    ShareResult result = await Share.shareFilesWithResult(
      paths,
      subject: 'Share File',
      text: 'Share file from flutter app',
    );
    print(result.raw);
  }

  // /data/user/0/com.example.share_attachment/cache/IMG_20220726_120001.jpg

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Share File From Device',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: shareFile,
        tooltip: 'Share',
        child: const Icon(Icons.share_rounded),
      ),
    );
  }

  Future<List<String>> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        dialogTitle: 'Select a file',
        type: FileType.image,
        allowMultiple: true);

    if (result == null) return [];

    List<String> files = [];
    files = result.paths.map((path) => path as String).toList();
    return files;
  }
}
