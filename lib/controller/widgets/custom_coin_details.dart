import 'package:flutter/material.dart';

import '../const/const.dart';
import 'custom_text_widget.dart';

class CoinMoreData extends StatelessWidget {
  final String title;
  final String value;
  const CoinMoreData({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        decoration: BoxDecoration(
            color: colorWhite, borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: CustomTextApp(
            text: title,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            textColor: colorBlack,
          ),
          title: CustomTextApp(
            text: ':',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            textColor: colorBlack,
          ),
          trailing: CustomTextApp(
            text: value,
            fontWeight: FontWeight.normal,
            fontSize: 18,
            textColor: colorBlack,
          ),
        ),
      ),
    );
  }
}
