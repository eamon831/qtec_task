import 'package:get/get.dart';
import 'package:qtec_task/api_provider/api_provider.dart';

class VideoListPageController extends GetxController {

  RxList<Map<String,dynamic>?> videoList = RxList<Map<String,dynamic>?>();
  var page = 1.obs;

  @override
  void onInit() {
    fetchNewTenVideos();
    super.onInit();
  }

  Future<void> fetchNewTenVideos() async {
    await ApiProvider().fetchNewTenVideos(page: page.toString()).then((value) {
      videoList.addAll(value);
      page.value++;
    });

  }

}