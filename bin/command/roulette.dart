import 'package:teledart/model.dart';
import 'dart:math';

void roulette(TeleDartMessage message) {
  Random random = new Random();
  int luck = random.nextInt(20);
  String text = 'ВА-А-А-А-А-А-ГХ!!!	 Ты сдох ☠️';

  if (luck <= 3) {
    text = 'Щелк.... Красава, ты выжил 🥳';
  }
  if (luck >= 4 && luck <= 5) {
    text = '💥 произошел выстрел. '
        'Но пьяная бабка вовремя толкнула тебя в плечо, ты выжил 🥳';
  }
  if (luck == 6) {
    text = 'Щелк.... Красава, ты выжил 🥳 Но в жопе новая дырка.';
  }

  if (luck >= 12 && luck <= 14) {
    text = 'ВА-А-А-А-А-А-ГХ!!!	 Ты сдох ☠, Слава императору!';
  }
  if (luck >= 15 && luck <= 17) {
    text = 'ВА-А-А-А-А-А-ГХ!!!	 Ты сдох ☠, ну и лан.';
  }
  if (luck == 18) {
    text = 'ВА-А-А-А-А-А-ГХ!!!	 Ты сдох ☠, передай привет Авелю.';
  }
  if (luck == 19) {
    text = 'ВА-А-А-А-А-А-ГХ!!!	 Ты сдох ☠, ну и лан.';
  }

  message.reply(text, disable_notification: true);
}