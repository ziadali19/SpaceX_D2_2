import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spacex_d2_2/core/helpers/spacing.dart';
import 'package:spacex_d2_2/core/theming/styles.dart';
import 'package:spacex_d2_2/features/rockets/data/models/rockets_model.dart';

import '../../../../core/widgets/cached_images.dart';
import '../components/specifications_item.dart';

class RocketDetailsScreen extends StatelessWidget {
  const RocketDetailsScreen({super.key, required this.rocket});
  final Rocket rocket;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(rocket.name!)),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                DateFormat.yMMMMd().format(
                    DateTime.parse(rocket.firstFlight!).toUtc().toLocal()),
                style: TextStyles.font12Blue500,
              ),
              verticalSpace(10.h),
              Text(rocket.name!.toUpperCase(),
                  style: TextStyles.font24White700),
              verticalSpace(10.h),
              Text(
                rocket.description!,
                style: TextStyles.font14White400.copyWith(
                    fontWeight: FontWeight.w300, fontFamily: 'Roboto'),
              ),
              verticalSpace(26.h),
              Text('overview'.toUpperCase(), style: TextStyles.font24White700),
              verticalSpace(10.h),
              SpecificationsItem(
                  title: 'HEIGHT',
                  firstValue: '${rocket.height!.meters} m',
                  secondValue: ' / ${rocket.height!.feet} ft'),
              SpecificationsItem(
                  title: 'DIAMETER',
                  firstValue: '${rocket.diameter!.meters} m',
                  secondValue: ' / ${rocket.diameter!.feet} ft'),
              SpecificationsItem(
                  title: 'MASS',
                  firstValue: '${rocket.mass!.kg!} kg',
                  secondValue: ' / ${rocket.mass!.lb} lb'),
              verticalSpace(20.h),
              Text('FIRST STAGE', style: TextStyles.font24White700),
              verticalSpace(10.h),
              SpecificationsItem(
                  title: 'NUMBER OF ENGINES',
                  firstValue: '${rocket.firstStage!.engines}',
                  secondValue: ''),
              SpecificationsItem(
                  title: 'THRUST AT SEA LEVEL',
                  firstValue: '${rocket.firstStage!.thrustSeaLevel!.kN} kn',
                  secondValue:
                      ' / ${rocket.firstStage!.thrustSeaLevel!.lbf} lbf'),
              SpecificationsItem(
                  title: 'THRUST IN VACUUM',
                  firstValue: '${rocket.firstStage!.thrustVacuum!.kN} kn',
                  secondValue:
                      ' / ${rocket.firstStage!.thrustVacuum!.lbf} lbf'),
              verticalSpace(20.h),
              Text('SECOND STAGE', style: TextStyles.font24White700),
              verticalSpace(10.h),
              SpecificationsItem(
                  title: 'NUMBER OF ENGINES',
                  firstValue: '${rocket.secondStage!.engines}',
                  secondValue: ''),
              SpecificationsItem(
                  title: 'BURN TIME',
                  firstValue: '${rocket.secondStage!.burnTimeSec ?? 0} sec',
                  secondValue: ''),
              SpecificationsItem(
                  title: 'THRUST',
                  firstValue: '${rocket.secondStage!.thrust!.kN} kn',
                  secondValue: ' / ${rocket.secondStage!.thrust!.lbf} lbf'),
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
                      rocket.flickrImages!.length,
                      (index) => Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CachedImageItem(
                                  width: double.infinity,
                                  height: 400.h,
                                  url: rocket.flickrImages![index],
                                  radius: 16.r),
                              Positioned(
                                bottom: 10.h,
                                child: AnimatedSmoothIndicator(
                                  activeIndex: index,
                                  count: rocket.flickrImages!.length,
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
