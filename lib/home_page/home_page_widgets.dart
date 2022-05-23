import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_cart_app/models/plant_model.dart';

import '../constants.dart';
import '../details_page/details_page.dart';
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
    required this.item,
  }) : super(key: key);

  final Size size;
  final PlantModel item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){
           Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => DetailsPage(
                      item: item,
                    )));

        },
        child: Container(
          height: size.height * 0.35,
          width: size.width * 0.45,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 12),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height * 0.23,
                child: Hero(tag: item.name, child: Image.asset(item.image)),
              ),
              const Spacer(),
              Expanded(
                child: AutoSizeText(item.name,
                    minFontSize: 10,
                    maxFontSize: 18,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18)),
              ),
              const SizedBox(height: 5),
              Text(
                '\$${item.price}',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: kPrimaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Triangle
class Triangle extends StatelessWidget {
  const Triangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: RecClip(),
      child: Container(
        color: kPrimaryColor,
        width: 10,
        height: 30,
      ),
    );
  }
}

class RecClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class GreenBottomContainer extends StatelessWidget {
  const GreenBottomContainer({
    Key? key,
    required this.iButton,
  }) : super(key: key);

  final int iButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Container(
          alignment: Alignment.center,
          height: 45,
          width: 75,
          decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
          child: RichText(
              text: TextSpan(
                  text: '${iButton + 1}',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                  children: const [
                TextSpan(
                    text: '/$totalPage',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
              ])),
        )
      ],
    );
  }
}
