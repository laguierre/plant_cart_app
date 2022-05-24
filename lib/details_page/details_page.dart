import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_cart_app/models/plant_model.dart';

import '../constants.dart';
import '../widgets/widgets.dart';
import 'details_page_widgets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.item}) : super(key: key);

  final PlantModel item;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sizeRelatedContainer = size.width * 0.3;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitlePlant(item: item),
            DescriptionPlant(item: item),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: size.height * 0.48,
              padding: const EdgeInsets.only(right: 40),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Spacer(),
                      IconBtn(
                        width: 45,
                        height: 45,
                        icon: Icons.share,
                        onTap: () {},
                      ),
                      const SizedBox(height: 15),
                      IconBtn(
                        width: 45,
                        height: 45,
                        icon: CupertinoIcons.heart,
                        onTap: () {},
                      ),
                      const SizedBox(height: 70),
                      SideShareAndHeart(size: size),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                  ImageContainer(size: size, item: item),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Related",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            PlantListView(sizeRelatedContainer: sizeRelatedContainer)
          ],
        ),
      ),
    ));
  }
}


