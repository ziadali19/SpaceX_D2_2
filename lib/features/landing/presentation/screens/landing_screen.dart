import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/cubit/landing_cubit.dart';
import '../components/nav_bar_item.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LandingCubit(),
        child: BlocBuilder<LandingCubit, LandingState>(
          builder: (context, state) {
            LandingCubit cubit = context.read<LandingCubit>();
            return Scaffold(
              bottomNavigationBar: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: BottomNavigationBar(
                    backgroundColor: Colors.white.withOpacity(0.1),
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    elevation: 0,
                    currentIndex: cubit.selectedIndex,
                    onTap: (value) {
                      cubit.changeNavScreen(value);
                    },
                    items: [
                      navBarItem('Launches'),
                      navBarItem('Rockets'),
                    ]),
              ),
              body: context
                  .read<LandingCubit>()
                  .navScreens[context.read<LandingCubit>().selectedIndex],
            );
          },
        ));
  }
}
