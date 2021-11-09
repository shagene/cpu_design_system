import 'package:cpu_design_system/core/environment_variables.dart';
import 'package:cpu_design_system/features/guic/navigation_pane/nav_pane_entity.dart';
import 'package:cpu_design_system/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final listPaneRepositoryProvider = Provider<ListPaneRepository>((ref) {
  final dio = ref.watch(navJsonProvider);
  return ListPaneRepository(dio: dio);
});

abstract class GuicRepository {
  Future<List> getNavList();
}

class ListPaneRepository implements GuicRepository {
  final Dio dio;
  const ListPaneRepository({required this.dio});

  @override
  Future<List<NavPaneEntity>> getNavList() async {
    final response = await dio.get(
      'navigation.json',
    );
    print('response');
    print(response.data);
    print('set results');
    final results =
        List<Map<String, dynamic>>.from(response.data['Navigation']);
    print('after results');
    final navLists = results.map((e) => NavPaneEntity.fromMap(e)).toList();
    print('navLists');
    print(navLists);
    return navLists;
  }
}
