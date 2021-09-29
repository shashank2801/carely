import 'package:carely/components/Button.dart';
import 'package:carely/services/authService.dart';
import 'package:carely/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// TODO: Add controllers to textfields to reset.

class BP extends StatefulWidget {
  @override
  _BPState createState() => _BPState();
}

class _BPState extends State<BP> {
  String sys = "", dia = "", pulse = "";

  FirebaseAuth auth = FirebaseAuth.instance;

  final DateTime timestamp = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Sys', hintStyle: TextStyle(color: grey)),
                  onChanged: (value) {
                    sys = value.toString().trim();
                  },
                ),
              ),
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Dia', hintStyle: TextStyle(color: grey)),
                  onChanged: (value) {
                    dia = value.toString().trim();
                  },
                ),
              ),
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Pulse', hintStyle: TextStyle(color: grey)),
                  onChanged: (value) {
                    pulse = value.toString().trim();
                  },
                ),
              ),
              Button(
                onPressed: () async {
                  final message = await context
                      .read<AuthenticationService>()
                      .addBPDetails(
                          uid: auth.currentUser.uid,
                          sys: sys,
                          dia: dia,
                          pulse: pulse,
                          timestamp: timestamp);
                  print(message);
                  if(message == "Entry done") {

                    ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Blood Pressure Details Saved.")));
                    // AlertDialog(
                    //   title: Text("Info"),
                    //   content: Text("Blood Pressure Details Saved"),
                    //   actions: [
                    //     TextButton(
                    //         onPressed: () => Navigator.of(context).pop(),
                    //         child: Text("OK")),
                    //   ],
                    // );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Error! Please try again.")));
                    // AlertDialog(
                    //   title: Text("Info"),
                    //   content: Text("Error! Please try again"),
                    //   actions: [
                    //     TextButton(
                    //         onPressed: () => Navigator.of(context).pop(),
                    //         child: Text("OK")),
                    //   ],
                    // );
                  }
                },
                text: "Save",
              )
            ],
          ),
        ),
      ),
    );
  }
}
