part of 'luanch_bloc.dart';

enum ScreenStatus {init, loading, sucess, failure }

class LuanchState {
  final ScreenStatus? screenStatus;
  final LaunchesEntity? launchesEntity;
  LuanchState({this.screenStatus, this.launchesEntity});
  LuanchState copywith(
      {ScreenStatus? ScreenStatus, LaunchesEntity? LaunchesEntity}) {
    return LuanchState(
        screenStatus: screenStatus ?? this.screenStatus,
        launchesEntity: launchesEntity ?? this.launchesEntity);
  }
}

final class LuanchInitial extends LuanchState {
  LuanchInitial()
      : super(screenStatus: ScreenStatus.init, launchesEntity: null);
}
