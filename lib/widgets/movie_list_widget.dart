import 'package:flutter/material.dart';
import 'package:movify_app/app/data/models/response/movie_response.dart';
import 'package:movify_app/widgets/movie_card.dart';

class MovieListWidget extends StatelessWidget {
  final List<Movie> movieList;
  const MovieListWidget(this.movieList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movieList.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 200),
        child: Text(
          'No movie found!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      );
    } else {
      return ListView.separated(
        padding: const EdgeInsets.only(top: 30),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return MovieCard(movieList: movieList, index: index);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 25,
          );
        },
      );
    }
  }
}
