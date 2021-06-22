import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tranning_app/utils/colors.dart';
import 'package:tranning_app/widgets/default_button.dart';

import '../../avtorization_sceen.dart';
import 'content.dart';



class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  var _ANIMATION_DURATION = Duration(microseconds: 200);

  List<Map<String, String>> splashData = [
    {
      "text": "Онлайн харид",
    },
    {
      "text":"Чегирмали купонлар",
    },
    {
      "text": "Қулай тўлов",
    },
  ];

  onChanged(){
    setState((){});
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboard_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(child: SizedBox()),
                    Text("Uydan mashg'ulot", style: GoogleFonts.poppins(fontSize: 24, color: MyColor.white)),
                    SizedBox(
                      height: 30,
                      child: PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemCount: splashData.length,
                        itemBuilder: (context, index) => OnBoardContent(
                          text: splashData[currentPage]['text'],
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                            (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Бошлаш",
                      press: () {
                        if(currentPage == 2) {
                          saveValue();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AvtorizationSceen()),
                          );
                        }
                        else {
                          ++currentPage;
                          onChanged();
                        }

                      },
                      color: MyColor.baseRedColor,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: _ANIMATION_DURATION,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? MyColor.baseRedColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  saveValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboard', true);
  }
}