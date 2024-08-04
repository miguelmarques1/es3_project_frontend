import 'package:es3_proj/app/models/group_pricing_model.dart';

abstract class PrecificationGroupsRepository {
  Future<List<PrecificationGroup>> findAll();
}
