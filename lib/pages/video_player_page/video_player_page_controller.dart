import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtec_task/global_widget/cached_image_view.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPageController extends GetxController {

  Rx<Map<String,dynamic>?> video=Rx<Map<String,dynamic>?>(null);
  late VideoPlayerController controller;
  late ChewieController chewieController;



  @override
  void onInit() {
    // TODO: implement onInit
    video.value=(Get.arguments['video']);
    controller = VideoPlayerController.networkUrl(Uri.parse(video.value!['manifest']));
    chewieController = ChewieController(
      videoPlayerController: controller,
      autoPlay: false,
      looping: false,
      autoInitialize: false,
      placeholder: Container(
        color: Colors.black,
        child: CachedImageView(
          height: 200,
          imageUrl: video.value!['thumbnail'],
        )
      ),
    );
    super.onInit();
  }
  @override
  void dispose() {
    controller.dispose();
    chewieController.dispose();
    super.dispose();
  }

}