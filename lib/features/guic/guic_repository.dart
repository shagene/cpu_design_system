import 'package:cpu_design_system/core/environment_variables.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final guicRepositoryProvider = Provider<GuicRepository>((ref) {
  throw UnimplementedError();
});

abstract class GuicRepository {
  Future<List> getData();
}

class ListPaneRepository implements GuicRepository {
  final Dio dio;
  const ListPaneRepository({required this.dio});

  @override
  Future<List> getData() async {
    final response = await dio.get(
      'genre/movie/list',
      queryParameters: {
        'api_key': api,
        'language': 'en-US',
      },
    );
    final results = List<Map<String, dynamic>>.from(response.data['genres']);
    return results;
  }
}
