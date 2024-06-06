import 'package:agritrade/common/product_card_vertical.dart';
import 'package:agritrade/screens/portals/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdminPortal extends StatelessWidget {
  const AdminPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Admin",style: Theme.of(context).textTheme.headlineMedium,),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const Icon(Iconsax.receipt),
                title: const Text("Revenue"),
                subtitle: const Text("Your Sales"),
                trailing: Text("255\$",
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              ListTile(
                leading: const Icon(Iconsax.activity),
                title: const Text("Total Farmers on Store"),
                trailing: Text("25",
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              ListTile(
                leading: const Icon(Iconsax.user),
                title: const Text("Total Users on Store"),
                trailing: Text("95",
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              ListTile(
                leading: const Icon(Iconsax.activity),
                title: const Text("Total Products on Store"),
                trailing: Text("589",
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "All Farmers",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const ZRoundedImage(
                        imageUrl: 'assets/brand_artworks/default_prodile_pic.png',
                      ),
                      title: const Text(" farmer@agri_trade.com"),
                      subtitle: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Average Crops Bidding:\t 80"),
                          Text("Crops Quantity:\t 30"),
                          Text("Crops Sold:\t 80"),
                          Text("Sell:\t 20\$"),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Iconsax.security_time,
                          color: Colors.red,
                        ),
                        onPressed: () => Get.snackbar("Saler", "Temporarily Suspended"),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
