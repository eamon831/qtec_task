import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ChannelImageCircleView extends StatelessWidget {
  final String imageUrl;
  const ChannelImageCircleView({super.key,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: Get.height*0.08,
        margin: const EdgeInsets.only(right: 5,),
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),

      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: Get.height*0.08,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          )
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
