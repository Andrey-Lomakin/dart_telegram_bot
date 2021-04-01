import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

import 'command/roulette.dart';
import 'command/joke.dart';
import 'command/stats.dart';

void main(List<String> arguments) {
  if (arguments.length < 1) {
    print('arguments not set');
    return;
  }

  final TOKEN = arguments[0];

  var bot = TeleDart(Telegram(TOKEN), Event());

  bot.start().then((me) => print('${me.username} is initialised'));

  bot.onCommand('roulette').listen(roulette);
  bot.onCommand('joke').listen(joke);
  bot.onCommand('stats').listen(stats);
}
