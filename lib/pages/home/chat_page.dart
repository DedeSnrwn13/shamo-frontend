import 'package:flutter/material.dart';
import 'package:shamo_frontend/theme.dart';
import 'package:shamo_frontend/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  Widget header() {
    return AppBar(
      backgroundColor: backgroundColor1,
      centerTitle: true,
      title: Text(
        'Message Support',
        style: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }

  Widget emptyChat() {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_headset.png',
              width: 80,
            ),
            const SizedBox(height: 20),
            Text(
              'Oops no message yet?',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'You have not received any message.',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 44,
              child: TextButton(
                onPressed: () {
                  //
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget content() {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: const [
            ChatTile(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
