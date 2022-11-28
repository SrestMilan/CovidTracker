import 'package:flutter/material.dart';
import 'package:tracker_covid/utils/route/routes_name.dart';
import 'package:tracker_covid/view/getstartedpage.dart';
import 'package:tracker_covid/view/worldstate.dart';

class Routes {
  static Route<dynamic> generatetRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.getStarted:
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      case RoutesName.worldState:
        return MaterialPageRoute(
            builder: (BuildContext context) => WorldData());

      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
