import 'package:flutter/material.dart';
import 'package:flutter_themoviedb_app/widgets/movie_details/movie_details_main_info_widget.dart';
import 'package:flutter_themoviedb_app/widgets/movie_details/movie_details_main_screen_cast_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  MovieDetailsWidget({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tom Clancy`s Whithout Remorse'),
      ),
      body: ColoredBox(
        color: Color.fromRGBO(24, 23, 27, 1.0),
        child: ListView(
          children: [
            MovieDatailsMainInfoWidget(),
            SizedBox(height: 30),
            MovieDetailsMainScreenCastWidget()
          ],
        ),
      ),
    );
  }
}
