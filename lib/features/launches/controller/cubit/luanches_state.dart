part of 'luanches_cubit.dart';

@immutable
sealed class LuanchesState {}

final class LuanchesInitial extends LuanchesState {}

final class Luanchesloading extends LuanchesState {}

final class Luanchesuccess extends LuanchesState {
  final List<LuanchModel>? luanchModel;

  Luanchesuccess(this.luanchModel);
}

final class LaunchesError extends LuanchesState {
  final String? errorMsg;

  LaunchesError(this.errorMsg);
}
