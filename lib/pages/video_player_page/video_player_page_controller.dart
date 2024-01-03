import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:qtec_task/model/video_model.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPageController extends GetxController {

  Rx<VideoModel?> video=Rx<VideoModel?>(null);
  late VideoPlayerController controller;
  late Rx<ChewieController> chewieController;



  @override
  void onInit() {
    // TODO: implement onInit
    video.value=(Get.arguments['video']);
    controller = VideoPlayerController.networkUrl(Uri.parse(video.value!.manifest!));
    chewieController = ChewieController(
      videoPlayerController: controller,
      autoPlay: true,
      looping: false,
      autoInitialize: false,
    ).obs;
    super.onInit();
  }
  @override
  void dispose() {
    controller.dispose();
    chewieController.value.dispose();
    super.dispose();
  }

}