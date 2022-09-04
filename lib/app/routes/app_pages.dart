import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/movie_detail/bindings/movie_detail_binding.dart';
import '../modules/movie_detail/views/movie_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.movieDetail,
      page: () => const MovieDetailView(),
      binding: MovieDetailBinding(),
    ),
  ];
}
