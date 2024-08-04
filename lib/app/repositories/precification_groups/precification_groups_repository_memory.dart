import 'package:es3_proj/app/models/group_pricing_model.dart';
import 'package:es3_proj/app/repositories/precification_groups/precificaton_groups_repository.dart';

class PrecificationGroupsRepositoryMemory
    implements PrecificationGroupsRepository {
  final List<String> precificationGroupsStr = [
    "Bronze",
    "Prata",
    "Ouro",
    "Platina",
    "Diamante"
  ];

  @override
  Future<List<PrecificationGroup>> findAll() async {
    List<PrecificationGroup> precificationGroups =
        precificationGroupsStr.map<PrecificationGroup>((pGroup) {
      return PrecificationGroup(
          id: precificationGroupsStr.indexOf(pGroup), name: pGroup);
    }).toList();
    return precificationGroups;
  }
}
