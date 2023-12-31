import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:qtec_task/pages/video_list_page/video_list_page_controller.dart';

class VideoListPage extends StatelessWidget {
  const VideoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    VideoListPageController mvc = Get.put(VideoListPageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video List Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Video List Page',
            ),
          ],
        ),
      ),
    );
  }
}
