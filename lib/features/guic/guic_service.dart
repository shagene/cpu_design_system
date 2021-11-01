import 'package:cpu_design_system/features/guic/guic_repository.dart';
import 'package:cpu_design_system/features/guic/navigation_pane/nav_pane_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final guicServiceProvider = Provider<GuicService>((ref) {
  throw UnimplementedError();
});

abstract class GuicService {
  Future<List> getData();
}

class ListPaneService implements GuicService {
  ListPaneService(this._listPaneRepository);
  final ListPaneRepository _listPaneRepository;

  @override
  Future<List> getData() async {
    final navPaneEntity = await _listPaneRepository.getData();
    final navPaneList =
        navPaneEntity.map((e) => NavigationPaneList.fromEntity(e)).toList();
    return navPaneList;
  }
}
