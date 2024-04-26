import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: press,
          style: TextButton.styleFrom(
            foregroundColor: Color.fromARGB(255, 0, 0, 0),
            side:
                BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 1),
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          child: const Text("Ver más"),
        ),
      ],
    );
  }
}
