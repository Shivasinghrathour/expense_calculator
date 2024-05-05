class AddTagModel {
  String? tagname;
  String? tagId;
  String? expenses;
  String? expensesId;

  AddTagModel({this.tagname, this.tagId, this.expenses, this.expensesId});

  AddTagModel.fromJson(Map<String, dynamic> json) {
    if (json["tagname"] is String) {
      tagname = json["tagname"];
    }
    if (json["tadId"] is String) {
      tagId = json["tadId "];
    }
    if (json["expenses"] is String) {
      expenses = json["expenses"];
    }
    if (json["expensesId"] is String) {
      expensesId = json["expensesId"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["tagname"] = tagname;
    _data["tadId "] = tagId;
    _data["expenses"] = expenses;
    _data["expensesId "] = expensesId;
    return _data;
  }
}
