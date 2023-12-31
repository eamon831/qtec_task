import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtec_task/global_widget/column_icon_button.dart';
import 'package:qtec_task/global_widget/title_text_view.dart';
import 'package:qtec_task/pages/video_player_page/video_player_page_controller.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerPage extends StatelessWidget {
  const VideoPlayerPage({super.key});
  @override
  Widget build(BuildContext context) {
    VideoPlayerPageController mvc = Get.put(VideoPlayerPageController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 1,
      ),
      body: Column(
        children: [
          // Video Player
          Stack(
            children: [
              Container(
                height: 200, // Adjust the height as needed
                color: Colors.black, // Video player background color
                // Implement the video player widget here
                child: Chewie(
                  controller: mvc.chewieController,
                ),
              ),
              Positioned(
                child: InkWell(
                  onTap: () {
                    mvc.controller.dispose();
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          // Video Details
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextView(text: mvc.video.value?['title'] ?? ''),
                const SizedBox(height: 8),
                const Text(
                  'Views • Upload Date',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ColumnIconButton(text: "Mash Allah (12k)", icon: Icons.ac_unit),
                    ColumnIconButton(text: "Like (12k)", icon: Icons.thumb_up),
                    ColumnIconButton(text: "Share (12k)", icon: Icons.share),
                    ColumnIconButton(text: "Report", icon: Icons.flag),
                  ],
                ),
              ],
            ),
          ),
          // Video Description
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Video description goes here. It can be a long text that might need to be truncated with a "Show More" link.',
              maxLines: 3, // Limit the number of lines initially
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Recommended Videos
          Expanded(
            child: Container(
                // Implement the list of recommended videos here
                ),
          ),
        ],
      ),
    );
  }
}
