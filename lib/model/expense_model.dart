class ExpensesModel {
  String? expenses;
  String? userName;
  String? expenseID;
  String? tags;
  String? tagID;

  ExpensesModel(
      {this.expenses, this.userName, this.expenseID, this.tags, this.tagID});

  ExpensesModel.fromJson(Map<String, dynamic> json) {
    if (json["expenses"] is String) {
      expenses = json["expenses"];
    }
    if (json["userName"] is String) {
      userName = json["userName"];
    }
    if (json["expenseID"] is String) {
      expenseID = json["expenseID"];
    }
    if (json["tags"] is String) {
      expenseID = json["tags"];
    }
    if (json["tagID"] is String) {
      tagID = json["tagID"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["expenses"] = expenses;
    data["userName"] = userName;
    data["expenseID"] = expenseID;
    data["tags"] = tags;
    data["tagID"] = tagID;

    return data;
  }
}
