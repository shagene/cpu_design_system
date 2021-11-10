import 'dart:convert';

import 'package:cpu_design_system/core/environment_variables.dart';
import 'package:cpu_design_system/features/guic/list_pane/list_pane_entity.dart';
import 'package:cpu_design_system/features/guic/navigation_pane/nav_pane_entity.dart';
import 'package:cpu_design_system/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navPaneRepositoryProvider = Provider<NavPaneRepository>((ref) {
  final dio = ref.watch(apiJsonProvider);
  return NavPaneRepository(dio: dio);
});

final listPaneRepositoryProvider = Provider<ListPaneRepository>((ref) {
  final dio = ref.watch(apiJsonProvider);
  return ListPaneRepository(dio: dio);
});

abstract class GuicRepository {
  Future<List> getNavList();
}

abstract class GuicListPaneRepository {
  Future<List<ListPaneEntity>> getListPane();
}

class NavPaneRepository implements GuicRepository {
  final Dio dio;
  const NavPaneRepository({required this.dio});

  @override
  Future<List<NavPaneEntity>> getNavList() async {
    final response = await dio.get(
      'navigation.json',
    );
    final results =
        List<Map<dynamic, dynamic>>.from(json.decode(response.data));
    final navLists = results.map((e) => NavPaneEntity.fromMap(e)).toList();
    return navLists;
  }
}

class ListPaneRepository implements GuicListPaneRepository {
  final Dio dio;
  const ListPaneRepository({required this.dio});

  @override
  Future<List<ListPaneEntity>> getListPane() async {
    final response = await dio.get(
      'components.json',
    );
    final results =
        List<Map<dynamic, dynamic>>.from(json.decode(response.data));
    final listPane = results.map((e) => ListPaneEntity.fromMap(e)).toList();
    return listPane;
  }
}
