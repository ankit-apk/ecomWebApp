import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopProductDetail extends StatefulWidget {
  const DesktopProductDetail({Key? key}) : super(key: key);

  @override
  _DesktopProductDetailState createState() => _DesktopProductDetailState();
}

class _DesktopProductDetailState extends State<DesktopProductDetail> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, screenConstraints) {
        if (screenConstraints.maxWidth > 600) {
          return Scaffold(
            // body: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Image.memory(
            //       base64Decode(
            //         Get.arguments['imageLink'],
            //       ),
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Text(
            //           Get.arguments['product_name'],
            //         ),
            //         Text(
            //           Get.arguments['product_price'],
            //         ),
            //         Text(
            //           Get.arguments['product_description'],
            //         ),
            //         // Text(
            //         //   Get.arguments['poduct_description'],
            //         // ),
            //       ],
            //     )
            //   ],
            // ),
            body: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Positioned.directional(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height,
                    child: Image.memory(
                      base64Decode(
                        Get.arguments['imageLink'],
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned.directional(
                  textDirection: TextDirection.rtl,
                  top: 20,
                  child: Column(
                    children: [
                      Text(
                        Get.arguments['product_name'],
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        Get.arguments['product_description'],
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.028,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
