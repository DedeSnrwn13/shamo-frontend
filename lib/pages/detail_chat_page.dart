import 'package:flutter/material.dart';
import 'package:shamo_frontend/theme.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'assets/image_shop_logo.png',
              width: 50,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shoe Store',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  'Online',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
    );
  }
}
