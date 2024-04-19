import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:spacex_d2_2/core/helpers/extensions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/services/shared_perferences.dart';
import '../../../../core/utils/constants.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  // PageIndex
  int pageIndex = 0;
  changePageIndex(value) {
    pageIndex = value;
    emit(ChangeIndex());
  }

  // PageController
  PageController pageController = PageController();
  changePageController(BuildContext context) {
    if (pageIndex != 2) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    } else {
      CacheHelper.instance.saveData('onBoarding', true).then((value) {
        AppConstants.onBoarding = true;
        context.pushReplacementNamed(Routes.landing);
      });
    }
  }

  List<String> onBoardImages = [
    'onboarding1',
    'onboarding2',
    'onboarding3',
  ];
}
