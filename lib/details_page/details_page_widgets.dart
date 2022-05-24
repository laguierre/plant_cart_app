import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/data.dart';
import '../models/plant_model.dart';

class PlantListView extends StatelessWidget {
  const PlantListView({
    Key? key,
    required this.sizeRelatedContainer,
  }) : super(key: key);

  final double sizeRelatedContainer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeRelatedContainer,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20, bottom: 5, top: 5),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: itemPlant.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.all(5),
            width: sizeRelatedContainer,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: kSecondaryColor.withOpacity(0.15),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(
                        1, 1), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),
            child: Image.asset(itemPlant[index].image),
          );
        },
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.size,
    required this.item,
  }) : super(key: key);

  final Size size;
  final PlantModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.48 - 20,
      width: size.width * 0.55,
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 12),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 50,
              offset: const Offset(
                  10, 10), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(kRadioCardPlant),
              bottomRight: Radius.circular(kRadioCardPlant))),
      child: SizedBox(
        width: double.infinity,
        height: size.height * 0.25,
        child: Hero(
          tag: item.name,
          child: Image.asset(item.image),
        ),
      ),
    );
  }
}

class SideShareAndHeart extends StatelessWidget {
  const SideShareAndHeart({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.15,
      width: 70,
      decoration: const BoxDecoration(color: kSecondaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          SizedBox(width: 1),
          Icon(CupertinoIcons.back),
          RotatedBox(
            quarterTurns: -1,
            child: Text(
              'Place on Order',
              style: TextStyle(
                  color: Colors.black54, fontSize: 12),
            ),
          ),
          SizedBox(width: 1),
        ],
      ),
    );
  }
}

class DescriptionPlant extends StatelessWidget {
  const DescriptionPlant({
    Key? key,
    required this.item,
  }) : super(key: key);

  final PlantModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LabelDescription(title: 'Size', description: item.size),
          LabelDescription(
              title: 'Crust', description: item.crust, isCenter: true),
          LabelDescription(
              title: 'Delivery', description: '${item.delivery} min'),
        ],
      ),
    );
  }
}

class TitlePlant extends StatelessWidget {
  const TitlePlant({
    Key? key,
    required this.item,
  }) : super(key: key);

  final PlantModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                alignment: Alignment.center,
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset:
                        const Offset(12, 10), // changes position of shadow
                      ),
                    ]),
                child: Image.asset('lib/assets/images/left-arrow.png')),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 24)),
              const SizedBox(height: 7),
              Text(
                '\$${item.price}',
                style: const TextStyle(
                    color: Colors.cyan,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class LabelDescription extends StatelessWidget {
  const LabelDescription(
      {Key? key,
        required this.title,
        required this.description,
        this.isCenter = false})
      : super(key: key);
  final String title, description;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        Text(
          description,
          style: const TextStyle(
              fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}