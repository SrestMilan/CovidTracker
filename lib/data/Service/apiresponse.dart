import 'dart:convert';

import 'package:tracker_covid/data/Network/url.dart';

import '../../Model/model.dart';
import 'package:http/http.dart' as http;

class WorldStatesData {
  Future<States> fetchWorldCovidCases() async {
    final response = await http.get(Uri.parse(CovidUrl.worldStatesEndPoint));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return States.fromJson(data);
    } else {
      throw Exception('errr');
    }
  }
}
