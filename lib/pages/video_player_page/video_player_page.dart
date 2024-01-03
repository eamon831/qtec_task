import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qtec_task/extensions/string_extensions.dart';
import 'package:qtec_task/global_widget/channel_image_circle_view.dart';
import 'package:qtec_task/global_widget/column_icon_button.dart';
import 'package:qtec_task/global_widget/comment_card_view.dart';
import 'package:qtec_task/global_widget/subtitle_text_view.dart';
import 'package:qtec_task/global_widget/title_text_view.dart';
import 'package:qtec_task/pages/video_player_page/video_player_page_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:qtec_task/utils/input_decorations.dart';
import 'package:qtec_task/utils/utility_functions.dart';

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
                height: 200,
                color: Colors.black,
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTextView(text: mvc.video.value?['title'] ?? ''),
                        8.height,
                        Text(
                          '${mvc.video.value!['viewers']} views  .  ${formatTimeDifference(DateTime.parse(mvc.video.value!['created_at']))}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        16.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ColumnIconButton(
                              text: "Mash Allah (12k)",
                              iconPath: "heart".svgIcon(),
                            ),
                            ColumnIconButton(
                              text: "Like (12k)",
                              iconPath: "like".svgIcon(),
                            ),
                            ColumnIconButton(
                              text: "Share (12k)",
                              iconPath: "share".svgIcon(),
                            ),
                            ColumnIconButton(
                              text: "Report",
                              iconPath: "flag".svgIcon(),
                            ),
                          ],
                        ),
                        8.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: Get.height * 0.06,
                                  width: Get.height * 0.06,
                                  margin: const EdgeInsets.only(
                                    right: 5,
                                  ),
                                  child: ChannelImageCircleView(
                                    imageUrl: mvc.video.value!['channel_image'],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TitleTextView(
                                      text: mvc.video.value?['channel_name'] ??
                                          '',
                                    ),
                                    SubtitleTextView(
                                      text:
                                          '${mvc.video.value?['channel_subscriber'] ?? ''} subscribers',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color(0xff3898fc),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'SUBSCRIBE',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SubtitleTextView(text: 'Comments   7.5K'),
                            SvgPicture.asset(
                              'up_down'.svgIcon(),
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                        16.height,
                        SizedBox(
                          height: 47,
                          child: TextFormField(
                              decoration: globalInputDecoration.copyWith(
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'input_submit_icon'.svgIcon(),
                                height: 5,
                                width: 5,
                              ),
                            ),
                          )),
                        ),
                        8.height,
                        ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var comment = {
                              'profile_image_url':
                                  mvc.video.value!['channel_image'],
                              'commenter_name': "Fahmida khanom",
                              'created_at': "2 days",
                              'comment':
                                  "হুজুরের বক্তব্য গুলো ইংরেজি তে অনুবাদ করে সারা পৃথিবীর মানুষদের কে শুনিয়ে দিতে হবে। কথা গুলো খুব দামি",
                            };
                            return CommentCardView(comment: comment);
                          },
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
