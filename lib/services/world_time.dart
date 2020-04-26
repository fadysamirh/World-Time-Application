import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the ui
  String time; //time in that location
  String flag; //url to asset flag icon
  String url; //location url for api endpoint
  bool isDayTime; //true=>daytime 

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      //request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(datetime);
      //print(offset);

      //create datetime object to add the offset
      DateTime dtObj = DateTime.parse(datetime);
      dtObj = dtObj.add(Duration(hours: int.parse(offset)));

      //converting the datetime back to string

      isDayTime=(dtObj.hour>=6 && dtObj.hour<=18? true:false);

      time=DateFormat.jm().format(dtObj);
    } catch (e) {
      print('caught error: $e');
      time='data could not be retrived';
    }
  }
}
