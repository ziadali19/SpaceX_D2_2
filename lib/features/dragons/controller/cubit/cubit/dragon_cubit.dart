import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_d2_2/core/network/failure.dart';
import 'package:spacex_d2_2/features/dragons/data/repository/dragons_repository.dart';

import '../../../data/models/dragons_model.dart';

part 'dragon_state.dart';

class DragonsCubit extends Cubit<DragonState> {
  final BaseDragonsRepository baseDragonsRepository;
  DragonsCubit(this.baseDragonsRepository) : super(DragonInitial());

  // ignore: non_constant_identifier_names
  Get_all_Dragons() async {
    emit(GetDragonsLoading());

    Either<ApiErrorModel, List<Dragons>> result =
        await baseDragonsRepository.Get_all_Dragons();
    result.fold((l) {
      emit(GetDragonsError(l.message));
    }, (r) {
      emit(GetDragonsSuccess(r));
    });
  }
}
