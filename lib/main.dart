import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:novalabs/Details2.dart';
import 'package:novalabs/Detials.dart';
import 'package:novalabs/HomePage.dart';
import 'package:novalabs/Test.dart';
import 'package:novalabs/camera.dart';
import 'package:novalabs/home.dart';

import 'package:novalabs/profilw.dart';
import 'package:novalabs/signin.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pie_chart/pie_chart.dart';

import 'Report.dart';
import 'firebase_options.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Novalabs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: (FirebaseAuth.instance.currentUser != null) ? HomePage() : Signin(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: IconButton(
//                 onPressed: () {
//                   PersistentNavBarNavigator.pushNewScreen(
//                     context,
//                     screen: Profile(),
//                     withNavBar: true,
//                     pageTransitionAnimation: PageTransitionAnimation.fade,
//                   );
//                 },
//                 icon: Icon(
//                   Icons.person_pin_circle_rounded,
//                   size: 33,
//                   color: Color.fromARGB(255, 241, 194, 125),
//                 )),
//           )
//         ],
//         elevation: 0,

//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Colors.white,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               "N",
//               style: GoogleFonts.aBeeZee(
//                   textStyle:
//                       TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
//             ),
//             Image.asset(
//               "images/nova.png",
//               height: 30,
//               width: 30,
//             ),
//             Text("va",
//                 style: GoogleFonts.kanit(
//                   textStyle: TextStyle(fontSize: 25),
//                 )),
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Text(
//                 "l",
//                 style: GoogleFonts.sacramento(
//                   textStyle: TextStyle(
//                       fontSize: 27,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.amber),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Text(
//                 "a",
//                 style: GoogleFonts.sacramento(
//                   textStyle: TextStyle(
//                       fontSize: 27,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.redAccent),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Text(
//                 "bs",
//                 style: GoogleFonts.sacramento(
//                   textStyle: TextStyle(
//                       fontSize: 27,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           // Center is a layout widget. It takes a single child and positions it
//           // in the middle of the parent.
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Stack(children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(colors: [
//                         Color.fromARGB(150, 255, 219, 172),
//                         Color.fromARGB(255, 255, 219, 172),
//                       ]),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Image.asset(
//                                     "images/disease.png",
//                                     width: 100,
//                                     height: 100,
//                                     scale: 2,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(0),
//                                   child: Center(
//                                     child: Container(
//                                         width: 110,
//                                         child: Text(
//                                           "you need personalized skin check up?",
//                                           style: GoogleFonts.aBeeZee(
//                                               textStyle: TextStyle(
//                                                   fontWeight: FontWeight.bold)),
//                                           textAlign: TextAlign.center,
//                                         )),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 0),
//                                   child: Image.asset(
//                                     "images/diseases2.png",
//                                     width: 120,
//                                     height: 120,
//                                     scale: 1,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(0),
//                                   child: Container(
//                                       width: 120,
//                                       child: Text(
//                                         "Are you travelling daily to clinic?",
//                                         style: GoogleFonts.aBeeZee(
//                                             textStyle: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                         )),
//                                         textAlign: TextAlign.center,
//                                       )),
//                                 )
//                               ],
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(right: 8.0),
//                                   child: Image.asset(
//                                     "images/diseases3.png",
//                                     width: 120,
//                                     height: 120,
//                                     scale: 1,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 0),
//                                   child: Container(
//                                       width: 110,
//                                       child: Text(
//                                         "Are you confused? Dont worry!",
//                                         style: GoogleFonts.aBeeZee(
//                                             textStyle: TextStyle(
//                                                 fontWeight: FontWeight.bold)),
//                                         textAlign: TextAlign.center,
//                                       )),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 50,
//                         )
//                       ],
//                     ),
//                   ),
//                   Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 190),
//                       child: Container(
//                         width: 340,
//                         decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.deepOrangeAccent,
//                               blurRadius: 10.0, // soften the shadow
//                               spreadRadius: 3.0, //extend the shadow
//                               offset: Offset(
//                                 5.0, // Move to right 5  horizontally
//                                 5.0, // Move to bottom 5 Vertically
//                               ),
//                             )
//                           ],
//                           gradient: LinearGradient(colors: [
//                             Color.fromARGB(255, 238, 75, 43),
//                             Colors.redAccent.shade200
//                           ]),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(right: 8.0),
//                                         child: Image.asset(
//                                           "images/solution.png",
//                                           width: 120,
//                                           height: 120,
//                                           scale: 1,
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(left: 6),
//                                         child: Container(
//                                             width: 190,
//                                             child: Text(
//                                               "Dont worry! Click the booster appears down and take pic of skin spot to get personalized report!",
//                                               style: GoogleFonts.aBeeZee(
//                                                   textStyle: TextStyle(
//                                                       color: Colors.white,
//                                                       fontWeight:
//                                                           FontWeight.bold)),
//                                               textAlign: TextAlign.center,
//                                             )),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 0),
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 8.0),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "Novalabs ai powered ",
//                                       style: GoogleFonts.alef(
//                                           textStyle: TextStyle(
//                                         color: Colors.white,
//                                       )),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                     Icon(
//                                       Icons.rocket_launch_rounded,
//                                       color: Color.fromARGB(255, 255, 219, 172),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 ]),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 57.0),
//                   child: Column(
//                     children: [
//                       Container(
//                         child: ElevatedButton(
//                             style: ButtonStyle(
//                               shape: MaterialStateProperty.all(CircleBorder()),
//                               padding:
//                                   MaterialStateProperty.all(EdgeInsets.all(20)),
//                               backgroundColor: MaterialStateProperty.all(
//                                   Colors.white), // <-- Button color
//                               overlayColor:
//                                   MaterialStateProperty.resolveWith<Color?>(
//                                       (states) {
//                                 if (states.contains(MaterialState.pressed))
//                                   return Colors.white;
//                               }),
//                             ),
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => TakePictureScreen(
//                                             cameras: cameras,
//                                           )));
//                             },
//                             child: Image.asset(
//                               "images/solu.png",
//                               width: 50,
//                               height: 50,
//                             )),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           "Boost🔥",
//                           style: GoogleFonts.stylish(
//                             textStyle: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.redAccent),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: Text("Highlights",
//                           style: GoogleFonts.stylish(
//                             textStyle: TextStyle(
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.redAccent),
//                           )),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(colors: [
//                       Color.fromARGB(220, 255, 219, 172),
//                       Color.fromARGB(220, 255, 219, 172),
//                     ]),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Image.asset(
//                               "images/location.png",
//                               width: 155,
//                               height: 155,
//                               scale: 2,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 20),
//                             child: Center(
//                               child: Container(
//                                   width: 200,
//                                   child: Text(
//                                     "Find novalabs nearest dermatologists and get speacialized Treatment with our product especially for cancers!",
//                                     style: GoogleFonts.aBeeZee(
//                                         textStyle: TextStyle(
//                                             fontWeight: FontWeight.bold)),
//                                     textAlign: TextAlign.center,
//                                   )),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(colors: [
//                       Color.fromARGB(150, 198, 134, 66),
//                       Color.fromARGB(150, 198, 134, 66),
//                     ]),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Image.asset(
//                               "images/iot.png",
//                               width: 155,
//                               height: 155,
//                               scale: 2,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(0),
//                             child: Center(
//                               child: Container(
//                                   width: 200,
//                                   child: Text(
//                                     "Buy nova product to get specialized skin care!",
//                                     style: GoogleFonts.aBeeZee(
//                                         textStyle: TextStyle(
//                                             fontWeight: FontWeight.bold)),
//                                     textAlign: TextAlign.center,
//                                   )),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed:(){
//       //
//       //   },
//       //   tooltip: 'Increment',
//       //   child: const Icon(Icons.add),
//       // ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int _currentIndex1 = 0;

  final List<String> images = [
    "list.png",
    "report.png",
    "3dmap.jpg",
  ];

  final List<String> sliderItems = [
    "list.png",
    "report.png",
    "3dmap.jpg",
  ];

  final dataMap = <String, double>{
    "Disease Found": 10,
    "No Disease Found": 10,
  };

  final colorList = <Color>[Colors.greenAccent, Colors.redAccent];
  String formatTimestamp(int timestamp) {
    var format = new DateFormat('dd-MMM-yyyy');
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return format.format(date);
  }

  @override
  void initState() {
    super.initState();
    super.initState();

    @override
    void dispose() {
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "N",
              style: GoogleFonts.aBeeZee(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
            Image.asset(
              "images/nova.png",
              height: 30,
              width: 30,
            ),
            Text("va",
                style: GoogleFonts.kanit(
                  textStyle: TextStyle(fontSize: 25),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "l",
                style: GoogleFonts.sacramento(
                  textStyle: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "a",
                style: GoogleFonts.sacramento(
                  textStyle: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "bs",
                style: GoogleFonts.sacramento(
                  textStyle: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          // Wrap the entire content in SingleChildScrollView
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 10),
                    //   child: Text(
                    //     "AI Dermatologist",
                    //     softWrap: true,
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 30),
                    //   ),
                    // ),
                    // Column(
                    //   children: [
                    //     Text(
                    //       "Your Personal",
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.w400,
                    //           fontSize: 30),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 20),
                    //       child: Text(
                    //         "AI Dermatologist",
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.w600,
                    //             fontSize: 30),
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          enableInfiniteScroll: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          viewportFraction: 0.8,
                        ),
                        items: sliderItems.map((item) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("images/$item"),
                                        fit: BoxFit.cover),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 1200,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 235, 255, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Early Detection ",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ))),
                          Text("Makes a Difference",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ))
                              // TextStyle(
                              //       fontSize: 22, fontWeight: FontWeight.w600),
                              //
                              ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: 350,
                              width: MediaQuery.of(context).size.width * 1.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(86, 128, 227, 1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(22),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text("Our test can help you",
                                                    style: GoogleFonts.roboto(
                                                        textStyle: TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ))),
                                                Text("to detect Melanoma.",
                                                    style: GoogleFonts.roboto(
                                                        textStyle: TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ))
                                                    // TextStyle(
                                                    //     color: Colors.white,
                                                    //     fontSize: 19,
                                                    //     fontWeight:
                                                    //         FontWeight.w500),
                                                    ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 50),
                                              child: Image.asset(
                                                "images/scan2.png",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                        "Finding melanoma at an early stage is crucial; Early detection can vastly increase your chances for cure.",
                                        softWrap: true,
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromRGBO(128, 128, 128, 1),
                                        ))
                                        // TextStyle(
                                        //   fontSize: 16,
                                        //   color: Color.fromRGBO(128, 128, 128, 1),
                                        // ),
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                        "Most moles, brown spots and growths on the skin are harmless - but not always.",
                                        softWrap: true,
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromRGBO(128, 128, 128, 1),
                                        ))),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      // Add your button logic here
                                    },
                                    child: Text(
                                      "Read More",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Text("Your last scanning",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection(FirebaseAuth
                                        .instance.currentUser!.email
                                        .toString())
                                    .doc("posts")
                                    .collection("posts")
                                    .snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.data != null) {
                                    List<DocumentSnapshot> nn =
                                        snapshot.data!.docs;
                                    // Calculate the index to get the last two items
                                    int startIndex =
                                        nn.length >= 2 ? nn.length - 2 : 0;

                                    return GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                      ),
                                      itemCount: nn.length >= 2
                                          ? 2
                                          : nn.length, // Show the last two items or all if less than two
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        // Calculate the index based on the last two items
                                        int itemIndex = startIndex + index;

                                        return TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Details2(
                                                            imagePath: nn[
                                                                    itemIndex]
                                                                ["picture_url"],
                                                            result: nn,
                                                            index: itemIndex)));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 0),
                                                  child: Container(
                                                    height: 125,
                                                    width: 125,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                          nn[itemIndex]
                                                              ["picture_url"],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    right: 0,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10, left: 25),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // Text(
                                                        //   nn[itemIndex]["title"],
                                                        //   textAlign:
                                                        //       TextAlign.start,
                                                        //   style: TextStyle(
                                                        //     fontWeight:
                                                        //         FontWeight.bold,
                                                        //   ),
                                                        // ),
                                                        Row(
                                                          children: [
                                                            Icon(Icons
                                                                .calendar_month),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 5),
                                                              child: Text(
                                                                formatTimestamp(
                                                                    nn[itemIndex]
                                                                            [
                                                                            "time"]
                                                                        .seconds),
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    // Handle loading or error state
                                    return CircularProgressIndicator(); // You can replace this with an appropriate loading widget
                                  }
                                },
                              ),
                            ),
                          ),

                          // GridView.builder(
                          //   shrinkWrap: true,
                          //   physics:
                          //       NeverScrollableScrollPhysics(), // Disable GridView's scroll
                          //   gridDelegate:
                          //       SliverGridDelegateWithFixedCrossAxisCount(
                          //     crossAxisCount: 2,

                          //     crossAxisSpacing:
                          //         10, // Add horizontal spacing between grid items
                          //     mainAxisSpacing:
                          //         10, // Number of columns in the grid
                          //   ),
                          //   itemCount: 2, // Number of grid items
                          //   itemBuilder: (BuildContext context, int index) {
                          //     // Create a grid item here
                          //     return Card(
                          //       color: Colors.white,
                          //       margin: EdgeInsets.all(8),
                          //       child: ListTile(
                          //         title: Text('Item $index'),
                          //         onTap: () {
                          //           // Add item tap logic here
                          //         },
                          //       ),
                          //     );
                          //   },
                          // ),

                          //
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              height: 180,
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: PieChart(
                                  dataMap: dataMap,
                                  chartType: ChartType.ring,
                                  baseChartColor: Colors.blueAccent,
                                  colorList: colorList,
                                  chartValuesOptions: ChartValuesOptions(
                                    showChartValuesInPercentage: true,
                                  ),
                                  totalValue: 20,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Text("Intresting for you",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                CarouselSlider(
                                  items: images.map((image) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image:
                                                  AssetImage("images/2d.png"),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                  options: CarouselOptions(
                                    height:
                                        200.0, // Adjust the height as needed
                                    // Enable auto-play
                                    enlargeCenterPage: true,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _currentIndex1 = index;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: DotsIndicator(
                                    dotsCount: images.length,
                                    position: _currentIndex1.toDouble(),
                                    decorator: DotsDecorator(
                                      size: const Size.square(
                                          8.0), // Adjust the dot size
                                      activeSize: const Size(20.0,
                                          8.0), // Adjust the active dot size
                                      activeColor:
                                          Colors.blue, // Color of active dot
                                      spacing: EdgeInsets.all(
                                          4.0), // Adjust the spacing between dots
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 60.0,
              height: 60.0,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TakePictureScreen(
                                cameras: cameras,
                              )));
                },
                child: Icon(
                  Icons.camera,
                  size: 36.0,
                ),
                backgroundColor: Colors.blue,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Report(),
                  ),
                );
              },
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              },
            ),
            label: "",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
