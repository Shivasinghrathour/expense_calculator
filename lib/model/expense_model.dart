class ExpensesModel {
  String? expenses;
  String? userName;
  String? expenseID;

  ExpensesModel({this.expenses, this.userName, this.expenseID});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["expenses"] = expenses;
    data["userName"] = userName;
    data["expenseID"] = expenseID;
    return data;
  }
}
