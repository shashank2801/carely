
import 'package:carely/models/bmiModel.dart';
import 'package:carely/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  UserModel userModel = UserModel();


  // ****************************************** Getting current user over state *******************************************

  UserModel currUser = UserModel(uid: "",username: "",bG: "",timestamp: null,gender: "",dob: null,email: "");
  // BPModel bpModel = BPModel();
  // BMIModel bmiModel = BMIModel();

  final userRef = FirebaseFirestore.instance.collection("users");

  // final bpRef = FirebaseFirestore.instance.collection("bp");
  // final bmiRef = FirebaseFirestore.instance.collection("bmi");

  List<Map> bpList = [];
  List<Map> bmiList = [];
  List<dynamic> resultBPList = [];
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    final DocumentSnapshot doc = await userRef.doc(_firebaseAuth.currentUser.uid).get();
    // print(doc);
    currUser = UserModel.fromMap(doc.data());
      return "Signed In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, password: password);
      
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> addUserToDB(
      {String uid, String username, String email, DateTime timestamp}) async {
    userModel = UserModel(
        uid: uid, username: username, email: email, timestamp: timestamp);

    await userRef.doc(uid).set(userModel.toMap(userModel));
  }

  Future<UserModel> getUserFromDB({String uid}) async {
    final DocumentSnapshot doc = await userRef.doc(uid).get();
    // print(doc);
    return UserModel.fromMap(doc.data());
  }

  Future<void> loadUser({String uid}) async{
    try{
      final DocumentSnapshot doc = await userRef.doc(_firebaseAuth.currentUser.uid).get();
    // print(doc);
      currUser = UserModel.fromMap(doc.data());
      return "Done";
    }
    catch (e){
      print(e);
    }
    
  }
  
  Future addBPDetails(
      {String uid,
      String sys,
      String dia,
      String pulse,
      DateTime timestamp}) async {
    // bpModel = BPModel(
    //     uid: uid, sys: sys, dia: dia, heart: pulse, timestamp: timestamp);

    // await bpRef.doc(uid).set(bpModel.toMap(bpModel));
    // await bpRef.doc(uid).update(data)
    // await bpRef.add(bpModel.toMap(bpModel));

    Map<String, dynamic> mapData = {
      "sys": sys,
      "dia": dia,
      "pulse": pulse,
      "timestamp": timestamp
    };

    bpList.add(mapData);
    try {
      // to add to map of arrays
      await userRef
          .doc(uid)
          .set({"bp": FieldValue.arrayUnion(bpList)}, SetOptions(merge: true));


      // to add to collection
      // await userRef
      //   .doc(uid)
      //   .collection("bp")
      //   .add(mapData);

      return "Entry done";
    } on FirebaseException catch (e) {
      return e.message;
    }

    // .then((_){AlertDialog(
    //             title: Text("Info"),
    //             content: Text("Blood Pressure Details Saved"),
    //           );});
  }


  //TODO: Extract information from collection.
  // Future getBPFromDB({String uid}) async {
  //   // final DocumentSnapshot doc = await bmiRef.doc(uid).get();
  //   // print(doc);
  //   // return BPModel.fromMap(doc.data());

  //   // final DocumentSnapshot doc = await userRef.doc(uid).get();
  //   // print(doc.data().toString());

  //   final CollectionReference doc =  userRef.doc(uid).collection('bp');
  //   print(doc.snapshots());
  //   return doc;


  //   // final DocumentSnapshot doc = await userRef.doc(uid).get().then((value){
  //   //   value.data().forEach((result){
  //   //   userRef.doc(result.uid).collection("bp").get().then((value1){value1.docs.forEach((element) {print(element.data());});});
  //   //   });
  //   // });
  //   // print(doc);
  // }


  //*************************************TESTING PURPOSE ONLY**************************************** */


  List getBPFromDB({String uid}) {
    Stream<QuerySnapshot> doc = userRef.doc(uid).collection('bp').snapshots();
    doc.forEach((field) {field.docs.asMap().forEach((key, value) {
      print(field.docs[key]);
      resultBPList.add(field.docs[key]);
      });
      });
    print(resultBPList);
    return resultBPList;
    // QuerySnapshot querySnapshot = await doc.get();
    // final allData = querySnapshot.docs.map((doc)=>doc.data()).toList();
    // print(allData);
    // return doc;
  } 

  Future addBMIDetails(
      {String uid, String bmi, DateTime timestamp}) async {
    // bmiModel = BMIModel(uid: uid,bmi: bmi,timestamp: timestamp);

    Map<String, dynamic> mapData = {"bmi": bmi, "timestamp": timestamp};

    bmiList.add(mapData);
    try{
    // await userRef
    //     .doc(uid)
    //     .set({"bmi": FieldValue.arrayUnion(bmiList)}, SetOptions(merge: true));

    await userRef
        .doc(uid)
        .collection("bmi")
        .add(mapData);

        return "Entry done";

    } on FirebaseException catch(e){
      return e.message;
    }
  }

  // TODO: Extract information
  Future<BMIModel> getBMIFromDB({String uid}) async {
    // final DocumentSnapshot doc = await bmiRef.doc(uid).get();
    // print(doc);
    // return BMIModel.fromMap(doc.data());
  }
}
