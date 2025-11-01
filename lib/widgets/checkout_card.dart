import 'package:flutter/material.dart';
import 'package:shamo_frontend/models/cart_model.dart';
import 'package:shamo_frontend/theme.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({super.key, required this.cart});

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(
                  cart.product?.galleries?.first.url ?? '',
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.product?.name ?? '-',
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  '\$ ${cart.product?.price ?? 0}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '${cart.quantity} items',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
