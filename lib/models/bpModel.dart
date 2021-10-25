class BPModel{
  String sys;
  String dia;
  String heart;
  String uid;
  String timestamp;

  BPModel({this.sys,this.dia,this.heart,this.uid,this.timestamp});

    Map toMap(BPModel bpModel) {
    var data = Map<String, dynamic>();
  
    data["uid"] = bpModel.uid;
    data["sys"] = bpModel.sys;
    data["dia"] = bpModel.dia;
    data["heart"] = bpModel.heart;
    data["timestamp"] = bpModel.timestamp;
  
    return data;
  }
  
  BPModel.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData["uid"];
    this.sys = mapData["sys"];
    this.dia = mapData["dia"];
    this.heart = mapData["heart"];
    this.timestamp = mapData["timestamp"];
  }
}