import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {

  RxString idBrand = "".obs;
  RxString idPhone = "".obs;
  var specPhone = {}.obs;

  Future<void> PhoneSpec() async {
    try {
      var response = await http.get(Uri.parse(
          "https://phone-specs-clzpu7gyh-azharimm.vercel.app/$idPhone"));
      var specData = jsonDecode(response.body)["data"];
      specPhone.value = specData;
      print(specPhone);
    } catch (e) {
      print("error: $e");
    }
  }
}
