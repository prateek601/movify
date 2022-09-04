import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movify_app/app/modules/movie_detail/controllers/movie_detail_controller.dart';
import 'package:movify_app/utils/image/custom_network_image.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  const MovieDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Hero(
                  tag: controller.movie.id.toString(),
                  child: CustomNetworkImage(
                    image: controller.movie.posterPath ?? '',
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                const Positioned(
                  top: 5,
                  left: 5,
                  child: BackButton(color: Colors.white70),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      controller.movie.title ?? 'Movie title',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      controller.movie.overview ?? '',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Release Date: ${controller.movie.releaseDate ?? ''}',
                          style: const TextStyle(
                            color: Colors.greenAccent,
                          ),
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
                              '${controller.movie.voteAverage!.round()} / 10',
                              style: const TextStyle(
                                color: Colors.orangeAccent,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ],
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
