import 'package:flutter/material.dart';

class TryAgainWidget extends StatelessWidget {

  final void Function()? onPressed;

  const TryAgainWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: Colors.red.withOpacity(0.6),
        ),
        child: const Text('Tekrar deneyin'),
      ),
    );
  }
}
