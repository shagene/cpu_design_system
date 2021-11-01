import 'package:cpu_design_system/features/guic/guic.dart';
import 'package:cpu_design_system/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

// final dioProvider = Provider<Dio>((ref) {
//   return Dio(
//     BaseOptions(baseUrl: 'https://api.themoviedb.org/3/'),
//   );
// });

final navJsonProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3/'),
  );
});

// final navJsonProvider = Provider<dynamic>((ref) {
//   return rootBundle.loadString('navigation.json');
// });

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Computershare GUIC',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.darkTheme(context),
      themeMode: ThemeMode.light,
      home: const Guic(),
    );
  }
}
