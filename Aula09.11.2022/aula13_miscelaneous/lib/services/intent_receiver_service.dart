import 'package:aula13_miscelaneous/models/intent_receiver_models.dart';
import 'package:flutter/material.dart';

import 'package:receive_intent/receive_intent.dart';

class IntentReceiverService {
  late IntentReceiverModel? intentReceiver;

  Future<void> checkForIntent() async {
    final receivedIntent = await ReceiveIntent.getInitialIntent();
    if (receivedIntent != null) {
      intentReceiver = IntentReceiverModel(
        fromPackageName: receivedIntent.fromPackageName,
        fromSignatures: receivedIntent.fromSignatures,
        action: receivedIntent.action,
        data: receivedIntent.data,
        categories: receivedIntent.categories,
        extra: receivedIntent.extra,
      );
    }
  }

  Future<Widget> getVisualComponent() async {
    Map<String, dynamic> intentData = await intentReceiver!.getSource();

    if (intentData["type"] == "audio") {
      return Container();
    } else if (intentData["type"] == "image") {
      return Container();
    } else {
      return Center(
        child: Column(children: [
          Text(
            "Aguardando Intent...",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Padding(padding: EdgeInsets.only(bottom: 45)),
          CircularProgressIndicator(),
          Container(
            padding: EdgeInsets.all(45),
            child: Divider(thickness: 3),
          )
        ]),
      );
    }
  }
}
