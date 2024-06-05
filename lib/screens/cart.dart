import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../common/custom_appbar.dart';
import '../common/product_card_vertical.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              titleWidget: Text(
                "Cart",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              actionButton: [
                IconButton(
                  onPressed: () => Get.back(),
                    icon: const Icon(
                      Iconsax.add,
                      size: 26,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 16),
              child: GridView.builder(
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 288,
                  ),
                  itemBuilder: (_, index) => const ZProductCardVertical()),
            )
          ],
        ),
      ),
    );
  }
}
