import 'package:flutter/material.dart';

import '../../constants.dart';

import 'components/otp_form.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";

  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                const Text(
                  "OTP Verification",
                  style: headingStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  "We sent your code to +1 898 860 ***",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    const SizedBox(width: 10),
                    TweenAnimationBuilder(
                      tween: Tween(begin: 30.0, end: 0.0),
                      duration: const Duration(seconds: 30),
                      builder: (_, dynamic value, child) => Text(
                        "00:${value.toInt()}",
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                OtpForm(),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // OTP code resend
                  },
                  child: const Text(
                    "Resend OTP Code",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      color: kPrimaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
