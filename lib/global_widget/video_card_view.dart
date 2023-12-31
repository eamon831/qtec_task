import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


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
            Image.network(
              video['thumbnail'],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: Get.height*0.08,
                    margin: EdgeInsets.only(right: 5,),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(video['channel_image']),
                        fit: BoxFit.cover,
                      ),
                    ),

                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video['title'],
                        style: GoogleFonts.hindSiliguri(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),

                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "${video['viewers']} views . $formattedDate",
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    )

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(String originalDate) {
    DateTime dateTime = DateTime.parse(originalDate);
    String formattedDate = DateFormat.yMMMd().format(dateTime);
    return formattedDate;
  }
}
