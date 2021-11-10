import 'package:cpu_design_system/features/guic/list_pane/list_pane_screen.dart';
import 'package:cpu_design_system/features/guic/navigation_pane/navigation_pane_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Guic extends ConsumerWidget {
  const Guic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: NavigationPaneScreen(),
        ),
        const Expanded(
          flex: 2,
          child: ListPaneScreen(),
        ),
        Expanded(
          flex: 6,
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
