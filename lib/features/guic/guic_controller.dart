import 'package:cpu_design_system/features/guic/guic_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final guicControllerProvider =
    StateNotifierProvider.autoDispose<GuicController, GuicState>((ref) {
  throw '';
});

class GuicController extends StateNotifier<GuicState> {
  GuicController(GuicState state) : super(state) {}
}
