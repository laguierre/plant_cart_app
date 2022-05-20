import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/widgets.dart';



class BtnSide extends StatelessWidget {
  const BtnSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconBtn(
            icon: CupertinoIcons.plus, colorIcon: Colors.cyan, onTap: () {}),
        const SizedBox(height: 20),
        IconBtn(
            icon: CupertinoIcons.heart, colorIcon: Colors.grey, onTap: () {})
      ],
    );
  }
}

class PlantCardImage extends StatelessWidget {
  const PlantCardImage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height * 0.35,
        width: size.width * 0.45,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 50,
                offset: const Offset(10, 10), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kRadioCardPlant),
                bottomRight: Radius.circular(kRadioCardPlant))),
      ),
    );
  }
}
