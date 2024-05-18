import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spacex_d2_2/core/helpers/show_toast.dart';
import 'package:spacex_d2_2/features/crew/controller/cubit/crew_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/shimmer_widget.dart';

class CrewScreen extends StatelessWidget {
  const CrewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CrewCubit>()..getCrew(),
      child: Scaffold(
        body:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverAppBar(
              pinned: true,
              leadingWidth: 200.w,
              leading: Row(
                children: [
                  horizontalSpace(20.w),
                  Image.asset(
                    'assets/images/spaceXLogo.png',
                    height: 20.h,
                    width: 163.w,
                  ),
                ],
              )),
          BlocConsumer<CrewCubit, CrewState>(
            listener: (context, state) {
              if (state is GetCrewError) {
                showSnackBar(state.errorMsg, context, false);
              }
            },
            builder: (context, state) {
              if (state is GetCrewLoading) {
                return SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  sliver: SliverList.separated(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const ShimmerWidget();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return verticalSpace(20.h);
                    },
                  ),
                );
              }
              if (state is GetCrewSuccess) {
                return SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  sliver: SliverList.separated(
                    itemCount: state.crew!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return verticalSpace(20.h);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 500.h,
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
                                fit: BoxFit.cover,
                                image:
                                    NetworkImage(state.crew![index].image!))),
                        child: Padding(
                          padding: EdgeInsets.only(top: 400.h, left: 24.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.crew![index].agency!,
                                style: TextStyles.font12Blue500,
                              ),
                              Text(
                                state.crew![index].name!,
                                style: TextStyles.font18White700,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
          )
        ]),
      ),
    );
  }
}
