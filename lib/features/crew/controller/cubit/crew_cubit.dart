import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/network/failure.dart';
import '../../data/model/crew_model.dart';
import '../../data/repository/crew_repository.dart';

part 'crew_state.dart';

class CrewCubit extends Cubit<CrewState> {
  final BaseCrewRepository baseCrewRepository;
  CrewCubit(this.baseCrewRepository) : super(CrewInitial());

  getCrew() async {
    emit(GetCrewLoading());

    Either<ApiErrorModel, List<Crew>> result =
        await baseCrewRepository.getCrew();
    result.fold((l) {
      emit(GetCrewError(l.message));
    }, (r) {
      emit(GetCrewSuccess(r));
    });
  }
}
