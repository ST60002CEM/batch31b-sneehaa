import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Enter the Verification Code',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'A verification code has been sent to your device. Please check your phone for the code and enter it in the app to complete the verification process.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  buildCodeInputField(),
                  const SizedBox(width: 8.0),
                  buildCodeInputField(),
                  const SizedBox(width: 8.0),
                  buildCodeInputField(),
                  const SizedBox(width: 8.0),
                  buildCodeInputField(),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Didn’t get a code?'),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Resend code'),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 16.0),
                      ),
                      child: const Text("Finish"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCodeInputField() {
    return Container(
      width: 50.0,
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        maxLength: 1,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(12.0),
          counterText: '',
          border: OutlineInputBorder(),
        ),
        textAlign: TextAlign.center,
        onChanged: (value) {},
      ),
    );
  }
}
