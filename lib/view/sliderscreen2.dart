import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlideScreen2 extends StatelessWidget {
  const SlideScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Image(
              height: 700.h,
              image: AssetImage('images/covid.jpg'),
            ),
           SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 50.h,
                ),
                const Text(
                  'Follow Precaution-',
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 210.h,
                ),
                const Text(
                  'Be Safe',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Column(
              children: const [
                Text(
                  textAlign: TextAlign.center,
                  'Welcome to the covid tracker and it provides the information of covid cases througout the world and provides the necessary precaution of covid-19.Various symptoms information are provided',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
