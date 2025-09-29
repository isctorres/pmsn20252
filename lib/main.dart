import 'package:flutter/material.dart';
import 'package:pmsn20252/screens/add_movie_screen.dart';
import 'package:pmsn20252/screens/home_screen.dart';
import 'package:pmsn20252/screens/list_movies.dart';
import 'package:pmsn20252/screens/login_screen.dart';
import 'package:pmsn20252/utils/theme_app.dart';
import 'package:pmsn20252/utils/value_listener.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ValueListener.isDark,
      builder: (context, value, _) {
        return MaterialApp(
          theme: value ? ThemeApp.darkTheme() : ThemeApp.lightTheme(),
          routes: {
            "/home" : (context) => const HomeScreen(),
            "/listdb" : (context) => const ListMovies(),
            "/add" : (context) => const AddMovieScreen()
          },  
          title: 'Material App',
          home: LoginScreen(),
        );
      }
    );
  }
}
