import 'package:flutter/material.dart';
import 'package:movie_rating_app/list_of_movies.dart';

class MovielistScreen extends StatefulWidget {
  const MovielistScreen({Key? key}) : super(key: key);

  @override
  State<MovielistScreen> createState() => _MovielistScreenState();
}

class _MovielistScreenState extends State<MovielistScreen> {

  static const BACKGROUND_IMAGE_URL = 'assets/movie_rating_background.jpg';
  static const ADD_NEW_MOVIE_BUTTON_TEXT = 'Add new movie';
  static const APP_BAR_HEADING_STRING = 'Movies';

  Map userData = {};
  List listOfMovies = [];


  Widget listView(movie){
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Movie: ${movie.movieName}',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.amber[800],
              ),
            ),
            SizedBox(height: 6.0,),
            Text(
              'Rating: ${movie.rating}',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.amberAccent[400],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    userData = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;

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
            "${userData['userName']}'s $APP_BAR_HEADING_STRING",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0,
              color: Colors.amber[500],
              //fontStyle: FontStyle.italic
            ),
          ),
          //backgroundColor: Colors.blueGrey[900],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: listOfMovies.map((movie) => listView(movie)).toList(),
            ),
            SizedBox(height: 20.0,),
            ElevatedButton(
              //async?
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/add_new_movie_screen');
                setState(() {
                  listOfMovies.add(ListOfMovies(movieName: result['movieName'], rating: result['movieRating']));
                });
              },
              child: Text(
                  ADD_NEW_MOVIE_BUTTON_TEXT,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states){
                          if(states.contains(MaterialState.pressed)) {
                            return Colors.amberAccent;
                          }
                          return Colors.amberAccent;
                        },
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
