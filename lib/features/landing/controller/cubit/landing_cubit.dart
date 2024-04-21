import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:spacex_d2_2/features/launches/presentation/screens/launches_screen.dart';
import 'package:spacex_d2_2/features/rockets/presentation/screens/rockets_screen.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingInitial());

  int selectedIndex = 0;
  List<Widget> navScreens = [const LaunchesScreen(), const RocketsScreen()];
  List<String> navIcons = ['home', 'setting'];
  changeNavScreen(int index) {
    selectedIndex = index;
    emit(ChangeNavIndex());
  }
}
