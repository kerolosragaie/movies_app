import 'package:appgain_task_movies/features/unkown_screen/presentation/views/widgets/appbar_unkown_screen_view.dart';
import 'package:flutter/material.dart';

import 'widgets/body_unkown_screen_view.dart';

class ScreenNotFoundView extends StatelessWidget {
  const ScreenNotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarUnkownScreenView(),
      body: UnkownScreenViewBody(),
    );
  }
}
