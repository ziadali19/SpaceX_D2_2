import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spacex_d2_2/core/theming/styles.dart';

BottomNavigationBarItem navBarItem(
  String label,
) {
  return BottomNavigationBarItem(
      activeIcon: Column(
        children: [
          Text(
            label,
            style: TextStyles.font16White400
                .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            width: 30.w,
            height: 3.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                shape: BoxShape.rectangle,
                color: Colors.white),
          )
        ],
      ),
      icon: Text(
        label,
        style: TextStyles.font16White400,
      ),
      label: '');
}
