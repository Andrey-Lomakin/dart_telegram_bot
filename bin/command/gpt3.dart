import 'package:teledart/model.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

void gpt3(TeleDartMessage message) async {
  String text = 'empty';

  if (message.reply_to_message == null ||
      message.reply_to_message.text == null) {
    text = "Only replay text.";
    message.reply(text, disable_notification: true);
    return;
  }

  try {
    Response response = await Dio().post(
        "https://api.aicloud.sbercloud.ru/public/v1/public_inference/gpt3/predict",
        data: jsonEncode({"text": message.reply_to_message.text}));
    text = response.data
        .toString()
        .replaceAll(RegExp(r'{predictions: '), '')
        .replaceAll(RegExp(r'}'), '');
  } catch (error) {
    text = 'Сломался :(';
  }

  message.reply(text, disable_notification: true);
}
