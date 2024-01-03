import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qtec_task/global_widget/channel_image_circle_view.dart';
import 'package:qtec_task/global_widget/global_text_view.dart';
import 'package:qtec_task/utils/constants.dart';

class CommentCardView extends StatelessWidget {
  final Map<String, dynamic> comment;
  const CommentCardView({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            height: Get.height * 0.06,
            width: Get.height * 0.06,
            margin: const EdgeInsets.only(
              right: 5,
            ),
            child: ChannelImageCircleView(
                imageUrl:comment['profile_image_url']
            ),
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GlobalTextView(
                  text: "${comment['commenter_name']}",
                  fontSize: 12,
                  fontWeight: 500,
                ),
                20.width,
                GlobalTextView(
                  text: "${comment['created_at']}",
                  fontSize: 8,
                  fontWeight: 400,
                ),
              ],
            ),
            5.height,
            SizedBox(
              width: Get.width*0.82,
              child: GlobalTextView(
                text: comment['comment'],
                fontFamily: FONT_FAMILY_HIND_SILIGURI,
                fontSize: 12,
                fontWeight: 400,
              ),
            ),


          ],
        ),
      ],
    );
  }
}
