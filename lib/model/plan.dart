class PlanDetailModel {
  int id;
  String amount;
  String firstEmi;
  String nineEMI;
  String elevenEMI;
  String totalPurchase;
  String savings;

  PlanDetailModel(
      {this.id,
      this.amount,
      this.firstEmi,
      this.nineEMI,
      this.elevenEMI,
      this.totalPurchase,
      this.savings});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['ID'] = this.id;
    map['Amount'] = this.amount;
    map['FirstEmi'] = this.firstEmi;
    map['NineEmi'] = this.nineEMI;
    map['ElevenEMI'] = this.elevenEMI;
    map['TotalPurchase'] = this.totalPurchase;
    map['Savings'] = this.savings;
    return map;
  }

  PlanDetailModel.fromMap(Map<String, dynamic> map) {
    this.id = map['ID'];
    this.amount = map['Amount'];
    this.firstEmi = map['FirstEmi'];
    this.nineEMI = map['NineEmi'];
    this.elevenEMI = map['ElevenEMI'];
    this.totalPurchase = map['TotalPurchase'];
    this.savings = map['Savings'];
  }
}
