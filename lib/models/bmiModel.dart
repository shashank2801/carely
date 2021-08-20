class BMIModel{
  String bmi;
  String uid;

  BMIModel({this.bmi,this.uid});

    Map toMap(BMIModel bmiModel) {
    var data = Map<String, dynamic>();
  
    data["uid"] = bmiModel.uid;
    data["bmi"] = bmiModel.bmi;
    return data;
  }
  
  BMIModel.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData["uid"];
    this.bmi = mapData["bmi"];
  }
}