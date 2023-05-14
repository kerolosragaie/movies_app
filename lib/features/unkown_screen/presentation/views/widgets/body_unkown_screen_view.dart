import 'package:flutter/material.dart';
import '../../../../../core/constants/styles.dart';
import '../../../../../core/utils/functions/restart_app.dart';

class UnkownScreenViewBody extends StatelessWidget {
  const UnkownScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Page not found!',
            style: Styles.textStyle26,
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {
              RestartApp.restart(webOrigin: "/");
            },
            child: const Text('Go back!'),
          ),
        ],
      ),
    );
  }
}
