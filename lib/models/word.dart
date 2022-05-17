class Word {
  int? id;
  String? desc;
  String? job;

  Word(this.desc, this.job);

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      "desc": desc,
      "job": job,
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Word.fromMap(Map<String, Object?> map) {
    id = (map["id"] as int?)!;
    desc = (map["desc"] as String?)!;
    job = (map["job"] as String?)!;
  }

  Word.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    desc = json['desc'];
    job = json['job'];
  }
}