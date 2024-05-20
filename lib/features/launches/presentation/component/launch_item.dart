// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/theming/styles.dart';

class Luanchesitem extends StatelessWidget {
  const Luanchesitem({
    Key? key,
    //required this.time,
    required this.imageUrl,
    required this.data,
    required this.name,
  }) : super(key: key);
  final String imageUrl;
  //final String time;
  final dynamic data;
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
              DateFormat.yMMMM()
                  .format(DateTime.parse('${data}').toUtc().toLocal()),
              style: TextStyles.font12Blue500,
            ),
            //   Text(
            //  //   rocket,
            //  //   style: TextStyles.font18White700,
            //   ),
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
