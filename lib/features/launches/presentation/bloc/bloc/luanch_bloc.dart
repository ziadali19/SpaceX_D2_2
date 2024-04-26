import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:spacex_d2_2/core/network/api_error_handler.dart';
import 'package:spacex_d2_2/core/network/api_manger.dart';
import 'package:spacex_d2_2/features/launches/data/data_sources/remote/remote_ds.dart';
import 'package:spacex_d2_2/features/launches/data/data_sources/remote/remote_ds_impl.dart';
import 'package:spacex_d2_2/features/launches/data/repository/launches_repo_imp.dart';
import 'package:spacex_d2_2/features/launches/domain/entities/launches_entity.dart';
import 'package:spacex_d2_2/features/launches/domain/repositers/luanches_repo.dart';
import 'package:spacex_d2_2/features/launches/domain/usecases/upcoming_usecase.dart';

part 'luanch_event.dart';
part 'luanch_state.dart';

class LuanchBloc extends Bloc<LuanchEvent, LuanchState> {
  Apimanger apimanger;

  static LuanchBloc get(context) => BlocProvider.of(context);
  LuanchBloc(this.apimanger) : super(LuanchInitial()) {
    on<LuanchEvent>((event, emit) async {
      if (event is clicklaunch) {
        emit(state.copywith(ScreenStatus: ScreenStatus.loading));
        Remotedatasource remotedatasource = remote_ds_Impl(apimanger);
        Launcherepo launcherepo = LaunchesRepositoryImpl(remotedatasource);
        Upcomingusecase upcomingusecase = Upcomingusecase(launcherepo);
        try {
          LaunchesEntity launchesEntity = await upcomingusecase.call();
          emit(state.copywith(
              ScreenStatus: ScreenStatus.sucess,
              LaunchesEntity: launchesEntity));
        } on DioException catch (e) {
          emit(state.copywith(ScreenStatus: ScreenStatus.failure));
        }
      }
    });
  }
}
