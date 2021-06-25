import 'package:ecommerce_web/colors/colors.dart';
import 'package:ecommerce_web/views/desktop/desktop_view.dart';
import 'package:ecommerce_web/views/desktop/feeds.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: UiColors.searchBoxColor,
        appBar: AppBar(
          backgroundColor: UiColors.buttonColors,
          title: Text(
            'Soul Art 🎨',
            style: TextStyle(
              fontFamily: 'TheSecret',
              fontSize: MediaQuery.of(context).size.height * 0.05,
              fontWeight: FontWeight.w500,
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(FontAwesomeIcons.home),
              ),
              Tab(
                icon: Icon(Icons.feed),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.info),
              ),
            ],
          ),
        ),

        //Pages are controlled from here

        body: TabBarView(
          children: [
            DesktopHome(),
            FeedView(),
            Center(
              child: Text('Coming Soon'),
            ),
          ],
        ),
      ),
    );
  }
}

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   AuthController authController = Get.put(AuthController());
//   startTime() async {
//     var duration = Duration(seconds: 3);
//     return Timer(duration, home);
//   }
//
//   home() {
//     Get.offAll(authController.pageProvider());
//   }
//
//   @override
//   void initState() {
//     startTime();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: UiColors.splashColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 46.0),
//                 child: Center(
//                   child: Text(
//                     "FoodY",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: MediaQuery.of(context).size.height * 0.040,
//                       color: UiColors.textColor,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 16.0, right: 16.0, top: 30, bottom: 00),
//                 child: Center(
//                   child: Text(
//                     "Foods that eat hunger!",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: MediaQuery.of(context).size.height * 0.030,
//                       color: UiColors.textColor,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 child: RiveAnimation.asset(
//                   'assets/hand.riv',
//                   // fit: BoxFit.fill,
//                 ),
//                 height: MediaQuery.of(context).size.height / 0.8,
//                 width: MediaQuery.of(context).size.width,
//               ),
//               // Image.asset('assets/splash.png'),
//               // Padding(
//               //   padding: const EdgeInsets.only(
//               //       left: 16.0, right: 16.0, top: 30, bottom: 30),
//               //   child: Center(
//               //     child: Text(
//               //       "Foods that eat hunger!",
//               //       style: TextStyle(
//               //         fontWeight: FontWeight.bold,
//               //         fontSize: MediaQuery.of(context).size.height * 0.030,
//               //         color: UiColors.textColor,
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               // LoadingFilling.square(
//               //   borderColor: UiColors.buttonColors,
//               //   fillingColor: UiColors.buttonColors,
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
