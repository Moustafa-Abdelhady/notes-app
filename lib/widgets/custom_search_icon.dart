import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 45,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Colors.white10.withOpacity(.05),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: IconButton(
              onPressed:onPressed,
              icon: Icon(
                icon,
                size: 26,
              )),
        ));
  }
}
