import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {
  const IconBtn(
      {Key? key,
        required this.icon,
        required this.onTap,
        this.colorIcon = Colors.black})
      : super(key: key);

  final IconData icon;
  final VoidCallback onTap;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 20,
                offset: Offset(12, 10), // changes position of shadow
              ),
            ],
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Icon(
          icon,
          color: colorIcon,
        ),
      ),
    );
  }
}