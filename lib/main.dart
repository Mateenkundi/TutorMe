import 'package:education/Signup/sign_up_screen.dart';
import 'package:education/supportive/role_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import 'Login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoarding(),
    );
  }
}

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        finishButtonStyle: FinishButtonStyle(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        trailingFunction: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        onFinish: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AskRoleScreen()));
        },
        skipTextButton: Text('Skip'),
        trailing: Text('Login'),
        indicatorAbove: true,
        centerBackground: true,
        background: [
          Image.asset('assets/slide_1.png'),
          Image.asset('assets/slide_2.png'),
        ],
        totalPage: 2,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 400,
                ),
                Text("Welcome to TutorMe Now!",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
                Text(
                    'Where we bring education to life through seamless online connections between students and expert tutors. Our platform is designed to offer personalized and accessible learning experiences across a wide array of subjects.', textAlign: TextAlign.justify,),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 400,
                ),
                Text("Empowering Academic Success!",
                    style:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
                Text('TutorMe Now connects students with expert tutors for personalized online learning, leveraging technology to empower academic success.', textAlign: TextAlign.justify,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
