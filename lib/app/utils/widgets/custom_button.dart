import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function function;
  final IconData iconData;
  const CustomButton({
    super.key,
    required this.function,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.outline,
                width: 0.5,
              ),
              shape: BoxShape.circle),
          child: Icon(
            iconData,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
