import 'package:flutter/material.dart';

class ButtonsOfCalculator extends StatelessWidget {
  const ButtonsOfCalculator(
      {required this.width,
      required this.height,
      required this.buttonValue,
      required this.onPressed,
      required this.color,
      super.key});

  final double width;
  final double height;
  final GestureTapCallback onPressed;
  final Color color;
  final String buttonValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(3),
        width: width * 0.2,
        height: height * 0.08,
        decoration: BoxDecoration(
            color: color, borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
        child: Center(
            child: Text(
          buttonValue,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
