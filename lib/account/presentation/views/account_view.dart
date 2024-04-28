import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_commerce_app/account/presentation/views/edit_item.dart';

import '../../../core/utils/styles.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  String gender = "man";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left),
          ),
          leadingWidth: 80,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.check,
                color: Colors.white,
              ),
              style: IconButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fixedSize: const Size(
                    50,
                    40,
                  ),
                  elevation: 5),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "account".tr(),
                  style: Styles.TextStyle30,
                ),
                const SizedBox(
                  height: 45,
                ),
                EditItem(
                    title: "photo".tr(),
                    widget: Column(
                      children: [
                        Image.asset("assets/images/account.png",
                            height: 100, width: 100),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "uploadImage".tr(),
                            style:
                                Styles.TextStyle16.copyWith(color: Colors.blue),
                          ),
                        ),
                      ],
                    )),
                EditItem(title: "name".tr(), widget: const TextField()),
                const SizedBox(
                  height: 30,
                ),
                EditItem(
                    title: "gender".tr(),
                    widget: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              gender = "man";
                            });
                          },
                          icon: Icon(
                            Icons.male,
                            color:
                                gender == "man" ? Colors.white : Colors.black,
                          ),
                          style: IconButton.styleFrom(
                              backgroundColor:
                                  gender == "man" ? Colors.purple : Colors.grey,
                              fixedSize: const Size(50, 50)),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              gender = "woman";
                            });
                          },
                          icon: Icon(
                            Icons.female,
                            color:
                                gender == "women" ? Colors.white : Colors.black,
                          ),
                          style: IconButton.styleFrom(
                              backgroundColor: gender == "woman"
                                  ? Colors.purple
                                  : Colors.grey,
                              fixedSize: const Size(50, 50)),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                EditItem(title: "age".tr(), widget: const TextField()),
                const SizedBox(
                  height: 20,
                ),
                EditItem(title: "UserEmail".tr(), widget: const TextField()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}