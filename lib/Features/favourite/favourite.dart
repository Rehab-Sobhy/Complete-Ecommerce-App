import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commerce_app/Features/lay_out_screen/lay0ut_cubit/layout_cubit.dart';
import 'package:flutter_commerce_app/Features/lay_out_screen/lay0ut_cubit/layout_cubit_states.dart';
import 'package:flutter_commerce_app/core/utils/styles.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayOutCubit>(context);
    return BlocConsumer<LayOutCubit, LayoutCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12.5),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 7.5, horizontal: 12),
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: cubit.favorites.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: fourthColor,
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 12.5),
                        child: Row(
                          children: [
                            Image.network(
                              cubit.favorites[index].image!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    cubit.favorites[index].name!,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 16.5,
                                        fontWeight: FontWeight.bold,
                                        color: mainColor,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${cubit.favorites[index].price!} \$"),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${cubit.favorites[index].oldPrice!} \$",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      // add | remove
                                      cubit.addOrRemoveFromFavorites(
                                          productID: cubit.favorites[index].id
                                              .toString());
                                    },
                                    child: Text("Remove"),
                                    textColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    color: mainColor,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
      },
    );
  }
}
