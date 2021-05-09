import 'package:carely/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  UserModel userModel = UserModel();
  final userRef = FirebaseFirestore.instance.collection("users");

  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email,String password}) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed In";

    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }

  Future<String> signUp({String email,String password}) async{
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
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
    print(doc);
      return UserModel.fromMap(doc.data());
  }
}