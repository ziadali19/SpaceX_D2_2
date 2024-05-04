import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class Luanchesitem extends StatelessWidget {
  const Luanchesitem({
    super.key,
    required this.imageUrl,
    required this.rocket,
    required this.name,
  });
  final String imageUrl;
  final String rocket;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.18),
                blurRadius: 40.r,
                spreadRadius: 0,
                offset: const Offset(0, 0)),
          ],
          borderRadius: BorderRadius.circular(16.r),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageUrl))),
      child: Padding(
        padding: EdgeInsets.only(top: 105.h, left: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rocket,
              style: TextStyles.font18White700,
            ),
            Text(
              name,
              style: TextStyles.font18White700,
            )
          ],
        ),
      ),
    );
  }
}
