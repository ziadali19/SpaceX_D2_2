import 'package:spacex_d2_2/features/launches/data/models/launches_model.dart';

abstract class Remotedatasource {
  Future<LuanchModel> launches();
}
