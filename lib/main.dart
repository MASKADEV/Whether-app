import 'package:flutter/material.dart';
import 'package:weatherapp/whether.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _kFontFam = 'MyFlutterApp';
  static const _kFontPkg = null;

  static const IconData drizzle =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData sun =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData cloud_sun =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData sunset =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  String temp = '26';
  String whether = "S\nU\nN\nN\nY";
  Color color = Colors.black;
  String background = "assets/images/bg1.png";
  String gif = "assets/images/sunny.gif";

  List<bool> isSelected = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  final List<Whether> whetherList = [
    Whether(
        id: 1,
        day: "MON",
        temp: "26",
        whether: "S\nU\nN\nN\nY",
        imgDay: "assets/images/sunset.png", // these properties are
        imgNight:
            "assets/images/sunset.png"), // of no use for now so ignore them :)
    Whether(
        id: 2,
        day: "TUE",
        temp: "24",
        whether: "R\nA\nI\nN\nY",
        imgDay: "assets/images/rain.png",
        imgNight: "assets/images/rain.png"),
    Whether(
        id: 3,
        day: "WED",
        temp: "25",
        whether: "C\nL\nO\nU\nD\nY",
        imgDay: "assets/images/sun.png",
        imgNight: "assets/images/sun.png"),
    Whether(
        id: 4,
        day: "THU",
        temp: "28",
        whether: "C\nL\nE\nA\nR",
        imgDay: "assets/images/cloudy.png",
        imgNight: "assets/images/cloudy.png"),
    Whether(
        id: 5,
        day: "FRI",
        temp: "26",
        whether: "S\nU\nN\nN\nY",
        imgDay: "assets/images/sunset.png",
        imgNight: "assets/images/sunset.png"),
    Whether(
        id: 6,
        day: "SAT",
        temp: "24",
        whether: "R\nA\nI\nN\nY",
        imgDay: "assets/images/rain.png",
        imgNight: "assets/images/rain.png"),
    Whether(
        id: 7,
        day: "SUN",
        temp: "25",
        whether: "C\nL\nO\nU\nD\nY",
        imgDay: "assets/images/sun.png",
        imgNight: "assets/images/sun.png"),
  ];

  void daySelection(int index) {
    setState(() {
      for (int buttonIndex = 0;
          buttonIndex < isSelected.length;
          buttonIndex++) {
        if (buttonIndex == index) {
          isSelected[buttonIndex] = true;
          temp = whetherList[buttonIndex].temp;
          whether = whetherList[buttonIndex].whether;
          if (whetherList[buttonIndex].id == 5) {
            color = Colors.white;
            gif = "assets/images/night.gif";
            background = "assets/images/bg.png";
          } else {
            color = Colors.black;
            if (whetherList[buttonIndex].id == 2 ||
                whetherList[buttonIndex].id == 6) {
              gif = "assets/images/rainy.gif";
            } else {
              gif = "assets/images/sunny.gif";
            }
            background = "assets/images/bg1.png";
          }
        } else {
          isSelected[buttonIndex] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(background), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 30, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  temp,
                                  style: TextStyle(
                                      fontSize: 100,
                                      fontFamily: "Oxygen",
                                      color: color),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 80,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "o",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: color),
                                    ),
                                    Text(
                                      "C",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "IBM",
                                        color: color,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 350,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(gif),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Marrakech",
                        style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 2,
                            fontFamily: "Poppins",
                            color: color,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ToggleButtons(
                        borderRadius: BorderRadius.circular(50),
                        fillColor: Colors.brown.withOpacity(0.4),
                        children: [
                          Icon(
                            sunset,
                            color: color,
                            size: 32,
                          ),
                          Icon(
                            drizzle,
                            color: color,
                          ),
                          Icon(
                            cloud_sun,
                            color: color,
                          ),
                          Icon(
                            sun,
                            color: color,
                          ),
                          Icon(
                            sunset,
                            color: color,
                            size: 32,
                          ),
                          Icon(
                            drizzle,
                            color: color,
                          ),
                          Icon(
                            cloud_sun,
                            color: color,
                          ),
                        ],
                        onPressed: (int index) {
                          daySelection(index);
                        },
                        isSelected: isSelected,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ListView.builder(
                          itemBuilder: (ctx, i) => Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 11.5, vertical: 5),
                            child: Text(
                              whetherList[i].day,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: color,
                              ),
                            ),
                          ),
                          itemCount: 7,
                          scrollDirection: Axis.horizontal,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              Positioned(
                right: 20,
                top: MediaQuery.of(context).size.height * 0.2,
                child: Container(
                  child: Text(
                    whether,
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "IBM",
                      color: color,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
