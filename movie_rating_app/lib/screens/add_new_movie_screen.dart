import 'package:flutter/material.dart';

class AddNewMovieScreen extends StatefulWidget {
  const AddNewMovieScreen({Key? key}) : super(key: key);

  @override
  State<AddNewMovieScreen> createState() => _AddNewMovieScreenState();
}

class _AddNewMovieScreenState extends State<AddNewMovieScreen> {

  static const BACKGROUND_IMAGE_URL = 'assets/login_background.jpg';
  static const APP_BAR_TITLE = 'Add new Movie';
  static const MOVIE_NAME_STRING = 'movie name';
  static const MOVIE_RATING_STRING = 'your rating';
  static const LABEL_TEXT_MOVIE_STRING = 'Movie';
  static const LABEL_TEXT_RATING_STRING = 'Rating';
  static const TEXT_BUTTON_STRING = 'Add movie';

  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _ratingcontroller = TextEditingController();
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
          backgroundColor: Colors.green[900],
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
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
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
                              labelText: LABEL_TEXT_MOVIE_STRING,
                              hintText: MOVIE_NAME_STRING,
                              hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 30.0,),
                          TextField(
                            controller: _ratingcontroller,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              fillColor: Colors.amber[100],
                              filled: true,
                              labelText: LABEL_TEXT_RATING_STRING,
                              hintText: MOVIE_RATING_STRING,
                              hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                          ),
                          SizedBox(height: 30.0,),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context,{
                                'movieName' : _namecontroller.text,
                                'movieRating' : double.parse(_ratingcontroller.text),
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
