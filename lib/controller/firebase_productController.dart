import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class FirebaseProdutController extends GetxController {
  var productList = List.empty(growable: true).obs;
  var status = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  getProducts() async {
    try {
      CollectionReference c = FirebaseFirestore.instance.collection('links');
      c.snapshots().listen((products) {
        productList.value = products.docs;
      });
    } finally {
      status(false);
    }
  }

  launchWhatsapp(String prn) async {
    final link = WhatsAppUnilink(
      phoneNumber: '+91-7272911770',
      text: "Hey! I'm inquiring about the $prn",
    );
    await launch('$link');
  }
}
