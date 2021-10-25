import 'package:carely/models/bmiModel.dart';
import 'package:carely/models/bpModel.dart';

class UserModel {
  String email;
  String uid;
  String username;
  String gender;
  String bG;
  DateTime dob;
  DateTime timestamp;
  List<dynamic> bpList;
  // Map<String,dynamic> bmiList;

  
  UserModel({this.email, this.uid, this.username, this.timestamp,this.bG,this.dob,this.gender});
  
  Map toMap(UserModel user) {
    var data = Map<String, dynamic>();
  
    data["uid"] = user.uid;
    data["username"] = user.username;
    data["email"] = user.email;
    data["timestamp"] = user.timestamp;
    data["dob"] = user.dob;
    data["bG"] = user.bG;
    data["gender"] = user.gender;
  
    return data;
  }
  
  UserModel.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData["uid"];
    this.username = mapData["username"];
    this.email = mapData["email"];
    this.bG = mapData["bG"];
    this.dob = mapData["dob"];
    this.gender = mapData["gender"];
    // testing purpose
    
    this.bpList = mapData["bp"];
    // Map<String,dynamic> bpMap = Map<String,dynamic>.from(mapData["bp"]);
    // bpMap.forEach((element,value) {
    //   bp.add(BPModel
    //   (
    //     sys: element[0],
    //     dia: element[1],
    //     heart: element[2],
    //     timestamp: element[3].toString(),
    //   ));
    // });
    // this.bpList = bp;
    // this.bmiList = mapData["bmi"];
  }
}