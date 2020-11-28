import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

class WorldTime {
  String location;
  String flag;
  String time;
  String url;
  String dateTime;
  String hours;
  String minutes;
  bool isDay;

  WorldTime({this.location, this.url, this.flag, this.isDay});

  Future<void> getTime(String url) async {
    final response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);

    dateTime = data['datetime'];
    hours = data['utc_offset'].substring(1, 3);
    minutes = data['utc_offset'].substring(4, 6);

    DateTime now = DateTime.parse(dateTime);
    now =
        now.add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));

    isDay = now.hour >= 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
    //print(time);
  }
}
