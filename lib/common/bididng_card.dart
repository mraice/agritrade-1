import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BiddingCard extends StatelessWidget {
  const BiddingCard({
    super.key,
    required this.imageUrl,
    this.title = "Crop Title",
    this.numberOfBids = "Number of Bid",
    this.currentBid = "Current Bid",
    this.buttonLabel = "Place on Bid",
  });

  final String imageUrl, title, numberOfBids, currentBid, buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: AspectRatio(
              aspectRatio: 1.0, // Maintain aspect ratio
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Product Detail
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  numberOfBids,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 2),
                const Divider(color: Colors.grey),
                const SizedBox(height: 2),
                Text(
                  currentBid,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.snackbar("Product", "Bid Confirmed"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Place on Bid"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}