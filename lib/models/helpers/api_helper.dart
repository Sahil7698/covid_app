import 'dart:convert';

import 'package:http/http.dart' as http;

class Apihelper {
  Apihelper._();
  static final Apihelper apihelper = Apihelper._();
  Future<Map?> Getcountry({required country}) async {
    String Country =
        "https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/total?country=$country";
    Uri Myurl = Uri.parse(Country);
    http.Response res = await http.get(Myurl, headers: {
      'X-RapidAPI-Key': '93b04adbd2msh2005fe9359c3580p10860djsnfb821cf505b9',
      'X-RapidAPI-Host': 'covid-19-coronavirus-statistics.p.rapidapi.com'
    });
    if (res.statusCode == 200) {
      Map? data = jsonDecode(res.body);
      return data;
    }
    return null;
  }
}
