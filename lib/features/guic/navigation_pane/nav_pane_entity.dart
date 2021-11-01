import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class NavPaneEntity extends Equatable {
  final String navOrder;
  final String categoryNavLink;
  final Icon matIcon;

  const NavPaneEntity({
    required this.navOrder,
    required this.categoryNavLink,
    required this.matIcon,
  });

  factory NavPaneEntity.fromMap(Map<String, dynamic> map) {
    return NavPaneEntity(
        navOrder: map['navOrder'],
        categoryNavLink: map['categoryNavLink'],
        matIcon: map['matIcon']);
  }

  @override
  List<Object?> get props => [navOrder, categoryNavLink, matIcon];

  @override
  bool get stringify => true;
}
