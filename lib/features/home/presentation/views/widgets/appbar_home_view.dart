import 'package:appgain_task_movies/core/utils/widgets/snackbar_message.dart';
import 'package:flutter/material.dart';

class AppbarHomeView extends StatelessWidget implements PreferredSizeWidget {
  const AppbarHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const Text("Movies App"),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            SnackbarMessage.showSuccessSnackBar(
                context: context,
                message:
                    "Thank you for downloading the app :) \nRegards, Kerollos Ragaie");
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
