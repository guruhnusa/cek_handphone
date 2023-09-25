import 'package:get/get.dart';

import '../models/brand_model.dart';

class BrandProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Brand.fromJson(map);
      if (map is List) return map.map((item) => Brand.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Brand?> getBrand(int id) async {
    final response = await get('brand/$id');
    return response.body;
  }

  Future<Response<Brand>> postBrand(Brand brand) async =>
      await post('brand', brand);
  Future<Response> deleteBrand(int id) async => await delete('brand/$id');
}
