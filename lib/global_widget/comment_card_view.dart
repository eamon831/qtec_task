import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtec_task/global_widget/channel_image_circle_view.dart';
import 'package:qtec_task/global_widget/subtitle_text_view.dart';
import 'package:qtec_task/global_widget/title_text_view.dart';

class CommentCardView extends StatelessWidget {
  final Map<String, dynamic> comment;
  const CommentCardView({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: Get.height * 0.06,
          width: Get.height * 0.06,
          margin: const EdgeInsets.only(
            right: 5,
          ),
          child: ChannelImageCircleView(
              imageUrl:comment['profile_image_url']
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width*0.82,
              child: TitleTextView(
                text: "${comment['commenter_name']}    ${comment['created_at']}",
              ),
            ),
            SizedBox(
              width: Get.width*0.82,
              child: SubtitleTextView(
                text: comment['comment'],
              ),
            ),


          ],
        ),
      ],
    );
  }
}
