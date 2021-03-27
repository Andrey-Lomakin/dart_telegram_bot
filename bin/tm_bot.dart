import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

import 'command/roulette.dart';
import 'command/joke.dart';

void main(List<String> arguments) {
  if (arguments.length < 1) {
    print('arguments not set');
    return;
  }

  final TOKEN = arguments[0];
  // final int ROOT_USER = int.parse(arguments[1]);

  var bot = TeleDart(Telegram(TOKEN), Event());

  bot.start().then((me) => print('${me.username} is initialised'));

  bot.onCommand('roulette').listen(roulette);
  bot.onCommand('joke').listen(joke);
}
