import 'package:bookaway/features/forgot_password/presentation/viewmodel/otp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';


class VerifyOTPPage extends ConsumerStatefulWidget {
  const VerifyOTPPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends ConsumerState<VerifyOTPPage> {
  String text = "";
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _otpcontroller = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(225, 224, 224, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(238, 146, 146, 1),
        title: Text("Verify OTP and Reset Password",
            style: GoogleFonts.raleway(
              textStyle: const TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(238, 146, 146, 1),
              ),
            )),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Enter the OTP sent to your registered email and reset your password.',
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(238, 146, 146, 1),
                    ),
                  ),
                ),
              ),
              Lottie.asset(
                'assets/lottie/verify.json',
                height: 200,
                width: 200,
              ),
              Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      //OTP
                      TextFormField(
                        key: const ValueKey('otp'),
                        controller: _otpcontroller,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          labelText: "OTP",
                          hintText: "OTP",
                        ),
                      ),
                      const SizedBox(height: 10),
                      //newPassword
                      TextFormField(
                        key: const ValueKey('newPassword'),
                        controller: _newPasswordController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: "New Pasword",
                          hintText: "New Password hint",
                        ),
                      ),
                      const SizedBox(height: 10),
                      //email confirmation
                      TextFormField(
                        key: const ValueKey('email'),
                        controller: _emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: "Confirm email",
                          hintText: "Confirm email",
                        ),
                      ),
                      const SizedBox(height: 10),

                      Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(238, 146, 146, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              onPressed: () async {
                                final formState = _key.currentState;
                                if (formState != null &&
                                    formState.mounted &&
                                    formState.validate()) {
                                  await ref
                                      .read(otpViewModelProvider.notifier)
                                      .verifyOTPandUpdatePassword(
                                          _emailController.text,
                                          _otpcontroller.text,
                                          _newPasswordController.text,
                                          context);
                                }
                                // // confettiController
                                //     .play(); // Play confetti animation
                              },
                              child: const Text("Verify and Update"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
