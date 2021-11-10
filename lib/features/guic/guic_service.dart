import 'package:cpu_design_system/features/guic/guic.dart';
import 'package:cpu_design_system/features/guic/guic_repository.dart';
import 'package:cpu_design_system/features/guic/list_pane/list_pane.dart';
import 'package:cpu_design_system/features/guic/navigation_pane/nav_pane_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navPaneServiceProvider = Provider<GuicNavService>((ref) {
  final navPaneRepository = ref.watch(navPaneRepositoryProvider);
  return NavPaneService(navPaneRepository);
});

final listPaneServiceProvider = Provider<GuicListPaneService>((ref) {
  final listPaneRepository = ref.watch(listPaneRepositoryProvider);
  return ListPaneService(listPaneRepository);
});

abstract class GuicNavService {
  Future<List<NavigationPaneList>> getNavList();
}

abstract class GuicListPaneService {
  Future<List<ListPane>> getListPane();
}

class NavPaneService implements GuicNavService {
  NavPaneService(this._navPaneRepository);
  final NavPaneRepository _navPaneRepository;

  @override
  Future<List<NavigationPaneList>> getNavList() async {
    final navPaneEntity = await _navPaneRepository.getNavList();
    final navPaneList =
        navPaneEntity.map((e) => NavigationPaneList.fromEntity(e)).toList();

    return navPaneList;
  }
}

class ListPaneService implements GuicListPaneService {
  ListPaneService(this._listpaneRepository);
  final ListPaneRepository _listpaneRepository;

  @override
  Future<List<ListPane>> getListPane() async {
    final listPaneEntity = await _listpaneRepository.getListPane();
    final listPaneList =
        listPaneEntity.map((e) => ListPane.fromEntity(e)).toList();
    print('list pane service');
    print(listPaneList);
    return listPaneList;
  }
}
