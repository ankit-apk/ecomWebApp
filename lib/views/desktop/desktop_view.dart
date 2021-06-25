import 'dart:convert';

import 'package:ecommerce_web/colors/colors.dart';
import 'package:ecommerce_web/controller/firebase_productController.dart';
import 'package:ecommerce_web/views/desktop/desktop_view_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopHome extends StatefulWidget {
  const DesktopHome({Key? key}) : super(key: key);

  @override
  _DesktopHomeState createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  FirebaseProdutController products = Get.put(FirebaseProdutController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => products.productList.isEmpty
          ? Container(
              child: Center(
                child: CircularProgressIndicator(
                  color: UiColors.buttonColors,
                ),
              ),
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 7 / 11,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 5,
                        crossAxisCount: 4),
                    itemCount: products.productList.length,
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                          title: products.productList[index]['product_name'],
                          titleStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                              fontWeight: FontWeight.bold),
                          content: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.5,
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: Image.memory(
                                      base64Decode(
                                        products.productList[index]
                                            ['imageLink'],
                                      ),
                                      scale: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        products.productList[index]
                                            ['product_description'],
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      FloatingActionButton(
                                        backgroundColor: Colors.transparent,
                                        onPressed: () {
                                          products.launchWhatsapp(
                                              products.productList[index]
                                                  ['product_name']);
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              12,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(30),
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
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.height * 0.1,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(),
                              ),
                              Positioned.directional(
                                end: 0,
                                start: 0,
                                top: 0,
                                bottom: 0,
                                textDirection: TextDirection.ltr,
                                child: Image.memory(
                                  base64Decode(
                                    products.productList[index]['imageLink'],
                                  ),
                                  fit: BoxFit.cover,
                                  scale: 2,
                                ),
                              ),
                              Positioned.directional(
                                end: 0,
                                start: 0,
                                bottom: 0,
                                textDirection: TextDirection.ltr,
                                child: AspectRatio(
                                  aspectRatio: 7 / 2,
                                  child: Container(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                              Positioned.directional(
                                end: 0,
                                start: 8,
                                bottom: 30,
                                textDirection: TextDirection.ltr,
                                child: Text(
                                  products.productList[index]['product_name'],
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.035,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Positioned.directional(
                                end: 12,
                                bottom: 30,
                                textDirection: TextDirection.ltr,
                                child: Text(
                                  '₹${products.productList[index]['product_price']}',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.035,
                                    fontWeight: FontWeight.bold,
                                    color: UiColors.buttonColors,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GridView.builder(
                    itemCount: products.productList.length,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 7 / 10.4,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 5,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(DesktopProductDetail(),
                              arguments: products.productList[index]);
                        },
                        child: Container(
                          height: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: AspectRatio(
                                    aspectRatio: 8 / 12,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Image.memory(
                                        base64Decode(
                                          products.productList[index]
                                              ['imageLink'],
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 28,
                                    decoration:
                                        BoxDecoration(color: Colors.black26),
                                    child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          products.productList[index]
                                              ['product_name'],
                                          style: TextStyle(
                                              color: UiColors.searchBoxColor,
                                              fontSize: 20),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
