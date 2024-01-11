import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({super.key});

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  File? videoFile;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
              },
              child: const Text('Pick Gallery'),
            ),
            TextButton(
              onPressed: () async {
                final XFile? image =
                    await picker.pickImage(source: ImageSource.camera);
              },
              child: const Text('Pick Camera'),
            ),
            TextButton(
              onPressed: () async {
                final XFile? image =
                    await picker.pickVideo(source: ImageSource.gallery);
              },
              child: const Text('Pick File'),
            ),
          ],
        ),
      ),
    );
  }
}
