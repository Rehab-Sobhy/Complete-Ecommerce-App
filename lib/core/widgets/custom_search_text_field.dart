import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';



class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: Material(borderRadius: BorderRadius.circular(100),
        elevation: 5,
        child: Container(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, ),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                          ),
                        ),
                        hintText:     "searchnewDistination".tr(),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintStyle: const TextStyle(color: Colors.black54),
                      ),
                    )),
                CircleAvatar(
                  radius: 20,
                  backgroundImage:
                  AssetImage("assets/images/download.png"),
                ),
              ],
            ),

          ),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(100),
        ),
        ),
      ),
    );
  }
}
