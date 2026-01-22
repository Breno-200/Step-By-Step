import 'package:dio/dio.dart';
import 'package:step_by_step/app/config/api_key.dart';

class Endpoints {
  static String get api => 'https://api.github.com/gists/${ApiKey.idGist}';

  static Dio url = Dio(
    BaseOptions(
      baseUrl: api,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {'Accept': 'application/vnd.github+json', },
    ),
  );
}
