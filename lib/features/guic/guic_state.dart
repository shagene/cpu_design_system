import 'package:cpu_design_system/features/guic/guic.dart';
import 'package:cpu_design_system/features/guic/list_pane/list_pane.dart';
import 'package:cpu_design_system/features/guic/navigation_pane/nav_pane_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';

@immutable
class GuicState extends Equatable {
  final AsyncValue<List<NavigationPaneList>> navList;
  final AsyncValue<List<ListPane>> listPane;

  const GuicState({
    required this.navList,
    required this.listPane,
  });

  GuicState copyWith({
    AsyncValue<List<NavigationPaneList>>? navList,
    AsyncValue<List<ListPane>>? listPane,
  }) {
    return GuicState(
      navList: navList ?? this.navList,
      listPane: listPane ?? this.listPane,
    );
  }

  @override
  List<Object> get props => [navList];

  @override
  bool get stringify => true;
}
