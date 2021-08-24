import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = '0';
  String flag;
  String url = 'Africa/Monrovia';

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      http.Response response = await http.get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));

      Map data = await jsonDecode(response.body);
      //get propaties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create data tome objec t
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      print(now);

      time=DateFormat.jm().format(now);
    } catch (e) {
      print('Error : $e' );
      time='could not get time';
    }
  }
}
