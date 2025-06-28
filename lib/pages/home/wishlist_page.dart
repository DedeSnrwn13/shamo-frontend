import 'package:flutter/material.dart';
import 'package:shamo_frontend/theme.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Wishlist Page',
        style: primaryTextStyle.copyWith(
          fontSize: 20,
          fontWeight: medium,
        ),
      ),
    );
  }
}
