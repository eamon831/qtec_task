import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qtec_task/extensions/string_extensions.dart';
import 'package:qtec_task/global_widget/cached_image_view.dart';
import 'package:qtec_task/global_widget/channel_image_circle_view.dart';
import 'package:qtec_task/global_widget/column_icon_button.dart';
import 'package:qtec_task/global_widget/comment_card_view.dart';
import 'package:qtec_task/global_widget/global_text_view.dart';
import 'package:qtec_task/pages/video_player_page/video_player_page_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:qtec_task/utils/constants.dart';
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
      body: WillPopScope(
        onWillPop: () async {
          mvc.controller.dispose();
          Get.back();
          return Future.value(false);
        },
        child: Column(
          children: [
            // Video Player
            Stack(
              children: [
                Obx(
                  () => mvc.chewieController.value.isPlaying
                      ? Container(
                          height: Get.height * 0.3,
                          color: Colors.black,
                          child: Chewie(
                            controller: mvc.chewieController.value,
                          ),
                        )
                      : Stack(
                          children: [
                            CachedImageView(
                              imageUrl: mvc.video.value!.thumbnail!,
                              height: Get.height * 0.3,
                            ),
                            Positioned(
                              top: Get.height * 0.15,
                              left: Get.width * 0.4,
                              child: InkWell(
                                onTap: () {
                                  mvc.chewieController.value.play();
                                  mvc.chewieController.refresh();
                                },
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
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
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalTextView(
                            text: mvc.video.value?.title ?? '',
                            fontFamily: FONT_FAMILY_HIND_SILIGURI,
                            fontSize: 15,
                            fontWeight: 600,
                          ),
                          8.height,
                          GlobalTextView(
                            text: '${mvc.video.value!.viewers} views  .  ${formatTimeDifference(mvc.video.value!.createdAt!)}',
                            fontSize: 12,
                            fontWeight: 400,
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
                                      imageUrl:
                                          mvc.video.value!.channelImage!,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GlobalTextView(
                                        text: mvc.video.value?.channelName ?? '',
                                        fontSize: 14,
                                        fontWeight: 500,
                                      ),
                                      GlobalTextView(
                                        text: '${mvc.video.value?.channelSubscriber ?? ''} subscribers',
                                        fontSize: 11,
                                        fontWeight: 400,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xff3898fc),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
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
                              const GlobalTextView(text: 'Comments   7.5K',
                              fontSize: 12,
                              fontWeight: 400,
                              ),
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
                                  child: SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        'input_submit_icon'.svgIcon(),
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                hintText: 'Add Comment',
                                suffixIconConstraints: const BoxConstraints(
                                  maxHeight: 40,
                                  maxWidth: 40,
                                ),
                              ),
                            ),
                          ),
                          8.height,
                          ListView.builder(
                            itemCount: 1,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var comment = {
                                'profile_image_url':
                                    mvc.video.value!.channelImage,
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
                    const Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
