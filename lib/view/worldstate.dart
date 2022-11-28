import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tracker_covid/const.dart';
import 'package:tracker_covid/data/Service/apiresponse.dart';

import '../Model/model.dart';

import 'package:flutter_svg/flutter_svg.dart';

class WorldData extends StatefulWidget {
  const WorldData({super.key});

  @override
  State<WorldData> createState() => _WorldDataState();
}

class _WorldDataState extends State<WorldData> {
  final date = DateFormat('yyy-MM-dd').format(DateTime.now());
  final nav_item = <Widget>[
    const Icon(
      Icons.home,
      size: 30,
      color: Colors.black,
    ),
    const Icon(
      Icons.add,
      size: 30,
      color: Colors.black,
    ),
    const Icon(
      Icons.settings,
      size: 30,
      color: Colors.black,
    )
  ];

  WorldStatesData datas = WorldStatesData();
  int index = 1;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Image.asset(
                'images/hamburger.png',
                color: Colors.black87,
                height: 30.0,
              ));
        }),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 90.0,
              width: 50.0,
              child: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade200,
        width: 280.0,
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFF3383CD), Color(0xFF11249F)],
                ),
              ),
              accountName: Text('Milan Shrestha'),
              accountEmail: Text('shrestham780@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/milan.jpg'),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: const Text(
                'Home',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            a,
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            a,
            ListTile(
              leading: const Icon(
                Icons.contacts,
                color: Colors.black,
              ),
              title: const Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 30.h,
              ),
              const Text(
                'Hello, Milan',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 15.h,
              ),
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  width: 600.h,
                  height: 200.0,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xFF3383CD), Color(0xFF11249F)],
                  )),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(children: [
                            SvgPicture.asset(
                              "images/doc.svg",
                              width: 530.h,
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                            const Positioned(
                                top: 40,
                                left: 190,
                                child: Text(
                                  'Be safe\nStay at home ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19.0,
                                  ),
                                ))
                          ]),
                        )
                      ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 15.h,
              ),
              const Text(
                'Case Update',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          FutureBuilder(
              future: datas.fetchWorldCovidCases(),
              builder: (context, AsyncSnapshot<States> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 15.h,
                          ),
                          Expanded(
                            child: Card(
                              child: Container(
                                height: 65.0,
                                width: 25.0,
                                color: Colors.grey.shade100,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.h,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 15.0,
                                              child: Image(
                                                  image: AssetImage(
                                                      'images/patient.png')),
                                            ),
                                            SizedBox(
                                              width: 25.h,
                                            ),
                                            const Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                'Confirmed Cases',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 38.h,
                                              ),
                                              Text(
                                                snapshot.data!.cases!
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              child: Container(
                                height: 65.0,
                                width: 25.0,
                                color: Colors.grey.shade100,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.h,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 15.0,
                                              child: Image(
                                                  image: AssetImage(
                                                      'images/death.png')),
                                            ),
                                            SizedBox(
                                              width: 25.h,
                                            ),
                                            const Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                'Total Death',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 80.h,
                                              ),
                                              Text(
                                                snapshot.data!.deaths!
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15.h,
                          ),
                          Expanded(
                            child: Card(
                              child: Container(
                                height: 65.0,
                                width: 25.0,
                                color: Colors.grey.shade100,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.h,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 15.0,
                                              child: Image(
                                                  image: AssetImage(
                                                      'images/recover.png')),
                                            ),
                                            SizedBox(
                                              width: 25.h,
                                            ),
                                            const Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                'Recovered',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 90.h,
                                              ),
                                              Text(
                                                snapshot.data!.recovered!
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              child: Container(
                                height: 65.0,
                                width: 25.0,
                                color: Colors.grey.shade100,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.h,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 15.0,
                                              child: Image(
                                                  image: AssetImage(
                                                      'images/todayrecover.png')),
                                            ),
                                            SizedBox(
                                              width: 25.h,
                                            ),
                                            const Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                'Today Recovered',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 5.h,
                                              ),
                                              Text(
                                                snapshot.data!.todayRecovered!
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 15.h,
                          ),
                          Expanded(
                            child: Card(
                              child: Container(
                                height: 65.0,
                                width: 25.0,
                                color: Colors.grey.shade100,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.h,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 15.0,
                                              child: Image(
                                                  image: AssetImage(
                                                      'images/patient.png')),
                                            ),
                                            SizedBox(
                                              width: 25.h,
                                            ),
                                            const Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                'Confirmed Cases',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '200000',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              child: Container(
                                height: 65.0,
                                width: 25.0,
                                color: Colors.grey.shade100,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.h,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 15.0,
                                              child: Image(
                                                  image: AssetImage(
                                                      'images/death.png')),
                                            ),
                                            SizedBox(
                                              width: 25.h,
                                            ),
                                            const Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                'Total Death',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '3000',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15.h,
                          ),
                          Expanded(
                            child: Card(
                              child: Container(
                                height: 65.0,
                                width: 25.0,
                                color: Colors.grey.shade100,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.h,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 15.0,
                                              child: Image(
                                                  image: AssetImage(
                                                      'images/recover.png')),
                                            ),
                                            SizedBox(
                                              width: 25.h,
                                            ),
                                            const Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                'Recovered',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '4000',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              child: Container(
                                height: 65.0,
                                width: 25.0,
                                color: Colors.grey.shade100,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.h,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const CircleAvatar(
                                              radius: 15.0,
                                              child: Image(
                                                  image: AssetImage(
                                                      'images/todayrecover.png')),
                                            ),
                                            SizedBox(
                                              width: 25.h,
                                            ),
                                            const Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                'Today Recovered',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        const Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '3000',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              }),
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 15.h,
              ),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Symptoms',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 15.h,
                ),
                Container(
                  height: 65.0,
                  width: 435.0,
                  color: Colors.white,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Card(
                        elevation: 2.0,
                        child: Container(
                            height: 5.0,
                            width: 100.0,
                            color: Colors.grey.shade100,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 16.0,
                                  child: Image.asset('images/cough.png'),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                const Text('Cough'),
                              ],
                            )),
                      ),
                      Card(
                        elevation: 2.0,
                        child: Container(
                            height: 20.0,
                            width: 100.0,
                            color: Colors.grey.shade100,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 16.0,
                                  child: Image.asset('images/headache.png'),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text('Headache'),
                              ],
                            )),
                      ),
                      Card(
                        elevation: 2.0,
                        child: Container(
                            height: 20.0,
                            width: 100.0,
                            color: Colors.grey.shade100,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 16.0,
                                  child: Image.asset('images/fever.png'),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text('Fever'),
                              ],
                            )),
                      ),
                      Card(
                        elevation: 2.0,
                        child: Container(
                            height: 20.0,
                            width: 100.0,
                            color: Colors.grey.shade100,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 16.0,
                                  child: Image.asset('images/tired.png'),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text('Tireness'),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 15.h,
              ),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Prevention',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 15.h,
                ),
                Container(
                  height: 65.0,
                  width: 435.0,
                  color: Colors.white,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Card(
                        elevation: 2.0,
                        child: Container(
                            height: 20.0,
                            width: 100.0,
                            color: Colors.grey.shade100,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 16.0,
                                  child: Image.asset('images/mask.png'),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text('Wear Mask'),
                              ],
                            )),
                      ),
                      Card(
                        elevation: 2.0,
                        child: Container(
                            height: 20.0,
                            width: 100.0,
                            color: Colors.grey.shade100,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 16.0,
                                  child: Image.asset('images/hands.png'),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text('Wash Hands'),
                              ],
                            )),
                      ),
                      Card(
                        elevation: 2.0,
                        child: Container(
                            height: 20.0,
                            width: 100.0,
                            color: Colors.grey.shade100,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 16.0,
                                  child: Image.asset('images/vaccine.png'),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text('Take Vaccine'),
                              ],
                            )),
                      ),
                      Card(
                        elevation: 2.0,
                        child: Container(
                            height: 20.0,
                            width: 100.0,
                            color: Colors.grey.shade100,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 16.0,
                                  child: Image.asset('images/distance.png'),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text('Distance'),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(1, size.height)
      ..quadraticBezierTo(
        size.width / 120,
        size.width - 10,
        size.width / 50,
        size.height - 0,
      )
      ..quadraticBezierTo(
          2 / 4 * size.width, size.height, size.width, size.height - 0)
      ..lineTo(size.width, 1);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
