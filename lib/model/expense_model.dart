class ExpensesModel {
  String? expenses;

  String? expenseID;

  ExpensesModel({this.expenses, this.expenseID});

  ExpensesModel.fromJson(Map<String, dynamic> json) {
    if (json["expenses"] is String) {
      expenses = json["expenses"];
    }

    if (json["expenseID"] is String) {
      expenseID = json["expenseID"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["expenses"] = expenses;

    data["expenseID"] = expenseID;

    return data;
  }
}
