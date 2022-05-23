import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:plant_cart_app/constants.dart';

class IconBtn extends StatelessWidget {
  const IconBtn(
      {Key? key,
      required this.icon,
      required this.onTap,
      this.colorIcon = Colors.black, this.badge = false, this.height = 55, this.width = 55})
      : super(key: key);

  final IconData icon;
  final VoidCallback onTap;
  final Color colorIcon;
  final bool badge;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(12, 10), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Badge(
          showBadge: badge,
          badgeContent: const Text('2'),
          position: BadgePosition.topEnd(top: 0, end: 4),
          badgeColor: kPrimaryColor,
          child: Icon(
            icon,
            color: colorIcon,
          ),
        ),
      ),
    );
  }
}


