import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (mvc.videoList.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mvc.videoList.length,
                itemBuilder: (context, index) {
                  var video = mvc.videoList[index];
                  return ListTile(
                    title: Text(video!['title']),
                  );
                },
              );
            }),
            Obx(() {
              if (mvc.videoList.isEmpty) {
                return const SizedBox();
              }
              return ElevatedButton(
                onPressed: () {
                  mvc.fetchNewTenVideos();
                },
                child: const Text('Load More'),
              );
            }),
          ],
        ),
      )
    );
  }
}
