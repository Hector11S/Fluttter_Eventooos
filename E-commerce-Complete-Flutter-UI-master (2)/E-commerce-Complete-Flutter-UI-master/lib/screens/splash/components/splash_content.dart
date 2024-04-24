import 'package:flutter/material.dart';

import '../../../constants.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        const SizedBox(height: 1),
        Image.asset(
          "assets/images/estelogosi.png",
          width: 500,
          height: 280,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 8),
        Text(
          widget.text!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        const Spacer(flex: 2),
        Image.asset(
          widget.image!,
          height: 250,
          width: 250,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
