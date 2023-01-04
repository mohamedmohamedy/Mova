
import 'package:flutter/material.dart';

import '../../../../../../core/resources/strings_manager.dart';

class InBetweenHeadLines extends StatelessWidget {
  final String text;
  final VoidCallback navigation;

  const InBetweenHeadLines({
    Key? key,
    required this.text,
    required this.navigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        TextButton(
          onPressed: navigation,
          child: const Text(
            StringsManager.seeAll,
          ),
        ),
      ],
    );
  }
}
