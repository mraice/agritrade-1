import 'package:agritrade/common/custom_appbar.dart';
import 'package:agritrade/common/custom_list_tile.dart';
import 'package:agritrade/screens/agricultural_info.dart';
import 'package:agritrade/screens/user_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -- Header
            const AccountHeader(),

            // -- Body
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account Settings",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomListTile(
                      icon: Iconsax.profile_tick,
                      title: "My Addresses",
                      subTitle: "Set Shopping Delivery Address",
                      onPressed: () {}),
                  CustomListTile(
                      icon: Iconsax.shopping_bag,
                      title: "My Cart",
                      subTitle:
                          "Add, remove products and move to checkout page",
                      onPressed: () {}),
                  CustomListTile(
                      icon: Iconsax.check,
                      title: "My Orders",
                      subTitle: "In-progress and completed orders",
                      onPressed: () {}),
                  CustomListTile(
                      icon: Iconsax.bank,
                      title: "Bank Accounts",
                      subTitle: "Withdraw balance to register bank account",
                      onPressed: () {}),
                  CustomListTile(
                      icon: Iconsax.information,
                      title: "Agricultural Info",
                      subTitle: "Check Crops Information",
                      onPressed: () => Get.to(()=> const AgriculturalInfo())),

                  // -- App Settings

                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    "App Settings",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomListTile(
                      icon: Iconsax.notification,
                      title: "Notifications",
                      subTitle: "Set any kind of notifications message",
                      onPressed: () {}),
                  CustomListTile(
                      icon: Iconsax.activity,
                      title: "Activity Monitoring",
                      subTitle: "Check app usage",
                      onPressed: () {}),
                  CustomListTile(
                      icon: Iconsax.watch_status,
                      title: "Product History",
                      subTitle: "Review your clicked products",
                      onPressed: () => Get.to(()=> const UserHistory())),
                  CustomListTile(
                      icon: Iconsax.airplane,
                      title: "Region",
                      subTitle: "Set Region",
                      onPressed: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AccountHeader extends StatelessWidget {
  const AccountHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          CustomAppBar(
            titleWidget: Text(
              "Account",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
            child: ListTile(
              leading: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: const Image(
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/brand_artworks/default_prodile_pic.png"),
                ),
              ),
              title: Text(
                "Mr. Aneeq",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white),
              ),
              subtitle: Text(
                "suport@agri_trade.com",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Colors.white),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Iconsax.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
