import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qtec_task/extensions/string_extensions.dart';
import 'package:qtec_task/global_widget/cached_image_view.dart';
import 'package:qtec_task/global_widget/channel_image_circle_view.dart';
import 'package:qtec_task/global_widget/global_text_view.dart';
import 'package:qtec_task/model/video_model.dart';
import 'package:qtec_task/utils/constants.dart';
import 'package:qtec_task/utils/utility_functions.dart';

class VideoCardView extends StatelessWidget {
  final VideoModel video;
  final VoidCallback onTap;
  const VideoCardView({super.key, required this.video, required this.onTap});

  @override
  Widget build(BuildContext context) {
    String formattedDate = formatDate(video.createdAt);

    return InkWell(
      onTap: onTap,
      child: Container(
        //padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                CachedImageView(
                  imageUrl: video.thumbnail!,
                  height: 192,
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      video.duration!,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            10.height,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ChannelImageCircleView(
                      imageUrl: video.channelImage!,
                    ),
                  ),
                  5.width,
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlobalTextView(
                          text: video.title!,
                          fontFamily: FONT_FAMILY_HIND_SILIGURI,
                          fontSize: 15,
                          fontWeight: 600,
                        ),
                        GlobalTextView(
                          text: "${video.viewers??''} views . $formattedDate",
                          fontFamily: FONT_FAMILY_INTER,
                          fontSize: 13,
                          fontWeight: 400,

                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SvgPicture.asset(
                      'more_vert'.svgIcon(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
