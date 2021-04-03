import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:dotenv/dotenv.dart' show load, env;

import 'command/gpt3.dart';
import 'command/roulette.dart';
import 'command/joke.dart';
import 'command/stats.dart';

void main(List<String> arguments) {
  load();
  final TOKEN = env['BOT_TOKEN'];

  if (env['BOT_TOKEN'] == null) {
    print('bot token == null (see .env.example file).');
    return;
  }

  var bot = TeleDart(Telegram(TOKEN), Event());

  bot.start().then((me) => print('${me.username} is initialised'));

  bot.onCommand('roulette').listen(roulette);
  bot.onCommand('joke').listen(joke);
  bot.onCommand('stats').listen(stats);
  bot.onCommand('gpt3').listen(gpt3);
}
