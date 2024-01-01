import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChannelImageCircleView extends StatelessWidget {
  final String imageUrl;
  const ChannelImageCircleView({super.key,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: Get.height*0.08,
      margin: const EdgeInsets.only(right: 5,),
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}
