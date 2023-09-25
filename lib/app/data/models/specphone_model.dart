class Specphone {
  String? brand;
  String? phoneName;
  String? thumbnail;
  List<String>? phoneImages;
  String? releaseDate;
  String? dimension;
  String? os;
  String? storage;
  List<Specifications>? specifications;

  Specphone(
      {this.brand,
      this.phoneName,
      this.thumbnail,
      this.phoneImages,
      this.releaseDate,
      this.dimension,
      this.os,
      this.storage,
      this.specifications});

  Specphone.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    phoneName = json['phone_name'];
    thumbnail = json['thumbnail'];
    phoneImages = json['phone_images']?.cast<String>();
    releaseDate = json['release_date'];
    dimension = json['dimension'];
    os = json['os'];
    storage = json['storage'];
    if (json['specifications'] != null) {
      specifications = <Specifications>[];
      json['specifications'].forEach((v) {
        specifications?.add(Specifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['brand'] = brand;
    data['phone_name'] = phoneName;
    data['thumbnail'] = thumbnail;
    data['phone_images'] = phoneImages;
    data['release_date'] = releaseDate;
    data['dimension'] = dimension;
    data['os'] = os;
    data['storage'] = storage;
    if (specifications != null) {
      data['specifications'] = specifications?.map((v) => v.toJson()).toList();
    }
    return data;
  }
  static List<Specphone> fromJsonList(List? data){
    if(data == null || data.isEmpty) return [];
    return data.map((e) => Specphone.fromJson(e)).toList();
  }
}

class Specifications {
  String? title;
  List<Specs>? specs;

  Specifications({this.title, this.specs});

  Specifications.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['specs'] != null) {
      specs = <Specs>[];
      json['specs'].forEach((v) {
        specs?.add(Specs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    if (specs != null) {
      data['specs'] = specs?.map((v) => v.toJson()).toList();
    }
    return data;
  }
  static List<Specifications> fromJsonList(List? data){
    if(data == null || data.isEmpty) return [];
    return data.map((e) => Specifications.fromJson(e)).toList();
  }
}

class Specs {
  String? key;
  List<String>? val;

  Specs({this.key, this.val});

  Specs.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    val = json['val']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['key'] = key;
    data['val'] = val;
    return data;
  }

  static List<Specs> fromJsonList(List? data){
    if(data == null || data.isEmpty) return [];
    return data.map((e) => Specs.fromJson(e)).toList();
  }
}
