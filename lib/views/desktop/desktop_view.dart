import 'dart:convert';

import 'package:ecommerce_web/colors/colors.dart';
import 'package:ecommerce_web/controller/firebase_productController.dart';
import 'package:ecommerce_web/views/desktop/desktop_view_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
          : StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  Get.to(
                    DesktopProductDetail(),
                    arguments: products.productList[index],
                  );
                },
                child: new Container(
                  height: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: AspectRatio(
                            aspectRatio: 16 / 20,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image.memory(
                                base64Decode(
                                  products.productList[index]['imageLink'],
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
                            height: MediaQuery.of(context).size.height / 28,
                            decoration: BoxDecoration(color: Colors.black26),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                products.productList[index]['product_name'],
                                style: TextStyle(
                                    color: UiColors.searchBoxColor,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 1 : 1.5),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
    );
  }
}
