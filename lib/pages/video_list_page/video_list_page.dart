import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtec_task/global_widget/global_text_view.dart';
import 'package:qtec_task/global_widget/video_card_view.dart';
import 'package:qtec_task/pages/video_list_page/video_list_page_controller.dart';
import 'package:qtec_task/pages/video_player_page/video_player_page.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qtec_task/utils/constants.dart';

class VideoListPage extends StatelessWidget {
  const VideoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    VideoListPageController mvc = Get.put(VideoListPageController());
    return Scaffold(
      appBar: AppBar(
        title: const GlobalTextView(
          text: 'Trending Page',
          fontFamily: FONT_FAMILY_INTER,
          fontSize: 20,
          fontWeight:700,

        ),
      ),
      body: Obx(
        () {
          if (mvc.data.value == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SizedBox(
              height: Get.height * 0.9,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: mvc.data.value!.length + (mvc.isFetchingNewVideos.value ? 1 : 0),
                physics: const ScrollPhysics(),
                controller: mvc.scrollController,
                itemBuilder: (context, index) {
                  if (index == mvc.data.value!.length) {
                    return Column(
                      children: [
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                        10.height,
                      ],
                    );
                  }
                  var video = mvc.data.value![index];
                  return VideoCardView(
                    video: video,
                    onTap: () {
                      Get.to(
                        const VideoPlayerPage(),
                        arguments: {
                          'video': video,
                        },
                      );
                    },
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
