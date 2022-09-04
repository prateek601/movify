import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movify_app/app/data/models/dto/repo_response.dart';
import 'package:movify_app/app/data/models/response/movie_response.dart';
import 'package:movify_app/app/data/repository/movie_repository.dart';

class HomeController extends GetxController {
  late final MovieResponse movieResponse;
  bool isLoading = true;
  bool isError = false;

  @override
  void onInit() {
    super.onInit();
    getPopularMovies();
  }

  Future<void> getPopularMovies() async {
    RepoResponse<MovieResponse> res = await MovieRepository.getPopularMovies();
    isLoading = false;
    if(res.error == null) {
      movieResponse = res.data!;
    } else {
      isError = true;
      debugPrint(res.error?.message);
    }
    update();
  }
}
