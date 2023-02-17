import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomMessage extends StatelessWidget {
  final String lottiesName;
  final String textMessage;
  final double leftPadding;
  final double height;
  final double width;
  const CustomMessage({
    super.key,
    required this.lottiesName,
    required this.textMessage,
    required this.leftPadding,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Lottie.asset(
              "assets/lotties/$lottiesName",
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            textMessage,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
