import 'package:agritrade/common/bididng_card.dart';
import 'package:flutter/material.dart';

class BiddingScreen extends StatelessWidget {
  const BiddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Text(
                "Bidding On Your Products",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const BiddingCard(
                    imageUrl: "assets/products/product_1.jpeg",
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}