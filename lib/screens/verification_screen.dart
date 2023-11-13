import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late Timer _timer;
  int _secondsRemaining = 60;
  bool _showTimer = false;
  bool _isResendButtonDisabled = false;
  bool _codeEntered = false;
  String _verificationCode = '';

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0 && !_codeEntered) {
          _secondsRemaining--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void resetTimer() {
    setState(() {
      _secondsRemaining = 60;
      startTimer();
      _isResendButtonDisabled = true;
      _showTimer = true;
      _codeEntered = false;
      _verificationCode = '';
    });

    Future.delayed(Duration(seconds: 60), () {
      if (mounted) {
        setState(() {
          _isResendButtonDisabled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
                  buildCodeInputField(1),
                  const SizedBox(width: 8.0),
                  buildCodeInputField(2),
                  const SizedBox(width: 8.0),
                  buildCodeInputField(3),
                  const SizedBox(width: 8.0),
                  buildCodeInputField(4),
                ],
              ),
              const SizedBox(height: 16.0),
              if (_showTimer)
                Column(
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      '$_secondsRemaining seconds remaining',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Didn’t get a code?'),
                  TextButton(
                    onPressed: _isResendButtonDisabled
                        ? null
                        : () {
                            resetTimer();
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Code Resent'),
                                content:
                                    const Text('Your code has been re-sent.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                    child: const Text('Resend code'),
                  ),
                  ElevatedButton(
                    onPressed: _codeEntered ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 16.0),
                      // primary: _codeEntered ? const Color(0xFFFF6B6B) : null,
                    ),
                    child: const Text("Finish"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCodeInputField(int position) {
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
        onChanged: (value) {
          setState(() {
            if (value.length == 1) {
              // Code digit has been entered
              _verificationCode += value;
              if (_verificationCode.length == 4) {
                _codeEntered = true;
                _timer.cancel();
              } else {
                _codeEntered = false;
              }
            }
          });
        },
      ),
    );
  }
}
