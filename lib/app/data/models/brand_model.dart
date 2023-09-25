class Brand {
  int? brandId;
  String? brandName;
  String? brandSlug;
  int? deviceCount;
  String? detail;

  Brand(
      {this.brandId,
      this.brandName,
      this.brandSlug,
      this.deviceCount,
      this.detail});

  Brand.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    brandSlug = json['brand_slug'];
    deviceCount = json['device_count'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['brand_id'] = brandId;
    data['brand_name'] = brandName;
    data['brand_slug'] = brandSlug;
    data['device_count'] = deviceCount;
    data['detail'] = detail;
    return data;
  }

  static List<Brand> fromJsonList(List? data){
    if(data == null || data.isEmpty) return [];
    return data.map((e) => Brand.fromJson(e)).toList();
  }
  @override
  String toString() => brandName!;
}
