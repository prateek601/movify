import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movify_app/app/data/models/dto/repo_response.dart';
import 'package:movify_app/app/data/models/response/movie_response.dart';
import 'package:movify_app/app/data/repository/movie_repository.dart';

class HomeController extends GetxController {
  late MovieResponse _movieResponse;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  bool _isError = false;

  bool get isError => _isError;
  final ScrollController scrollController = ScrollController();
  final RxBool _isAtBottom = false.obs;

  bool get isAtBottom => _isAtBottom.value;
  final List<Movie> movies = [];
  int _page = 1;

  @override
  void onInit() {
    super.onInit();
    getPopularMovies(page: _page);
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double delta = 200.0;
    if (maxScroll - currentScroll <= delta) {
      _isAtBottom.value = true;
      if(_movieResponse.totalPages! > _page) {
        _page++;
        getPopularMovies(page: _page);
      }
    }
  }

  Future<void> getPopularMovies({required int page}) async {
    Map<String,dynamic> query = {};
    query['page'] = page;
    RepoResponse<MovieResponse> res = await MovieRepository.getPopularMovies(query);
    _isLoading = false;
    _isAtBottom.value = false;
    if (res.error == null) {
      _movieResponse = res.data!;
      movies.addAll(res.data!.results!);
    } else {
      _isError = true;
      debugPrint(res.error?.message);
    }
    update();
  }
}
