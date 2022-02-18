import "package:http/http.dart";
import "dart:convert";
import "package:intl/intl.dart";

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url = "";
  late bool isDay;

  WorldTime({required this.location, required this.flag, required this.url});

  // methods
  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);
      // extract data
      String dateTime = data["datetime"];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDay= (now.hour >6 && now.hour < 20) ? true : false;

      time =DateFormat.jm().format(now);
    } catch (e) {
      print(e);
    }
  }
}
