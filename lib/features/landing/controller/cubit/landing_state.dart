part of 'landing_cubit.dart';

@immutable
sealed class LandingState {}

final class LandingInitial extends LandingState {}

final class ChangeNavIndex extends LandingState {}
