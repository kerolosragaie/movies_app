import 'package:appgain_task_movies/features/home/presentation/views/widgets/appbar_home_view.dart';
import 'package:flutter/material.dart';
import 'widgets/body_home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarHomeView(),
      body: HomeViewBody(),
    );
  }
}
