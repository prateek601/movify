import 'package:get/get.dart';
import 'package:movify_app/app/modules/home/bindings/home_binding.dart';
import 'package:movify_app/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}