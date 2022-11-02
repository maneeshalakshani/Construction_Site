import 'package:flutter/material.dart';

class NullError extends StatelessWidget {
  const NullError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Loading...'
        ),
      ),
    );
  }
}
