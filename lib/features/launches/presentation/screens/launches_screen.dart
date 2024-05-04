import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spacex_d2_2/core/helpers/extensions.dart';
import 'package:spacex_d2_2/core/helpers/show_toast.dart';
import 'package:spacex_d2_2/core/routing/routes.dart';
import 'package:spacex_d2_2/features/launches/controller/cubit/luanches_cubit.dart';
import 'package:spacex_d2_2/features/launches/data/models/launches_model.dart';
import 'package:spacex_d2_2/features/launches/presentation/component/launch_item.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/shimmer_widget.dart';

class LaunchesScreen extends StatelessWidget {
  const LaunchesScreen({super.key, LuanchModel? luanchModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LuanchesCubit>()..getLunaches(),
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
          BlocConsumer<LuanchesCubit, LuanchesState>(
            listener: (context, state) {
              if (state is LaunchesError) {
                showSnackBar(state.errorMsg, context, false);
              }
            },
            builder: (context, state) {
              if (state is Luanchesloading) {
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
              if (state is Luanchesuccess) {
                return SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  sliver: SliverList.separated(
                    itemCount: state.luanchModel!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return verticalSpace(20.h);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          context.pushNamed(Routes.luanches_details_Screen);
                        },
                        child: Luanchesitem(
                          imageUrl:
                              state.luanchModel![index].links!.patch!.large![0],
                          rocket: state.luanchModel![index].rocket as String,
                          name: state.luanchModel![index].name!,
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
