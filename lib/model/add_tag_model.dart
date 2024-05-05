class AddTagModel {
  String? tagname;
  String? tagId;

  AddTagModel({this.tagname, this.tagId});

  AddTagModel.fromJson(Map<String, dynamic> json) {
    if (json["tagname"] is String) {
      tagname = json["tagname"];
    }
    if (json["tagId"] is String) {
      tagId = json["tagId"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["tagname"] = tagname;
    data["tagId"] = tagId;

    return data;
  }
}
