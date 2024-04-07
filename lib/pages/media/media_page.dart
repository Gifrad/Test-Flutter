import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../bloc/image/image_bloc.dart';
import '../../bloc/video/video_bloc.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({super.key});

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  int index = 0;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          return BlocBuilder<VideoBloc, VideoState>(
            builder: (ctx, videoState) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.purple,
                  bottom: TabBar(
                      onTap: ((value) {
                        setState(() {
                          index = value;
                        });
                      }),
                      indicatorColor: Colors.white,
                      tabs: const [
                        Tab(
                          icon: Icon(Icons.camera_alt),
                          text: "Camera",
                        ),
                        Tab(
                          icon: Icon(Icons.perm_media_outlined),
                          text: 'Galery',
                        ),
                      ]),
                  title: const Text('MEDIA'),
                  centerTitle: true,
                ),
                body: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    state.image.isNotEmpty
                        ? GridView.builder(
                            itemCount: state.image.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.75 / 1,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2),
                            itemBuilder: (context, index) {
                              print(state.image.length);
                              final image = state.image[index];
                              return Image.file(File(image.path));
                            },
                          )
                        : const Center(
                            child: Text(
                              'Tidak Ada Foto',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                    videoState.video.isNotEmpty
                        ? GridView.builder(
                            itemCount: videoState.video.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.75 / 1,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2),
                            itemBuilder: (context, index) {
                              print(videoState.video.length);
                              final video = videoState.video[index];
                              return Image.file(File(video.path));
                            },
                          )
                        : const Center(
                            child: Text(
                              'Tidak Ada Data',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    if (index == 0) {
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.camera);
                      if (image != null) {
                        if (mounted) {}
                        context.read<ImageBloc>().add(
                              AddCamera(image),
                            );
                      }
                    } else if (index == 1) {
                      final List<XFile> video =
                          await picker.pickMultipleMedia();
                      if (video.isNotEmpty) {
                        if (mounted) {}
                        context.read<VideoBloc>().add(
                              AddVideo(video),
                            );
                      }
                    }
                  },
                  child: const Icon(Icons.add),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
              );
            },
          );
        },
      ),
    );
  }
}
