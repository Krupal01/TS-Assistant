import 'package:ts_assistant/base/base_cubit.dart';
import 'package:ts_assistant/base/base_state.dart';
import 'package:ts_assistant/presentation/state/chat_state.dart';

import '../../data/repository/ai_repository.dart';

class ChatCubit extends BaseCubit<BaseState , String>{
  final AiRepository aiRepository;
  ChatCubit({required this.aiRepository}) : super(BaseInitState() , "");

  String text ="";

  void getRandomText() async {
    try {
      text = await aiRepository.chatGPTAPI("get random text");
    }catch(e){
      text = e.toString();
    }
    emit(ChatState());
  }

}