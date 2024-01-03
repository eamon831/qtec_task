import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtec_task/api_provider/api_provider.dart';
import 'package:qtec_task/model/video_model.dart';

class VideoListPageController extends GetxController {
  Rx<List<VideoModel>?> data = Rx<List<VideoModel>?>(null);
  ScrollController scrollController = ScrollController();
  var isFetchingNewVideos = true.obs;
  int page = 1;

  @override
  void onInit() {
    scrollController.addListener(_onScroll);
    fetData();
    super.onInit();
  }

  Future<void> fetData() async {
    await ApiProvider().fetchNewVideos(page: page.toString()).then(
      (value) {
        if (value != null && value.isNotEmpty) {
          data.value ??= [];
          data.value!.addAll(value);
          page++;
          data.refresh();
        }
      },
    );
    update();
  }

  Future<void> _onScroll() async {
    if ((scrollController.position.atEdge && scrollController.position.pixels > 0) || data.value == null) {
      isFetchingNewVideos.value = true;
      await fetData();
    } else {
      isFetchingNewVideos.value = false;
    }
  }
}
