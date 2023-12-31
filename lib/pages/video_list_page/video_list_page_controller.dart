import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtec_task/api_provider/api_provider.dart';

class VideoListPageController extends GetxController {
  Rx<List<Map<String,dynamic>>?> data=Rx<List<Map<String,dynamic>>?>(null);
  ScrollController scrollController = ScrollController();
  var isFetchingNewVideos = true.obs;
  int page=1;

  @override
  void onInit() {
    scrollController.addListener(_onScroll);
    fetData();
    super.onInit();
  }
  Future<void> fetData() async {
   await ApiProvider().fetchNewVideos(page: page.toString()).then((value) {
     if (value!=null && value.isNotEmpty) {
       data.value ??= [];
       data.value!.addAll(value);
       page++;
       data.refresh();
     }
   });
   update();
  }
  Future<void> _onScroll() async {
    print("I am attached");

    if ((scrollController.position.atEdge && scrollController.position.pixels > 0) || data.value==null) {
      isFetchingNewVideos.value=true;
      print("i am working");
      await fetData();
    }else{
      isFetchingNewVideos.value=false;
    }
  }


}