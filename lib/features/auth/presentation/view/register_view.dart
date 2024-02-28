import 'package:bookaway/core/common/provider/is_network_provider.dart';
import 'package:bookaway/core/common/snackbar/my_snackbar.dart';
import 'package:bookaway/features/auth/domain/entity/auth_entity.dart';
import 'package:bookaway/features/auth/presentation/auth_viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _gap = const SizedBox(height: 20);

  final _key = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final isConnected = ref.watch(connectivityStatusProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isConnected == ConnectivityStatus.isDisconnected) {
        showSnackBar(
          message: 'No Internet Connection',
          context: context,
          color: Colors.red,
        );
      } else if (isConnected == ConnectivityStatus.isConnected) {
        showSnackBar(message: 'You are online', context: context);
      }

      if (ref.watch(authViewModelProvider).showMessage!) {
        showSnackBar(
          message: 'User Registered Successfully',
          context: context,
        );
        ref.read(authViewModelProvider.notifier).resetMessage();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      labelText: 'First Name',
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 60, 60, 60)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFF6B6B), width: 2.0),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    },
                  ),
                  _gap,
                  TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      labelText: 'Last Name',
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 60, 60, 60)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFF6B6B), width: 2.0),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter last name';
                      }
                      return null;
                    },
                  ),
                  _gap,
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 60, 60, 60)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFF6B6B), width: 2.0),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                  _gap,
                  TextFormField(
                    controller: _passwordController,
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 60, 60, 60)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFF6B6B), width: 2.0),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                  _gap,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          final userData= AuthEntity(
                            firstName: _firstNameController.text.trim(),
                            lastName: _lastNameController.text.trim(),
                            email: _emailController.text.trim(),
                            password: _passwordController.text,
                          );
                          ref
                              .read(authViewModelProvider.notifier)
                              .register(userData);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        backgroundColor: const Color(0xFFFF6B6B),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Register'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
