import 'package:carely/components/Button.dart';
import 'package:carely/components/routes.dart';
import 'package:carely/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _animation;


  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);
    _animation = ColorTween(begin: lime, end: green)
        .animate(_animationController);

    _animationController.forward();

    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed)
        _animationController.reverse();

      else if(status == AnimationStatus.dismissed)
        _animationController.forward();
     });

       _animationController.addListener(() {
      setState(() {});
    });
  }

  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height*.20,),
          DefaultTextStyle(
          style: TextStyle(
              fontFamily: 'Ranchers',
              fontSize: 75.0,
              fontWeight: FontWeight.w700,
            ),
          child: AnimatedTextKit(
            repeatForever: true,
            
            animatedTexts: [
              TypewriterAnimatedText('Care.Ly',speed: const Duration(milliseconds: 100)),
            ],
          ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.05,),
              Hero(
          tag: 'Logo',
          child: Container(
            child: Image.asset('images/logo.png',height: 180,),
            // height: 100.0,
            // width: 100.0,
          ),
              ),
          SizedBox(
            height: 48.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                text: 'Log In',
                color: white,
                fw: FontWeight.w700,
                fs: 22.0,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.login_screen);
                },
              ),
                          Button(
            text: 'Register',
            color: white,
            fw: FontWeight.w700,
            fs: 22.0,
            onPressed: () {
              Navigator.pushNamed(context, Routes.registration_screen);
            },
          ),
            ],
          ),

        ],
      ),
    );
  }
}

