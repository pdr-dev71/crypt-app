import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  final Widget? Text;
  final Color? primary;
  const CustomButtom(
      {Key? key, required this.onPressed, this.child, this.Text, this.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width * .875,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          //side: BorderSide(width: 2.0, color: Colors.red),
          primary: primary,
          minimumSize: const Size.fromHeight(50),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
