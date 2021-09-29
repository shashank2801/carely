class BMIModel{
  String bmi;
  String uid;
  DateTime timestamp;

  BMIModel({this.bmi,this.uid,this.timestamp});

    Map toMap(BMIModel bmiModel) {
    var data = Map<String, dynamic>();
  
    data["uid"] = bmiModel.uid;
    data["bmi"] = bmiModel.bmi;
    data["timestamp"] = bmiModel.timestamp;
    return data;
  }
  
  BMIModel.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData["uid"];
    this.bmi = mapData["bmi"];
    this.timestamp = mapData["timestamp"];
  }
}