import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mova/core/utils/snack_bar_util.dart';
import 'package:mova/features/authentication/presentation/pages/on_boarding_screen.dart';

class VerifyingScreen extends StatefulWidget {
  const VerifyingScreen({super.key});

  @override
  State<VerifyingScreen> createState() => _VerifyingScreenState();
}

class _VerifyingScreenState extends State<VerifyingScreen> {
  bool isVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
          const Duration(seconds: 3), (_) => checkIfEmailVerified());
    }
  }

  Future checkIfEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(
        () => isVerified = FirebaseAuth.instance.currentUser!.emailVerified);

    if (isVerified) timer?.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } on FirebaseAuthException catch (error) {
      SnackBarUtil().getSnackBar(
          context: context,
          message: error.message.toString(),
          color: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) => isVerified
      ? const OnBoardingScreen()
      : Scaffold(
          appBar: AppBar(
            title: const Text('verify screen'),
          ),
          body: Column(
            children: [
              const Text('A verification email has been sent to your email'),
              ElevatedButton.icon(
                  onPressed: sendVerificationEmail,
                  icon: const Icon(
                    Icons.email,
                    size: 32,
                  ),
                  label: const Text(
                    'Resent E-mail',
                    style: TextStyle(fontSize: 24),
                  ))
            ],
          ),
        );
}
