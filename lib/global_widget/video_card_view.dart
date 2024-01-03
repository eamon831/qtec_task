import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qtec_task/extensions/string_extensions.dart';
import 'package:qtec_task/global_widget/cached_image_view.dart';
import 'package:qtec_task/global_widget/channel_image_circle_view.dart';
import 'package:qtec_task/global_widget/global_text_view.dart';
import 'package:qtec_task/utils/constants.dart';
import 'package:qtec_task/utils/utility_functions.dart';

class VideoCardView extends StatelessWidget {
  final Map<String, dynamic> video;
  final VoidCallback onTap;
  const VideoCardView({super.key, required this.video, required this.onTap});

  @override
  Widget build(BuildContext context) {
    String formattedDate = formatDate(video['created_at']);

    return InkWell(
      onTap: onTap,
      child: Container(
        //padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                CachedImageView(
                  imageUrl: video['thumbnail'],
                  height: 200,
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
                      video['duration'],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ChannelImageCircleView(
                      imageUrl: video['channel_image'],
                    ),
                  ),
                  5.width,
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlobalTextView(
                          text: video['title'],
                          fontFamily: FONT_FAMILY_HIND_SILIGURI,
                          fontSize: 15,
                          fontWeight: 600,
                        ),
                        GlobalTextView(
                          text: "${video['viewers']} views . $formattedDate",
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
