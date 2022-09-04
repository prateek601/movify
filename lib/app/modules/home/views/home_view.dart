import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movify_app/widgets/movie_list_widget.dart';
import 'package:movify_app/widgets/shimmer/movie_list_shimmer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Popular movies',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            GetBuilder<HomeController>(
              builder: (_) => controller.isLoading
                  ? const MovieListShimmer()
                  : controller.isError
                      ? const Text('Error in fetching data')
                      : MovieListWidget(controller.movieResponse.results!),
            ),
          ],
        ),
      ),
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 100),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
