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
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
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
          SizedBox(width: 12),

          // Product Detail
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 4),
                Text(
                  numberOfBids,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 2),
                Divider(color: Colors.grey),
                SizedBox(height: 2),
                Text(
                  currentBid,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.snackbar("Product", "Bid Confirmed"),
                    child: Text("Place on Bid"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
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