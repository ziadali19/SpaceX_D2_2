part of 'dragon_cubit.dart';

sealed class DragonState extends Equatable {
  const DragonState();

  @override
  List<Object> get props => [];
}

final class DragonInitial extends DragonState {}

final class GetDragonsLoading extends DragonState {}

final class GetDragonsSuccess extends DragonState {
  final List<Dragons>? dragons;

  GetDragonsSuccess(this.dragons);
}

final class GetDragonsError extends DragonState {
  final String? errorMsg;

  GetDragonsError(this.errorMsg);
}
