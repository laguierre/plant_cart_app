import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_cart_app/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Products",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 28),
                        ),
                        const Spacer(),
                        IconBtn(icon: CupertinoIcons.search, onTap: () {}),
                      ],
                    ),
                  ),
                  CardPlant(),
                  CardPlant(leftSize: false,),
                ],
              ))
        ],
      ),
    ));
  }
}

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
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Icon(
          icon,
          color: colorIcon,
        ),
      ),
    );
  }
}

class CardPlant extends StatelessWidget {
  const CardPlant({Key? key, this.leftSize = true}) : super(key: key);
final bool leftSize;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        leftSize? PlantCardImage(size: size) : BtnSide(),
        const SizedBox(width: 15),
        leftSize? BtnSide() : PlantCardImage(size: size)
      ],
    );
  }
}

class BtnSide extends StatelessWidget {
  const BtnSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconBtn(icon: CupertinoIcons.plus, colorIcon: Colors.cyan, onTap: () {}),
          const SizedBox(height: 20),
          IconBtn(icon: CupertinoIcons.heart, colorIcon: Colors.grey, onTap: () {})
        ],
      ),
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
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kRadioCardPlant),
                bottomRight: Radius.circular(kRadioCardPlant))),
      ),
    );
  }
}
