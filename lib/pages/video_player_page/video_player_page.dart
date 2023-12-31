import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:qtec_task/pages/video_player_page/video_player_page_controller.dart';

class VideoPlayerPage extends StatelessWidget {
  const VideoPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    VideoPlayerPageController mvc = Get.put(VideoPlayerPageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Video Player Page',
            ),
          ],
        ),
      ),
    );
  }
}
