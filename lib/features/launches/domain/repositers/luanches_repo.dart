import 'package:spacex_d2_2/features/launches/domain/entities/launches_entity.dart';

abstract class Launcherepo {
  Future<LaunchesEntity> launches();
}
