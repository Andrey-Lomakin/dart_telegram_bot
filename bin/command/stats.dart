import 'dart:io';
import 'package:teledart/model.dart';

void stats(TeleDartMessage message) async {
  String text = 'empty';

  try {
    var result = await Process.run('pm2', ['status'], runInShell: true);

    if (result.stdout.runtimeType == String && result.stdout.length > 0) {
      text = result.stdout;
    }

    if (result.stderr.runtimeType == String && result.stderr.length > 0) {
      text = result.stderr;
    }
  } catch (error) {
    text = 'сломался :(';
  }

  message.reply(text, disable_notification: true);
}