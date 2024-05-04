import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:spacex_d2_2/core/network/failure.dart';
import 'package:spacex_d2_2/features/rockets/data/models/rockets_model.dart';
import 'package:spacex_d2_2/features/rockets/data/repository/rockets_repository.dart';

part 'rockets_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  final BaseRocketsRepository baseRocketsRepository;
  RocketsCubit(this.baseRocketsRepository) : super(RocketsInitial());

  getRockets() async {
    emit(GetRocketsLoading());

    Either<ApiErrorModel, List<Rocket>> result =
        await baseRocketsRepository.getRockets();
    result.fold((l) {
      emit(GetRocketsError(l.message));
    }, (r) {
      emit(GetRocketsSuccess(r));
    });
  }
}
