import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movify_app/app/data/models/response/movie_response.dart';
import 'package:movify_app/app/routes/app_pages.dart';
import 'package:movify_app/utils/image/custom_network_image.dart';

class MovieCard extends StatelessWidget {
  final List<Movie> movieList;
  final int index;

  const MovieCard({
    Key? key,
    required this.movieList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.movieDetail,
        arguments: movieList[index],
      ),
      child: Container(
        height: 220,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: 2,
              color: Colors.grey[800]!
            )
          ]
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                    tag: movieList[index].id.toString(),
                    child: CustomNetworkImage(
                      image: movieList[index].posterPath != null
                          ? movieList[index].posterPath!
                          : '',
                      height: 200,
                      width: double.infinity,
                    ),
                  )),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieList[index].title ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${movieList[index].voteAverage!.round()} / 10',
                        style:
                            const TextStyle(color: Colors.yellow, fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    movieList[index].releaseDate ?? '',
                    style: const TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
