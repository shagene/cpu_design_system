import 'package:cpu_design_system/features/guic/guic_service.dart';
import 'package:cpu_design_system/features/guic/guic_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final guicControllerProvider =
    StateNotifierProvider.autoDispose<GuicController, GuicState>((ref) {
  return GuicController(
    const GuicState(
      navList: AsyncValue.data([]),
    ),
    ref.watch(listPaneServiceProvider),
  );
});

class GuicController extends StateNotifier<GuicState> {
  GuicController(GuicState state, this._guicService) : super(state) {
    loadNavList();
  }

  final GuicService _guicService;
  Future<void> loadNavList() async {
    state = state.copyWith(navList: const AsyncValue.loading());
    final result = await _guicService.getNavList();

    state = state.copyWith(navList: AsyncValue.data(result));
  }
}
