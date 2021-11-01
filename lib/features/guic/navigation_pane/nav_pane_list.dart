import 'package:cpu_design_system/features/guic/navigation_pane/nav_pane_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

// Unidirectional data flow
@immutable
class NavigationPaneList extends Equatable {
  final String navOrder;
  final String categoryNavLink;
  final Icon matIcon;

  const NavigationPaneList({
    required this.navOrder,
    required this.categoryNavLink,
    required this.matIcon,
  });

  factory NavigationPaneList.fromEntity(NavPaneEntity entity) {
    return NavigationPaneList(
        navOrder: entity.navOrder,
        categoryNavLink: entity.categoryNavLink,
        matIcon: entity.matIcon);
  }

  const NavigationPaneList.initial()
      : navOrder = '',
        categoryNavLink = '',
        matIcon = const Icon(Icons.flutter_dash);

  @override
  List<Object?> get props => [navOrder, categoryNavLink, matIcon];

  @override
  bool get stringify => true;
}
