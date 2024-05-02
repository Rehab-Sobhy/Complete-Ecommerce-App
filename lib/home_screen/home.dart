import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commerce_app/lay0ut_cubit/layout_cubit.dart';
import 'package:flutter_commerce_app/lay0ut_cubit/layout_cubit_states.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayOutCubit>(context);
    return BlocConsumer<LayOutCubit, LayoutCubitState>(
        builder: ((context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView(
                shrinkWrap: true,
                children: [
                  cubit.banners.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: PageView.builder(
                              controller: pageController,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Image.network(
                                  cubit.banners[index].url!,
                                  fit: BoxFit.fill,
                                );
                              }),
                        ),
                ],
              ),
            ),
          );
        }),
        listener: (context, state) {});
  }
}
