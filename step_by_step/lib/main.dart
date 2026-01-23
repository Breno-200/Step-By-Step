import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:step_by_step/app/core/routes/routes.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(MultiProvider(providers: [], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 51, 75, 182),
        ),
      ),
      routerConfig: router,
    );
  }
}
