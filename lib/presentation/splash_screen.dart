import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ts_assistant/base/base_state.dart';
import 'package:ts_assistant/presentation/cubit/chat_cubit.dart';

import '../di.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final chatCubit = get<ChatCubit>();
    return BlocConsumer<ChatCubit, BaseState>(
      bloc: chatCubit,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                chatCubit.getRandomText();
              }, child: const Text("generate"),),
              Text(chatCubit.text)
            ],
          ),
        );
      },
    );
  }
}
