import 'package:cpu_design_system/features/guic/guic.dart';
import 'package:cpu_design_system/features/guic/navigation_pane/nav_pane_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';

@immutable
class GuicState extends Equatable {
  final AsyncValue<List<NavigationPaneList>> navList;

  const GuicState({
    required this.navList,
  });

  GuicState copyWith({AsyncValue<List<NavigationPaneList>>? navList}) {
    // print('Guic State');
    // print(navList);
    return GuicState(
      navList: navList ?? this.navList,
    );
  }

  @override
  List<Object> get props => [navList];

  @override
  bool get stringify => true;
}
