import 'dart:convert';
import 'package:ecommerce_web/controller/feeds_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'feed_detail.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  FeedsController feedCont = Get.put(FeedsController());
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return Scaffold(
            body: Obx(
              () => SafeArea(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: feedCont.feedList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(FeedDetail(),
                              arguments: feedCont.feedList[index]);
                        },
                        child: Card(
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Image.memory(
                                  base64Decode(
                                    feedCont.feedList[index]['imageLink'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  feedCont.feedList[index]['product_name'],
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.022),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }
        return Obx(() => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 7 / 11,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 5,
                  crossAxisCount: 4),
              itemCount: feedCont.feedList.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                    title: feedCont.feedList[index]['product_name'],
                    titleStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: FontWeight.bold),
                    content: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 1.5,
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Image.memory(
                                base64Decode(
                                  feedCont.feedList[index]['imageLink'],
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
                                  feedCont.feedList[index]
                                      ['product_description'],
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
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
                              feedCont.feedList[index]['imageLink'],
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
                            feedCont.feedList[index]['product_name'],
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
