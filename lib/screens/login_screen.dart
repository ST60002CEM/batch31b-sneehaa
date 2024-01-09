// import 'package:bookaway/config/routes/app_route.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 40.0,
//                 ),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10.0),
//                   child: Image.asset(
//                     'assets/images/login.png',
//                   ),
//                 ),
//                 const SizedBox(height: 14),
//                 const Text(
//                   "Welcome Back!",
//                   style: TextStyle(
//                     fontSize: 25,
//                     color: Color.fromRGBO(39, 163, 163, 1),
//                     fontFamily: 'Agbalumo',
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//                 const Text(
//                   "Enter Your Username",
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//                 const SizedBox(height: 8.0),
//                 TextFormField(
//                   controller: _usernameController,
//                   keyboardType: TextInputType.text,
//                   decoration: const InputDecoration(
//                     focusedBorder: OutlineInputBorder(),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your username';
//                     }

//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   "Enter Your Password",
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//                 const SizedBox(height: 8.0),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     focusedBorder: OutlineInputBorder(),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.red),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your password';
//                     } else if (value.length < 6) {
//                       return 'Password must be at least 6 characters';
//                     }

//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       Navigator.pushNamed(context, AppRoute.homepageRoute);
//                     }
//                   },
//                   child: const Text('Login'),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                       text: "Don't have an account?",
//                       style: const TextStyle(color: Colors.black),
//                       children: [
//                         const WidgetSpan(
//                             child: SizedBox(
//                           width: 5,
//                         )),
//                         TextSpan(
//                             text: "Signup",
//                             style: const TextStyle(
//                               color: Colors.blue,
//                               decoration: TextDecoration.underline,
//                             ),
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 Navigator.pushNamed(
//                                     context, AppRoute.signupRoute);
//                               })
//                       ]),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
