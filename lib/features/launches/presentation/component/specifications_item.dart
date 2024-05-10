// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../core/helpers/spacing.dart';
// import '../../../../core/theming/styles.dart';

// class SpecificationsItem extends StatelessWidget {
//   const SpecificationsItem({
//     super.key,
//     required this.title,
//     required this.firstValue,
//     required this.secondValue,
//   });

//   final String title;
//   final String firstValue;
//   final String secondValue;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             SizedBox(
//                 width: MediaQuery.sizeOf(context).width * 0.3,
//                 child: Text(title, style: TextStyles.font14White400)),
//             const Spacer(),
//             Expanded(
//               child: RichText(
//                 text: TextSpan(
//                     children: [
//                       TextSpan(
//                           text: secondValue,
//                           style: TextStyles.font14White400.copyWith(
//                               color: Colors.grey,
//                               fontFamily: 'RobotoCondensed')),
//                     ],
//                     text: firstValue,
//                     style: TextStyles.font14White400.copyWith(
//                       fontFamily: 'RobotoCondensed',
//                     )),
//               ),
//             )
//           ],
//         ),
//         verticalSpace(10.h),
//         const Divider(
//           color: Colors.grey,
//         ),
//         verticalSpace(10.h),
//       ],
//     );
//   }
// }
