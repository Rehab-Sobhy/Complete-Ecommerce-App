import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_commerce_app/Features/lay_out_screen/lay0ut_cubit/layout_cubit.dart';
import 'package:flutter_commerce_app/core/utils/styles.dart';
import 'package:flutter_commerce_app/models/product_model.dart';

Widget Product({required ProductModel model, required LayOutCubit cubit}) {
  return Container(
    color: Colors.grey.withOpacity(.2),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.network(
        model.image!,
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
      const SizedBox(
        height: 5,
      ),
      Expanded(
        child: Text(
          model.name!,
          style: Styles.TextStyle16.copyWith(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      const SizedBox(
        height: 2,
      ),
      Row(
        children: [
          Expanded(
            child: Row(
              children: [
                FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "${model.price!} \$",
                      style: TextStyle(fontSize: 13),
                    )),
                SizedBox(
                  width: 5,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "${model.oldPrice!} \$",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.5,
                        decoration: TextDecoration.lineThrough),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: (() {}),
            child: Icon(
              Icons.favorite,
            ),
          )
        ],
      ),
    ]),
  );
}
