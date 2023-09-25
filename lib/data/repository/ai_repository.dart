import 'package:dio/dio.dart';
import 'package:ts_assistant/data/remote/retro_client.dart';
import 'package:ts_assistant/model/request/request_model.dart';

import '../../model/request/image_request.dart';

class AiRepository {
  final RetroClient apiService;
  AiRepository(this.apiService);

  final List<Message> messages = [];

  Future<String> isArtPromptAPI(String prompt) async {
    try {
      final res = await apiService.chatGPTAPI(RequestModel(
        model: "gpt-3.5-turbo",
        messages: [
          Message(
            role: 'user',
            content: 'Does this message want to generate an AI picture, image, art or anything similar? $prompt . Simply answer with a yes or no.',),
        ],),);


      switch (res.choices[0].message.content) {
        case 'Yes':
        case 'yes':
        case 'Yes.':
        case 'yes.':
          final res = await dallEAPI(prompt);
          return res;
        default:
          final res = await chatGPTAPI(prompt);
          return res;
      }
    }  on DioException catch (e) {
      if (e.response != null) {
        print('Error: ${e.response!.statusCode} - ${e.response!.statusMessage}');
        print('Response data: ${e.response!.data}');
      } else {
        print('Error: ${e.message}');
      }
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async {
    messages.add(Message(role: 'user', content: prompt));
    try {
      final res = await apiService.chatGPTAPI(RequestModel(
        model: "gpt-3.5-turbo",
        messages: messages,),);
      messages.add(Message(role: 'assistant', content: res.choices.first.message.content));
      return res.choices.first.message.content;
    }  on DioException catch (e) {
      if (e.response != null) {
        print('Error: ${e.response!.statusCode} - ${e.response!.statusMessage}');
        print('Response data: ${e.response!.data}');
      } else {
        print('Error: ${e.message}');
      }
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> dallEAPI(String prompt) async {
    messages.add(Message(role: 'user', content: prompt));
    try {
      final res = await apiService.dallEAPI(ImageRequest(prompt: prompt, n: 1 ));
        messages.add(Message(role: "assistant", content: res.data.first.url));
        return res.data.first.url;
    } catch (e) {
      return e.toString();
    }
  }
}
