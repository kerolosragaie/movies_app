import 'package:appgain_task_movies/core/constants/routes.dart';
import 'package:flutter/material.dart';
import '../../constants/styles.dart';
import '../functions/restart_app.dart';

class CustomErrorWidget extends StatelessWidget {
  final String? title;
  final String errorMessage;
  final bool isSliverWidget;
  final bool isUsingDeepLink;
  const CustomErrorWidget({
    Key? key,
    required this.errorMessage,
    this.title,
    this.isSliverWidget = false,
    this.isUsingDeepLink = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSliverWidget
        ? SliverToBoxAdapter(
            child: _buildWidget(context),
          )
        : _buildWidget(context);
  }

  Widget _buildWidget(BuildContext context) {
    return Container(
      color: Colors.blue.withOpacity(0.2),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://m.media-amazon.com/images/M/MV5BMTcwMTM4MTEwNF5BMl5BanBnXkFtZTgwMzkyOTA0NjE@._V1_.jpg",
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title ?? "ERROR!",
                  textAlign: TextAlign.center,
                  style: Styles.textStyle30.copyWith(color: Colors.red),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle20.copyWith(color: Colors.red),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    if (isUsingDeepLink) {
                      RestartApp.restart(webOrigin: "/");
                    } else {
                      Navigator.of(context).pushReplacementNamed(kHomeScreen);
                    }
                  },
                  child: const Text('Go back!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
