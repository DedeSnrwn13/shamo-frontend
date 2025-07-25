import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shamo_frontend/theme.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final bool hasProduct;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isSender,
    this.hasProduct = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget productPreview() {
      return Container(
        width: 235,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSender ? 12 : 0),
            topRight: Radius.circular(isSender ? 0 : 12),
            bottomLeft: const Radius.circular(12),
            bottomRight: const Radius.circular(12),
          ),
          color: isSender ? backgroundColor5 : backgroundColor4,
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/image_shoes.png',
                    width: 70,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Courtny Air Jordan 1',
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$143,90',
                        style: priceTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    backgroundColor: backgroundColor5,
                    side: BorderSide(color: primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: purpleTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    //
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Buy Now',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: medium,
                      color: backgroundColor5,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct ? productPreview() : const SizedBox.shrink(),
          Row(
            mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender ? 12 : 0),
                      topRight: Radius.circular(isSender ? 0 : 12),
                      bottomLeft: const Radius.circular(12),
                      bottomRight: const Radius.circular(12),
                    ),
                    color: isSender ? backgroundColor5 : backgroundColor4,
                  ),
                  child: Text(
                    text,
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
