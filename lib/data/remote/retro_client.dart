
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:ts_assistant/model/request/image_request.dart';

import '../../model/reponse/image_response.dart';
import '../../model/reponse/response_model.dart';
import '../../model/request/request_model.dart';

part 'retro_client.g.dart';

@RestApi(baseUrl: "https://api.openai.com/v1/")
abstract class RetroClient {
  factory RetroClient(Dio dio, {String baseUrl}) = _RetroClient;

  @POST("chat/completions")
  Future<ResponseModel> chatGPTAPI(@Body() RequestModel requestModel);

  @POST("images/generations")
  Future<ImageResponse> dallEAPI(@Body() ImageRequest imageRequest);

}