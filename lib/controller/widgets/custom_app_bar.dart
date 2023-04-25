import 'package:flutter/material.dart';

import '../const/const.dart';
import 'custom_text_widget.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String appBarText;
  const CustomAppBar({
    super.key,
    required this.appBarText,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorTransparent,
      centerTitle: true,
      title: CustomTextApp(
        text: appBarText,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        textColor: colorWhite,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
