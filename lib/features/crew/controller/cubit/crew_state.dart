part of 'crew_cubit.dart';

sealed class CrewState extends Equatable {
  const CrewState();

  @override
  List<Object> get props => [];
}

final class CrewInitial extends CrewState {}

final class GetCrewLoading extends CrewState {}

final class GetCrewSuccess extends CrewState {
  final List<Crew>? crew;

  const GetCrewSuccess(this.crew);
}

final class GetCrewError extends CrewState {
  final String? errorMsg;

  const GetCrewError(this.errorMsg);
}
