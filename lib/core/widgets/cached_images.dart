import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedImageItem extends StatelessWidget {
  const CachedImageItem({
    Key? key,
    required this.width,
    required this.height,
    required this.url,
    required this.radius,
  }) : super(key: key);
  final double width;
  final double height;
  final String url;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width, // 307.w,
      height: height, //186.h,
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (
        context,
        url,
      ) =>
          Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        height: 40.h,
        width: 40.w,
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
