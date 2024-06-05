import 'package:agritrade/common/custom_appbar.dart';
import 'package:agritrade/common/product_card_vertical.dart';
import 'package:agritrade/common/section_heading.dart';
import 'package:agritrade/screens/shop/stores/widgets/product_showcase.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          titleWidget: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                // --- ShowCase
                const ProductShowcase(),
                const SizedBox(
                  height: 10,
                ),

                SectionHeading(
                    title: "You Might Like Products",
                    viewButtonText: "View All",
                    onPressed: () {}),
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                    itemCount: 4,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      mainAxisExtent: 288,
                    ),
                    itemBuilder: (_, index) => const ZProductCardVertical()),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ));
  }
}
