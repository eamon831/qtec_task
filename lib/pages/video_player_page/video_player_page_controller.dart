import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPageController extends GetxController {

  Rx<Map<String,dynamic>?> video=Rx<Map<String,dynamic>?>(null);
  late VideoPlayerController controller;
  late Rx<ChewieController> chewieController;



  @override
  void onInit() {
    // TODO: implement onInit
    video.value=(Get.arguments['video']);
    controller = VideoPlayerController.networkUrl(Uri.parse(video.value!['manifest']));
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