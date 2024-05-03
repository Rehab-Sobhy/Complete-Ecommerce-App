import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commerce_app/core/utils/styles.dart';
import 'package:flutter_commerce_app/Features/lay_out_screen/lay0ut_cubit/layout_cubit.dart';
import 'package:flutter_commerce_app/Features/lay_out_screen/lay0ut_cubit/layout_cubit_states.dart';
import 'package:flutter_commerce_app/core/widgets/custom_search_text_field.dart';
import 'package:flutter_commerce_app/core/widgets/product_widget.dart';
import 'package:flutter_commerce_app/models/product_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
                  const TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: "search",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
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
                              itemCount: cubit.banners.length,
                              itemBuilder: (context, index) {
                                return Image.network(
                                  cubit.banners[index].url!,
                                  fit: BoxFit.fill,
                                );
                              }),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: cubit.banners.length,
                      axisDirection: Axis.vertical,
                      effect: const SlideEffect(
                          spacing: 8.0,
                          radius: 4.0,
                          dotWidth: 24.0,
                          dotHeight: 16.0,
                          paintStyle: PaintingStyle.stroke,
                          strokeWidth: 1.5,
                          dotColor: mainColor,
                          activeDotColor: secondColor),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Categories",
                        style: Styles.TextStyle30,
                      ),
                      const Spacer(),
                      const Text(
                        "View All",
                        style: Styles.TextStyle20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  cubit.categories.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(
                          height: 70,
                          width: double.infinity,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: cubit.categories.length,
                            itemBuilder: (context, index) {
                              return CircleAvatar(
                                backgroundImage: NetworkImage(
                                  cubit.categories[index].url!,
                                ),
                                radius: 35,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 20,
                              );
                            },
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Product",
                        style: Styles.TextStyle30,
                      ),
                      const Spacer(),
                      const Text(
                        "View All",
                        style: Styles.TextStyle20,
                      ),
                      cubit.products.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 12,
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, int index) {
                                return Product(
                                  model: cubit.products[index],
                                  cubit: cubit,
                                );
                              })
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
        listener: (context, state) {});
  }
}
