import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tracker_covid/utils/route/routes_name.dart';
import 'package:tracker_covid/view/sliderscreen.dart';
import 'package:tracker_covid/view/sliderscreen2.dart';
import 'package:tracker_covid/view/worldstate.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();

  // create a page controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // page view
            SizedBox(
              height: 1220.h,
              child: PageView(
                controller: _controller,
                children: const [
                  SlideScreen(),
                  SlideScreen2(),
                ],
              ),
            ),

            // dot indicators
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 260.h,
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 2,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.black,
                    dotColor: Colors.brown.shade100,
                    dotHeight: 12,
                    dotWidth: 14,
                    spacing: 16,
                    //verticalOffset: 50,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 25.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 145.h,
                ),
                SizedBox(
                  height: 90.h,
                  width: 360.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.orange.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.worldState);
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
