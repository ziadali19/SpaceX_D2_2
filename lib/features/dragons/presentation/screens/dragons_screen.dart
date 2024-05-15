import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spacex_d2_2/core/helpers/extensions.dart';
import 'package:spacex_d2_2/core/helpers/show_toast.dart';
import 'package:spacex_d2_2/core/routing/routes.dart';
import 'package:spacex_d2_2/features/dragons/controller/cubit/cubit/dragon_cubit.dart';
import 'package:spacex_d2_2/features/dragons/presentation/components/dragons_item.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/shimmer_widget.dart';

class DragonsScreen extends StatelessWidget {
  const DragonsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DragonsCubit>()..Get_all_Dragons(),
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
          BlocConsumer<DragonsCubit, DragonState>(
            listener: (context, state) {
              if (state is GetDragonsError) {
                showSnackBar(state.errorMsg, context, false);
              }
            },
            builder: (context, state) {
              if (state is GetDragonsLoading) {
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
              if (state is GetDragonsSuccess) {
                return SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  sliver: SliverList.separated(
                    itemCount: state.dragons!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return verticalSpace(20.h);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          context.pushNamed(Routes.DragonsScreen_Details,
                              arguments: state.dragons![index]);
                        },
                        child: DragonsItem(
                            imageUrl: state.dragons![index].flickrImages![0],
                            firstFlight: state.dragons![index].firstFlight!,
                            rocketName: state.dragons![index].name!),
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
