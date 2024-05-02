import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commerce_app/lay0ut_cubit/layout_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayOutCubit>(context);
    return BlocConsumer(
        builder: ((context, state) {
          return Scaffold(
            body: ListView(
              shrinkWrap: true,
              children: [
                cubit.banners.isEmpty
                    ? CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        height: 130,
                        child: PageView.builder(
                          itemCount: cubit.banners.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: Image.network(cubit.banners[index].url!),
                            );
                          },
                        ),
                      )
              ],
            ),
          );
        }),
        listener: (context, state) {});
  }
}
