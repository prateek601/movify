import 'package:movify_app/app/data/models/dto/repo_response.dart';
import 'package:movify_app/app/data/models/response/movie_response.dart';
import 'package:movify_app/app/data/network/network_requester.dart';
import 'package:movify_app/app/data/values/urls.dart';
import 'package:movify_app/utils/helper/exception_handler.dart';

class MovieRepository {
  MovieRepository._privateConstructor();

  static Future<RepoResponse<MovieResponse>> getPopularMovies() async {
    var response =
    await NetworkRequester.authenticated.get(path: URLs.getPopularMovies);

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: MovieResponse.fromJson(response));
  }
}