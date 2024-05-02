import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class EditItem extends StatelessWidget {
  final String title;
  final Widget widget;
  const EditItem({super.key, required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: Text(
              title,
              style: Styles.TextStyle18.copyWith(color: Colors.grey),
            )),
        Expanded(
          flex: 5,
          child: widget,
        ),
      ],
    );
  }
}
