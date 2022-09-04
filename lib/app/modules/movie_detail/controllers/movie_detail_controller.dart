import 'package:get/get.dart';
import 'package:movify_app/app/data/models/dto/movie_details_data.dart';
import 'package:movify_app/app/data/models/response/movie_response.dart';

class MovieDetailController extends GetxController {
  late final Movie movie;
  late String heroTag;

  @override
  void onInit() {
    super.onInit();
    MovieDetailsData movieDetailsData = Get.arguments;
    movie = movieDetailsData.movie;
    heroTag = movieDetailsData.index.toString();
  }

}
