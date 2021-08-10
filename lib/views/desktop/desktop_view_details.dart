import 'dart:convert';

import 'package:ecommerce_web/colors/colors.dart';
import 'package:ecommerce_web/controller/firebase_productController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopProductDetail extends StatefulWidget {
  const DesktopProductDetail({Key? key}) : super(key: key);

  @override
  _DesktopProductDetailState createState() => _DesktopProductDetailState();
}

class _DesktopProductDetailState extends State<DesktopProductDetail> {
  FirebaseProdutController products = Get.put(FirebaseProdutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          products.launchWhatsapp(Get.arguments['product_name']);
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 12,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
                color: UiColors.buttonColors,
              ),
              child: Center(
                child: Text(
                  "Query",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 8 / 10,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      child: Image.memory(
                        base64Decode(Get.arguments['imageLink']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 52.0, left: 16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 10,
                  ),
                  child: Text(
                    Get.arguments['product_name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.030,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Rs. ${Get.arguments['product_price']}',
                        style: TextStyle(
                            color: UiColors.buttonColors,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.035),
                      ),
                      Text(
                        '+ Rs.60\nDelivery',
                        style: TextStyle(
                            color: UiColors.textColor2,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 100),
              child: Container(
                child: Text(
                  '${Get.arguments['product_description']}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.026,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
