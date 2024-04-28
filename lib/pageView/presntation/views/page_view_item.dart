import 'package:flutter/material.dart';
import 'package:travel_app/core/utils/styles.dart';

import '../../../../generated/l10n.dart';

class PageViewItem extends StatelessWidget {
  final String? image;

  const PageViewItem({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: MediaQuery.of(context).size.height * .7,
      child: Column(
        children: [
          SizedBox(height: 60,),
          Container(
              height: MediaQuery.of(context).size.height * .45,
              child: Image.asset("$image",fit: BoxFit.cover,)),
          SizedBox(height: 5,),
          Text(
             S.of(context).enjoyTravelling,

            style: Styles.TextStyle20.copyWith(color: Colors.deepOrange),
          )
        ],
      ),
    );
  }
}
