class Word {
  int? id;
  String? city;
  String? country;

  Word(this.city, this.country);

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      "city": city,
      "country": country,
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Word.fromMap(Map<String, Object?> map) {
    id = (map["id"] as int?)!;
    city = (map["city"] as String?)!;
    country = (map["country"] as String?)!;
  }

  Word.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    city = json['city'];
    country = json['country'];
  }
}