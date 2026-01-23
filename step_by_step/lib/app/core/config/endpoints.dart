import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  static String get api => dotenv.env['URL'] ?? 'Url não encontrada!';

  static Dio url = Dio(
    BaseOptions(
      baseUrl: api,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {'Accept': 'application/vnd.github+json'},
    ),
  );
}
