//All listeners to listen Sharing media files & text
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:share_attachment/screens/share_list.screen.dart';

void listenShareMediaFiles(BuildContext context) {
  // For sharing images coming from outside the app
  // while the app is in the memory
  ReceiveSharingIntent.getMediaStream().listen((List<SharedMediaFile> value) {
    navigateToShareMedia(context, value);
  }, onError: (err) {
    debugPrint("$err");
  });

  // For sharing images coming from outside the app while the app is closed
  ReceiveSharingIntent.getInitialMedia().then((List<SharedMediaFile> value) {
    navigateToShareMedia(context, value);
  });

  // For sharing or opening urls/text coming from outside the app while the app is in the memory
  ReceiveSharingIntent.getTextStream().listen((String value) {
    navigateToShareText(context, value);
  }, onError: (err) {
    debugPrint("$err");
  });

  // For sharing or opening urls/text coming from outside the app while the app is closed
  ReceiveSharingIntent.getInitialText().then((String? value) {
    navigateToShareText(context, value);
  });
}

void navigateToShareMedia(BuildContext context, List<SharedMediaFile> value) {
  print('Shared File');
  if (value.isNotEmpty) {
    var newFiles = <File>[];
    value.forEach((element) {
      newFiles.add(File(
        element.path,
      ));
    });
    print(newFiles.first.path);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ShareList(files: newFiles)));
  }
}

void navigateToShareText(BuildContext context, String? value) {
  if (value != null && value.toString().isNotEmpty) {
    print('Shared Text');
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => UserListingScreen(
    //           files: [],
    //           text: value,
    //         )));
  }
}
