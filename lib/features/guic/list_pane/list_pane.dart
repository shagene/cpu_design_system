import 'package:cpu_design_system/features/guic/list_pane/list_pane_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

// Unidirectional data flow
@immutable
class ListPane extends Equatable {
  final String navigationLink;
  final String platforms;
  final String pageName;
  final String componentHeading;
  final String componentDescription;
  final String usage;
  final String materialDesignLink;
  final String flutterLinkLink;

  const ListPane({
    required this.navigationLink,
    required this.platforms,
    required this.pageName,
    required this.componentHeading,
    required this.componentDescription,
    required this.usage,
    required this.materialDesignLink,
    required this.flutterLinkLink,
  });

  factory ListPane.fromEntity(ListPaneEntity entity) {
    return ListPane(
        navigationLink: entity.navigationLink,
        platforms: entity.platforms,
        pageName: entity.pageName,
        componentHeading: entity.componentHeading,
        componentDescription: entity.componentDescription,
        usage: entity.usage,
        materialDesignLink: entity.materialDesignLink,
        flutterLinkLink: entity.flutterLinkLink);
  }

  const ListPane.initial()
      : navigationLink = '',
        platforms = '',
        pageName = '',
        componentHeading = '',
        componentDescription = '',
        usage = '',
        materialDesignLink = '',
        flutterLinkLink = '';

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
