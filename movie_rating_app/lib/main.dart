import 'package:flutter/material.dart';
import 'package:movie_rating_app/screens/add_new_movie_screen.dart';
import 'package:movie_rating_app/screens/login_screen.dart';
import 'package:movie_rating_app/screens/movie_list_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: LoginScreen(),
    initialRoute: '/login_screen',
    routes: {
      '/login_screen': (context) => LoginScreen(),
      '/movie_list_screen': (context) => MovielistScreen(),
      '/add_new_movie_screen': (context) => AddNewMovieScreen(),
    },
  ));
}



