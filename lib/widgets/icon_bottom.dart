import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconBottomBar extends StatelessWidget {
  const IconBottomBar({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  final String icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.18,
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                icon,
                width: 28,
                height: 28,
              )
            ],
          ),
        ),
      ),
    );
  }
}
