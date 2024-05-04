part of 'rockets_cubit.dart';

@immutable
sealed class RocketsState {}

final class RocketsInitial extends RocketsState {}

final class GetRocketsLoading extends RocketsState {}

final class GetRocketsSuccess extends RocketsState {
  final List<Rocket>? rockets;

  GetRocketsSuccess(this.rockets);
}

final class GetRocketsError extends RocketsState {
  final String? errorMsg;

  GetRocketsError(this.errorMsg);
}
