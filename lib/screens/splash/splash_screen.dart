import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:yesu_project/screens/main/main_screen.dart';
import 'package:yesu_project/screens/onboard/onboarding_screen/onboard_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences prefs;
  Future<bool> _mockCheckForSession() async {
    prefs = await SharedPreferences.getInstance();
    await Future.delayed(Duration(milliseconds: 3000), () {});
    return true;
  }


  openOnBoardingScreen(){
    bool boardBool = prefs.getBool('onboard');
    bool avtorizationBool = prefs.getBool('avtorization');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => (boardBool != null && avtorizationBool != null) ? MainScreen() : OnBoardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/images/splash_image.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }



  @override
  Future<void> initState(){
    super.initState();
    // _mockCheckForSession().then((value) {
    //   if (value) {
    //     openOnBoardingScreen();
    //   }
    // }
    // );
  }
}
