import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spacex_d2_2/core/helpers/extensions.dart';
import 'package:spacex_d2_2/core/helpers/show_toast.dart';
import 'package:spacex_d2_2/core/routing/routes.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../../controller/cubit/rockets_cubit.dart';
import '../components/rocket_item.dart';

class RocketsScreen extends StatelessWidget {
  const RocketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RocketsCubit>()..getRockets(),
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
          BlocConsumer<RocketsCubit, RocketsState>(
            listener: (context, state) {
              if (state is GetRocketsError) {
                showSnackBar(state.errorMsg, context, false);
              }
            },
            builder: (context, state) {
              if (state is GetRocketsLoading) {
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
              if (state is GetRocketsSuccess) {
                return SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  sliver: SliverList.separated(
                    itemCount: state.rockets!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return verticalSpace(20.h);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          context.pushNamed(Routes.rocketDetails,
                              arguments: state.rockets![index]);
                        },
                        child: RocketItem(
                            imageUrl: state.rockets![index].flickrImages![0],
                            firstFlight: state.rockets![index].firstFlight!,
                            rocketName: state.rockets![index].name!),
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
