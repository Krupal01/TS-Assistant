import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ts_assistant/data/remote/retro_client.dart';
import 'package:ts_assistant/data/repository/ai_repository.dart';
import 'package:ts_assistant/presentation/cubit/chat_cubit.dart';
import 'package:ts_assistant/private_key.dart';

final get = GetIt.instance;

Future<void> DiInit() async {

  get.registerFactory(() => ChatCubit(aiRepository: get.call()));

  get.registerLazySingleton<AiRepository>(() => AiRepository(get.call()));

  get.registerLazySingleton(() {
    final dio = get<Dio>(); // Resolve Dio from GetIt
    dio.options.headers['Authorization'] = 'Bearer $OPEN_AI_KEY';
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
      ));
    }
    return RetroClient(dio);
  });

  get.registerLazySingleton(() => Dio(BaseOptions(contentType: "application/json")));
}