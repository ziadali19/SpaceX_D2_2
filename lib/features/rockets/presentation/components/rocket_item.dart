import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/theming/styles.dart';

class RocketItem extends StatelessWidget {
  const RocketItem({
    super.key,
    required this.imageUrl,
    required this.firstFlight,
    required this.rocketName,
  });
  final String imageUrl;
  final String firstFlight;
  final String rocketName;
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
              DateFormat.yMMMMd()
                  .format(DateTime.parse(firstFlight).toUtc().toLocal()),
              style: TextStyles.font12Blue500,
            ),
            Text(
              rocketName,
              style: TextStyles.font18White700,
            )
          ],
        ),
      ),
    );
  }
}
