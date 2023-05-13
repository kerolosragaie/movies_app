import 'package:flutter/material.dart';
import '../../../../../core/constants/styles.dart';

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
            style: Styles.textStyle20,
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Go back!'),
          ),
        ],
      ),
    );
  }
}
