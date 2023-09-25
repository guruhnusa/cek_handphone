import 'package:cek_handphone/app/data/models/brand_model.dart';
import 'package:cek_handphone/app/data/models/phones_model.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Check Specifications Phone',
              style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            DropdownSearch<Brand>(
              popupProps: PopupProps.menu(
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) =>
                    ListTile(
                      title: Text("${item.brandName}"),
                    ),
              ),
              asyncItems: (text) async {
                var response = await Dio().get(
                    "https://phone-specs-clzpu7gyh-azharimm.vercel.app/brands");
                var brandphone = Brand.fromJsonList(response.data["data"]);
                return brandphone;
              },
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Choose Brand Phone",
                    labelStyle: const TextStyle(fontSize: 15),
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  )),
              onChanged: (Brand? data) {
                controller.idBrand.value = data?.brandSlug ?? "0";
                print(data?.toJson());
              },
            ),
            const SizedBox(
              height: 30,
            ),
            DropdownSearch<Phones>(
              itemAsString: (item) => item.phoneName ?? "",
              popupProps: PopupProps.menu(
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) =>
                    ListTile(
                      title: Text("${item.phoneName}"),
                    ),
              ),
              asyncItems: (text) async {
                var response = await Dio().get(
                    "https://phone-specs-clzpu7gyh-azharimm.vercel.app/brands/${controller
                        .idBrand}");
                var result =
                Phones.fromJsonList(response.data["data"]["phones"]);
                return result;
              },
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Choose Model Phone",
                    labelStyle: const TextStyle(fontSize: 15),
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  )),
              onChanged: (Phones? data) {
                controller.idPhone.value = data?.slug ?? "0";
                print(controller.idPhone.value = data?.slug ?? "0");
                print(data?.toJson());
              },
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(13),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  controller.PhoneSpec();
                },
                child: Text("Check Specifications", style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 15),)),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Obx(() {
                var specData = controller.specPhone;
                if (specData.isNotEmpty) {
                  return Material(
                    borderRadius: BorderRadius.circular(30),
                    elevation: 15,
                    child: Container(
                      height: 350,
                      width: double.infinity,
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Text(specData["phone_name"], style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Container(
                            height: 160,
                            width: 160,
                            child: Image.network(
                                specData["thumbnail"], fit: BoxFit.contain),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 38),
                            child: Column(
                              children: [
                                Text(specData["release_date"],
                                  style: TextStyle(fontSize: 14),),
                                Text(specData["storage"],
                                    style: TextStyle(fontSize: 14)),
                                Text(specData["os"],
                                    style: TextStyle(fontSize: 14)),
                                Text(
                                    specData["specifications"][12]["specs"][0]["val"][0],
                                    style: TextStyle(fontSize: 14)),
                                Text(
                                    specData["specifications"][4]["specs"][2]["val"][0],
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(child: Text(""));
                }
              }),
            ),
            // ElevatedButton(onPressed: () {
            //   controller.increment();
            // }, child: Text("Tambah")),
            // Obx(() {
            //   return Text("${controller.data}");
            // })
          ],
        ));
  }
}
