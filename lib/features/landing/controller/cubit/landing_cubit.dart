import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:spacex_d2_2/features/dragons/presentation/screens/dragons_screen.dart';
import 'package:spacex_d2_2/features/launches/presentation/screens/launches_screen.dart';
import 'package:spacex_d2_2/features/rockets/presentation/screens/rockets_screen.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingInitial());

  int selectedIndex = 0;
  List<Widget> navScreens = [
    const LaunchesScreen(),
    const RocketsScreen(),
    const DragonsScreen(),
  ];

  changeNavScreen(int index) {
    selectedIndex = index;
    emit(ChangeNavIndex());
  }
}
