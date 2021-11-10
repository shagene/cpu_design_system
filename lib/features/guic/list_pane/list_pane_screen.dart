import 'dart:convert';

import 'package:cpu_design_system/core/constants.dart';
import 'package:cpu_design_system/features/guic/guic_controller.dart';
import 'package:cpu_design_system/features/guic/navigation_pane/navigation_pane_screen.dart';
import 'package:cpu_design_system/main.dart';
import 'package:cpu_design_system/theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListPaneScreen extends ConsumerWidget {
  const ListPaneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // fetchNavList();
    return Container(
      color: Palette.genoa50,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Text(
            'List Pane',
            style: theme.textTheme.headline6?.copyWith(
              color: Palette.almostBlack,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          // Text(
          //   ref.read(guicControllerProvider.notifier).displaySelectedNavItem(),
          // ),
          Expanded(
            child: ref.watch(guicControllerProvider).listPane.when(
                  data: (listPaneItems) {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          vertical: kListItemSpacing),
                      itemBuilder: (context, index) {
                        final listPane = listPaneItems[index];
                        return ListCard(
                            contentListItem: listPane.componentHeading,
                            contentListIcon: listPane.pageName,
                            onTap: () {
                              // ref.read(movieFlowControllerProvider.notifier).toggleSelected(genre),
                            });
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: kListItemSpacing,
                        );
                      },
                      itemCount: listPaneItems.length,
                    );
                  },
                  error: (e, s, onError) {
                    return const Text('Something went wrong on our end');
                  },
                  loading: (onLoading) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
