class Phones {
  String? brand;
  String? phoneName;
  String? slug;
  String? image;
  String? detail;

  Phones({this.brand, this.phoneName, this.slug, this.image, this.detail});

  Phones.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    phoneName = json['phone_name'];
    slug = json['slug'];
    image = json['image'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['brand'] = brand;
    data['phone_name'] = phoneName;
    data['slug'] = slug;
    data['image'] = image;
    data['detail'] = detail;
    return data;
  }
  static List<Phones> fromJsonList(List? data){
    if(data == null || data.isEmpty) return [];
    return data.map((e) => Phones.fromJson(e)).toList();
  }
}
