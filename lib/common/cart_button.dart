import 'package:flutter/material.dart';
class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.iconColor,
  });

  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Stack(
        children: [
          IconButton(
            icon: Icon(
              icon,
              size: 28,
              color: iconColor,
            ),
            onPressed: onPressed,
          ),
          Positioned(
            right: 2,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Text(
                  "3",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: Colors.white, fontSizeFactor: 0.8),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}