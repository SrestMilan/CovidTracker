import 'package:flutter/material.dart';
import 'package:tracker_covid/utils/route/route.dart';
import 'package:tracker_covid/utils/route/routes_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1400),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: RoutesName.getStarted,
        onGenerateRoute: Routes.generatetRoute,
      ),
    );
  }
}
