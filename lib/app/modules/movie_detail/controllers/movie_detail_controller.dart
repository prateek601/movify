import 'package:get/get.dart';
import 'package:movify_app/app/data/models/response/movie_response.dart';

class MovieDetailController extends GetxController {
  late final Movie movie;

  @override
  void onInit() {
    super.onInit();
    movie = Get.arguments;
  }

}
