import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/routes.dart';

import '../bloc/regular_sign/authentication_bloc.dart';

class VerifyingComponent extends StatelessWidget {
  const VerifyingComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      buildWhen: (previous, current) => previous.userState != current.userState,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('A verification email has been sent to your email'),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.email,
                size: 32,
              ),
              label: const Text(
                'Resent E-mail',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.verificationScreenKey),
              icon: const Icon(
                Icons.arrow_back,
                size: 32,
              ),
              label: const Text(
                'Resent',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        );
      },
    );
  }
}
