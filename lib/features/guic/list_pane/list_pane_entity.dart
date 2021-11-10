import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class ListPaneEntity extends Equatable {
  final String navigationLink;
  final String platforms;
  final String pageName;
  final String componentHeading;
  final String componentDescription;
  final String usage;
  final String materialDesignLink;
  final String flutterLinkLink;

  const ListPaneEntity({
    required this.navigationLink,
    required this.platforms,
    required this.pageName,
    required this.componentHeading,
    required this.componentDescription,
    required this.usage,
    required this.materialDesignLink,
    required this.flutterLinkLink,
  });

  factory ListPaneEntity.fromMap(Map<dynamic, dynamic> map) {
    return ListPaneEntity(
        navigationLink: map['navigationLink'],
        platforms: map['categoryNavLink'],
        pageName: map['pageName'],
        componentHeading: map['componentHeading'],
        componentDescription: map['componentDescription'],
        usage: map['usage'],
        materialDesignLink: map['materialDesignLink'],
        flutterLinkLink: map['flutterLinkLink']);
  }

  @override
  List<Object?> get props => [
        navigationLink,
        platforms,
        pageName,
        componentHeading,
        componentDescription,
        usage,
        materialDesignLink,
        flutterLinkLink
      ];

  @override
  bool get stringify => true;
}
