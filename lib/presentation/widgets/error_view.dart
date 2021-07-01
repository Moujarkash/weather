import 'package:flutter/material.dart';
import 'package:weather/presentation/resources/colors.dart';

class ErrorView extends StatelessWidget {
  final String? errorMessage;
  final Function() onRetryClicked;

  const ErrorView(
      {Key? key, this.errorMessage, required this.onRetryClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          errorMessage ?? 'OOPS! Somthing went wrong, please try again',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(primaryColor)),
            onPressed: onRetryClicked,
            child: const Text(
              'Retry',
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}