import 'dart:convert';

import 'package:cpu_design_system/core/constants.dart';
import 'package:cpu_design_system/main.dart';
import 'package:cpu_design_system/theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationPaneScreen extends ConsumerWidget {
  const NavigationPaneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Container(
      color: Palette.genoa50,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Center(
            child: Text(
              'Left',
              style: theme.textTheme.headline6?.copyWith(
                color: Palette.almostBlack,
              ),
            ),
          ),
          // Expanded(
          //   child: ListView.separated(
          //       padding: const EdgeInsets.symmetric(vertical: kListItemSpacing),
          //       itemBuilder: (context, index) {
          //         final navigationPaneList = ref
          //             .watch(navigationPaneProvider)
          //             .navigationPaneList[index];
          //         return ListCard(
          //           contentListIcon: navigationPaneList.matIcon,
          //           contentListItem: navigationPaneList.categoryNavLink,
          //           onTap: () => ref
          //               .read(listPaneProvider.notifier)
          //               .passData(navigationPaneList.categoryNavLink),
          //         );
          //       },
          //       separatorBuilder: (context, index) {
          //         return const SizedBox(
          //           height: kListItemSpacing,
          //         );
          //       },
          //       itemCount: ref
          //           .watch(navigationPaneProvider)
          //           .navigationPaneList
          //           .length),
          // ),
        ],
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.contentListItem,
    required this.contentListIcon,
    required this.onTap,
  }) : super(key: key);

  final String contentListItem;
  final Icon contentListIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return UnconstrainedBox(
      child: Material(
        borderRadius: BorderRadius.circular(kBorderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(kBorderRadius),
          onTap: onTap,
          child: Container(
            width: 140,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: [
                Text(
                  contentListItem,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyText2?.copyWith(
                    color: Palette.almostBlack,
                  ),
                ),
                const Spacer(),
                contentListIcon,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
