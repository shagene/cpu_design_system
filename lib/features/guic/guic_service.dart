import 'package:cpu_design_system/features/guic/guic.dart';
import 'package:cpu_design_system/features/guic/guic_repository.dart';
import 'package:cpu_design_system/features/guic/navigation_pane/nav_pane_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final listPaneServiceProvider = Provider<GuicService>((ref) {
  final listPaneRepository = ref.watch(listPaneRepositoryProvider);
  return ListPaneService(listPaneRepository);
});

abstract class GuicService {
  Future<List<NavigationPaneList>> getNavList();
}

class ListPaneService implements GuicService {
  ListPaneService(this._listPaneRepository);
  final ListPaneRepository _listPaneRepository;

  @override
  Future<List<NavigationPaneList>> getNavList() async {
    final navPaneEntity = await _listPaneRepository.getNavList();
    final navPaneList =
        navPaneEntity.map((e) => NavigationPaneList.fromEntity(e)).toList();

    return navPaneList;
  }
}
