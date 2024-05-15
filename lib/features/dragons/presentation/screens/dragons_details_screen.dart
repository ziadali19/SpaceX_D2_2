import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spacex_d2_2/core/helpers/spacing.dart';
import 'package:spacex_d2_2/core/theming/styles.dart';
import 'package:spacex_d2_2/features/dragons/data/models/dragons_model.dart';
import '../../../../core/widgets/cached_images.dart';
import '../components/specifications_item.dart';

class DragonDetailsScreen extends StatelessWidget {
  const DragonDetailsScreen({super.key, required this.dragons});
  final Dragons dragons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(dragons.name!)),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                DateFormat.yMMMMd().format(
                    DateTime.parse(dragons.firstFlight!).toUtc().toLocal()),
                style: TextStyles.font12Blue500,
              ),
              verticalSpace(10.h),
              Text(dragons.name!.toUpperCase(),
                  style: TextStyles.font24White700),
              verticalSpace(10.h),
              Text(
                dragons.description!,
                style: TextStyles.font14White400.copyWith(
                    fontWeight: FontWeight.w300, fontFamily: 'Roboto'),
              ),
              verticalSpace(26.h),
              Text('overview'.toUpperCase(), style: TextStyles.font24White700),
              verticalSpace(10.h),
              SpecificationsItem(
                  title: 'HEIGHT',
                  firstValue: '${dragons.heightWTrunk!.meters} m',
                  secondValue: ' / ${dragons.heightWTrunk!.feet} ft'),
              SpecificationsItem(
                  title: 'DIAMETER',
                  firstValue: '${dragons.diameter!.meters} m',
                  secondValue: ' / ${dragons.diameter!.feet} ft'),
              SpecificationsItem(
                  title: 'MASS',
                  firstValue: '${dragons.dryMassKg!} kg',
                  secondValue: ' / ${dragons.dryMassLb!} lb'),
              verticalSpace(20.h),
              Text('FIRST STAGE', style: TextStyles.font24White700),
              verticalSpace(10.h),
              SpecificationsItem(
                  title: 'NUMBER OF ENGINES',
                  firstValue: dragons.firstFlight!,
                  secondValue: ''),
              SpecificationsItem(
                  title: 'THRUST AT SEA LEVEL',
                  firstValue: '${dragons.trunk!.trunkVolume!.cubicMeters} kn',
                  secondValue: ' / ${dragons.trunk!.cargo!} lbf'),
              verticalSpace(20.h),
              Text('GALLERY', style: TextStyles.font24White700),
              verticalSpace(10.h),
              CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 0.8,
                      disableCenter: true,
                      padEnds: false,
                      enlargeCenterPage: true,
                      height: 400.h,
                      enableInfiniteScroll: false),
                  items: List.generate(
                      dragons.flickrImages!.length,
                      (index) => Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CachedImageItem(
                                  width: double.infinity,
                                  height: 400.h,
                                  url: dragons.flickrImages![index],
                                  radius: 16.r),
                              Positioned(
                                bottom: 10.h,
                                child: AnimatedSmoothIndicator(
                                  activeIndex: index,
                                  count: dragons.flickrImages!.length,
                                  effect: WormEffect(
                                      spacing: 16.w,
                                      dotHeight: 10.h,
                                      dotWidth: 10.w,
                                      dotColor: Colors.white.withOpacity(0.49),
                                      activeDotColor: Colors.white),
                                ),
                              )
                            ],
                          ))),
            ]),
          ),
        ));
  }
}
