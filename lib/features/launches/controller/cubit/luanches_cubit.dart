import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:spacex_d2_2/core/network/failure.dart';
import 'package:spacex_d2_2/features/launches/data/models/launches_model.dart';
import 'package:spacex_d2_2/features/launches/data/repository/launches_repository.dart';

part 'luanches_state.dart';

class LuanchesCubit extends Cubit<LuanchesState> {
  final BaseLunachesRepository baseLunachesRepository;
  LuanchesCubit(this.baseLunachesRepository) : super(LuanchesInitial());

  getLunaches() async {
    emit(Luanchesloading());

    Either<ApiErrorModel, List<LuanchModel>> result =
        await baseLunachesRepository.getLunaches();
    result.fold((left) {
      emit(LaunchesError(left.message));
    }, (r) {
      emit(Luanchesuccess(r));
    });
  }
}
