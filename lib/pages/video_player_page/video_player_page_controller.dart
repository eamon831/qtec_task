import 'package:get/get.dart';

class VideoPlayerPageController extends GetxController {

  Rx<Map<String,dynamic>?> video=Rx<Map<String,dynamic>?>(null);

  @override
  void onInit() {
    // TODO: implement onInit
    video.value=(Get.arguments['video']);
    super.onInit();
  }

}