import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spacex_d2_2/core/helpers/show_toast.dart';

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
        appBar: AppBar(
          title: const Text('Rockets'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: BlocConsumer<RocketsCubit, RocketsState>(
              listener: (context, state) {
                if (state is GetRocketsError) {
                  showSnackBar(state.errorMsg, context, false);
                }
              },
              builder: (context, state) {
                if (state is GetRocketsLoading) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 4,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 20.h,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return const ShimmerWidget();
                    },
                  );
                }
                if (state is GetRocketsSuccess) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.rockets!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return verticalSpace(20.h);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return RocketItem(
                          imageUrl: state.rockets![index].flickrImages![0],
                          firstFlight: state.rockets![index].firstFlight!,
                          rocketName: state.rockets![index].name!);
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
