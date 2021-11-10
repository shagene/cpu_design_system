import 'package:cpu_design_system/features/guic/guic_service.dart';
import 'package:cpu_design_system/features/guic/guic_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final guicControllerProvider =
//     StateNotifierProvider.autoDispose<GuicController, GuicState>((ref) {
//   return GuicController(
//     const GuicState(
//       navList: AsyncValue.data([]),
//       listPane: AsyncValue.data([]),
//     ),
//     ref.watch(navPaneServiceProvider),
//   );
// });

final guicControllerProvider = StateNotifierProvider<GuicController, GuicState>(
  (ref) {
    return GuicController(
        const GuicState(
          navList: AsyncValue.data([]),
          listPane: AsyncValue.data([]),
        ),
        ref.watch(navPaneServiceProvider),
        ref.watch(listPaneServiceProvider));
  },
);

class GuicController extends StateNotifier<GuicState> {
  GuicController(
      GuicState state, this._guicNavService, this._guicListPaneService)
      : super(state) {
    loadNavList();
    loadListPane();
  }

  final GuicNavService _guicNavService;

  final GuicListPaneService _guicListPaneService;

  Future<void> loadNavList() async {
    state = state.copyWith(navList: const AsyncValue.loading());
    final result = await _guicNavService.getNavList();

    state = state.copyWith(navList: AsyncValue.data(result));
  }

  Future<void> loadListPane() async {
    state = state.copyWith(listPane: const AsyncValue.loading());
    final result = await _guicListPaneService.getListPane();
    state = state.copyWith(listPane: AsyncValue.data(result));
  }
}
