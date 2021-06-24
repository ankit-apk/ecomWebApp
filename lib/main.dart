import 'package:ecommerce_web/colors/colors.dart';
import 'package:ecommerce_web/views/desktop/desktop_view.dart';
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
        // body: LayoutBuilder(
        //   builder: (BuildContext context, BoxConstraints constraints) {
        //     if (constraints.maxWidth > 600) {
        //       return DefaultTabController(
        //         length: 3,
        //         child: Scaffold(
        //           backgroundColor: UiColors.searchBoxColor,
        //           appBar: AppBar(
        //             backgroundColor: UiColors.buttonColors,
        //             title: Text('FoodY'),
        //             bottom: TabBar(
        //               labelColor: Colors.white,
        //               indicatorColor: Colors.white,
        //               tabs: [
        //                 Tab(
        //                   icon: Icon(FontAwesomeIcons.home),
        //                 ),
        //                 Tab(
        //                   icon: Icon(Icons.feed),
        //                 ),
        //                 Tab(
        //                   icon: Icon(FontAwesomeIcons.info),
        //                 ),
        //               ],
        //             ),
        //           ),

        //           //Pages are controlled from here

        //           body: TabBarView(
        //             children: [
        //               DesktopHome(),
        //               Icon(Icons.directions_transit),
        //               Icon(Icons.feed),
        //             ],
        //           ),
        //         ),
        //       );
        //     }
        //     return BuildContainer();
        //   },
        // ),
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: UiColors.searchBoxColor,
            appBar: AppBar(
              backgroundColor: UiColors.buttonColors,
              title: Text('FoodY'),
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
                Icon(Icons.directions_transit),
                Icon(Icons.feed),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
