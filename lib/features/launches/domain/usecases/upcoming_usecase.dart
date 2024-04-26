import 'package:spacex_d2_2/features/launches/domain/entities/launches_entity.dart';
import 'package:spacex_d2_2/features/launches/domain/repositers/luanches_repo.dart';

class Upcomingusecase {
  // ignore: non_constant_identifier_names
  Launcherepo launcherepo;
  Upcomingusecase(this.launcherepo);
  Future<LaunchesEntity> call() => launcherepo.launches();
}
