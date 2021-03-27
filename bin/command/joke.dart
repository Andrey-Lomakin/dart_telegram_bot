import 'package:teledart/model.dart';
import 'package:http/http.dart';

import '../utils/decode.dart';


void joke(TeleDartMessage message) async {
  String text = 'Не смешно';

  try {
    var url = Uri.http('www.rzhunemogu.ru', '/RandJSON.aspx', {'CType': '1'});

    var response =
        await get(url, headers: {'Accept': 'application/json; charset=UTF-8'});
    if (response.statusCode == 200) {
      var jsonResponse = decodeCp1251(response.body);
      text = jsonResponse
          .replaceAll(RegExp(r'{"content":"'), '')
          .replaceAll(RegExp(r'"}'), '');
    } else {
    }
  } catch (error) {
    text = 'Сломался (';
  }

  message.reply(text, disable_notification: true);
}
