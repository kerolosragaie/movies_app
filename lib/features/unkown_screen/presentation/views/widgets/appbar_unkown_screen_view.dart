import 'package:flutter/material.dart';
import '../../../../../core/constants/styles.dart';

class AppbarUnkownScreenView extends StatelessWidget
    implements PreferredSizeWidget {
  const AppbarUnkownScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        '404',
        style: Styles.textStyle26.copyWith(color: Colors.red),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
