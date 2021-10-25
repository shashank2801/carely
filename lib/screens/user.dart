
import 'package:carely/components/customText.dart';
import 'package:carely/models/user.dart';
import 'package:carely/services/authService.dart';
import 'package:carely/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key key, this.currentUser}) : super(key: key);
  final UserModel currentUser;
  @override
  _UserState createState() => _UserState(currentUser: currentUser);
}

class _UserState extends State<UserProfile> {
  _UserState({this.currentUser});
  FirebaseAuth auth = FirebaseAuth.instance;
  final userRef = FirebaseFirestore.instance.collection("users");
  final UserModel currentUser;
  // String _uid = '', _user = '', _email = '';
  // List<dynamic> bp;
  // bool isLoading = true;


  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getCurrentUser();
  // }

  // getCurrentUser() async {
  //   UserModel currentUser = await context
  //       .read<AuthenticationService>()
  //       .getUserFromDB(uid: auth.currentUser.uid);

  //   _currentUser = currentUser;

  //   setState(() {
  //     _uid = _currentUser.uid;
  //     _user = _currentUser.username;
  //     _email = _currentUser.email;
  //     bp = currentUser.bpList;
  //     print(bp);
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [lime, green],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .13,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.18,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10.0)),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            title: context.watch<AuthenticationService>().currUser.username.toString(),
                            size: 40,
                            weight: FontWeight.bold,
                            color: black,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.02,
                          )
                        ],
                      ),
                    ),
                  ),
                  // isLoading?Container():
                  // ListView.builder(
                  //   scrollDirection: Axis.vertical,
                  //   shrinkWrap: true,
                  //   itemCount: bp.length,
                  //   itemBuilder:(BuildContext context,int index){
                  //         return Column(
                  //           children: [
                  //             Text(bp[index]["sys"]),
                  //             // Text(bp[index].dia),
                  //             // Text(bp[index].heart),
                  //             // Text(bp[index].timestamp.toString()),
                  //           ],
                  //         );
                  //   })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: black,width: 4),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('images/logo.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
