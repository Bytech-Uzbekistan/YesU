import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _phoneNumberFieldController;

    return Scaffold(
      backgroundColor: Color.fromARGB(1, 17, 17, 17),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage('assets/images/login_page_bg.png'),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 50,
                left: 34.42,
                height: 125,
                width: 261.78,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kirish",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 43.48,
                      ),
                    ),
                    Text(
                      "Dasturni to'liq imkoniyatlaridan foydalanish uchun, dasturga kiring.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            //height: MediaQuery.of(context).size.height * 0.50,
          
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                GestureDetector(
                  onTap: (){
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if(!currentFocus.hasPrimaryFocus){
                      currentFocus.unfocus();
                    }
                  },
                  child: TextField(
                    controller: _phoneNumberFieldController,
                   // style: style,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      hintText: "Telefon",
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      new FilteringTextInputFormatter.allow(RegExp("[0-9.+]")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
