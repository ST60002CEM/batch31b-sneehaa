import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../viewmodel/otp_view_model.dart';

class SendOTPView extends ConsumerStatefulWidget {
  const SendOTPView({Key? key}) : super(key: key);

  @override
  _SendOTPViewState createState() => _SendOTPViewState();
}

class _SendOTPViewState extends ConsumerState<SendOTPView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.cancel),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'We are sorry to hear that you forgot your password',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color.fromRGBO(255, 107, 107, 1),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 20.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 12.0,
                          letterSpacing: 1,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'We will send you an ',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 107, 107, 1),
                            ),
                          ),
                          TextSpan(
                            text: ' One Time Password ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(238, 146, 146, 1),
                            ),
                          ),
                          TextSpan(
                            text:
                                ' on this email address to verify your account.',
                            style: TextStyle(
                              fontFamily: 'productSans',
                              color: Color.fromRGBO(255, 107, 107, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        cursorColor: const Color.fromRGBO(255, 107, 107, 1),
                        showCursor: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                            fontSize: 12,
                            letterSpacing: 1.0,
                            color: Color.fromRGBO(255, 107, 107, 1),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          floatingLabelStyle: TextStyle(
                            color: Color.fromRGBO(255, 107, 107, 1),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color.fromRGBO(255, 107, 107, 1),
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          final formState = _formKey.currentState;
                          if (formState != null &&
                              formState.mounted &&
                              formState.validate()) {
                            await ref
                                .read(otpViewModelProvider.notifier)
                                .sendOTP(emailController.text, context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(255, 107, 107, 1), // FF6B6B
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Send OTP',
                          style: TextStyle(
                            fontSize: 14.0,
                            letterSpacing: 1.0,
                            fontFamily: 'productSansBold',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
