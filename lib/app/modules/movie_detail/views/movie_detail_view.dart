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
        child: Stack(
          children: [
            ListView(
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: controller.heroTag,
                      child: Container(
                        foregroundDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Color(0xff0e0f11),
                            ],
                            begin: Alignment(0, 0.3),
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: CustomNetworkImage(
                          image: controller.movie.posterPath ?? '',
                          height: 400,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                     Positioned(
                      top: 15,
                      left: 15,
                      child: GestureDetector(
                        onTap: Get.back,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.75),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned.fill(
              top: 300,
              child: Padding(
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
                          fontSize: 32,
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
                            'World premier: ${controller.movie.releaseDate ?? ''}',
                            style: const TextStyle(
                              color: Colors.orangeAccent,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
