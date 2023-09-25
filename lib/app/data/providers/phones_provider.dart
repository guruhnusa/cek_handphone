import 'package:get/get.dart';

import '../models/phones_model.dart';

class PhonesProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Phones.fromJson(map);
      if (map is List) return map.map((item) => Phones.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Phones?> getPhones(int id) async {
    final response = await get('phones/$id');
    return response.body;
  }

  Future<Response<Phones>> postPhones(Phones phones) async =>
      await post('phones', phones);
  Future<Response> deletePhones(int id) async => await delete('phones/$id');
}
