import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _namecontroller = TextEditingController();

  static const APP_BAR_TITLE = 'Movie Rating';
  static const WELCOME_BACK_STRING = 'Welcome\nback';
  static const USER_NAME_STRING = 'user name';
  static const USER_PASS_STRING = 'password';
  static const BACKGROUND_IMAGE_URL = 'assets/login_background.jpg';
  static const TEXT_BUTTON_STRING = 'Sign in';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(BACKGROUND_IMAGE_URL),
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
              APP_BAR_TITLE,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0,
              color: Colors.amber[100],
              //fontStyle: FontStyle.italic
            ),
          ),
          //backgroundColor: Colors.blueGrey[900],
          ),
        body: Stack(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 35.0, top: 155.0),
                child: Text(
                  WELCOME_BACK_STRING,
                  style: TextStyle(
                    fontSize: 60.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.amber[100],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35.0, right: 35.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _namecontroller,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              fillColor: Colors.amber[100],
                              filled: true,
                              hintText: USER_NAME_STRING,
                              hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(height: 30.0,),
                          TextField(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.amber[100],
                              filled: true,
                              hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                              hintText: USER_PASS_STRING,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0,),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/movie_list_screen', arguments: {
                                  'userName' : _namecontroller.text
                                });
                              },
                              child: Text(
                                  TEXT_BUTTON_STRING,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 30.0,
                                  color: Colors.amber[100],
                                ),
                              ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}