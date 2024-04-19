import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spacex_d2_2/core/helpers/extensions.dart';
import 'package:spacex_d2_2/core/theming/styles.dart';
import 'package:spacex_d2_2/features/on_boarding/controller/cubit/on_boarding_cubit.dart';

import '../../../../core/helpers/spacing.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
          builder: (context, state) {
            return SafeArea(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  context.read<OnBoardingCubit>().changePageIndex(value);
                },
                controller: context.read<OnBoardingCubit>().pageController,
                itemCount: context.read<OnBoardingCubit>().onBoardImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/${context.read<OnBoardingCubit>().onBoardImages[index]}.png',
                        fit: BoxFit.cover,
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                      Image.asset(
                        'assets/images/spaceXLogo.png',
                        width: 200.w,
                        height: 24.5.h,
                      ),
                      verticalSpace(23.55.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60.w),
                        child: Text(
                          'Discover all upcoming and past rocket launches of SpaceX.',
                          style: TextStyles.font16White400.copyWith(
                            fontFamily: 'Roboto',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      verticalSpace(28.h),
                      ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r))),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      horizontal: 30.w, vertical: 13.h))),
                          onPressed: () {
                            context
                                .read<OnBoardingCubit>()
                                .changePageController(context);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                context.read<OnBoardingCubit>().pageIndex != 2
                                    ? 'NEXT'
                                    : 'START',
                                style: TextStyles.font16Black700
                                    .copyWith(letterSpacing: 1.w),
                              ),
                              horizontalSpace(7.w),
                              SvgPicture.asset('rightArrow'.svgPath()),
                            ],
                          )),
                      verticalSpace(40.h),
                      AnimatedSmoothIndicator(
                        activeIndex: context.read<OnBoardingCubit>().pageIndex,
                        count: context
                            .read<OnBoardingCubit>()
                            .onBoardImages
                            .length,
                        effect: WormEffect(
                            spacing: 16.w,
                            dotHeight: 8.h,
                            dotWidth: 8.w,
                            dotColor: Colors.white.withOpacity(0.49),
                            activeDotColor: Colors.white),
                      )
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
