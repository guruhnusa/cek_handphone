import 'package:get/get.dart';

import '../models/specphone_model.dart';

class SpecphoneProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Specphone.fromJson(map);
      if (map is List)
        return map.map((item) => Specphone.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Specphone?> getSpecphone(int id) async {
    final response = await get('specphone/$id');
    return response.body;
  }

  Future<Response<Specphone>> postSpecphone(Specphone specphone) async =>
      await post('specphone', specphone);
  Future<Response> deleteSpecphone(int id) async =>
      await delete('specphone/$id');
}
