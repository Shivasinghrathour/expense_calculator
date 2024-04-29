class ExpensesModel {
  String? expenses;
  String? userName;

  ExpensesModel({this.expenses, this.userName});

  ExpensesModel.fromJson(Map<String, dynamic> json) {
    if (json["expenses"] is String) {
      expenses = json["expenses"];
    }
    if (json["userName"] is String) {
      userName = json["userName"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["expenses"] = expenses;
    _data["userName"] = userName;
    return _data;
  }
}
