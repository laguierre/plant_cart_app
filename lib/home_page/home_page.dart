import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_cart_app/constants.dart';
import 'package:plant_cart_app/data/data.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../models/models.dart';
import '../widgets/widgets.dart';
import 'home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween<double>(begin: 55, end: 55).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int iButton = Provider.of<BottomButtonModel>(context).number;
    int iSideButton = Provider.of<SideButtonModel>(context).number;
    double sizeSideContainer = size.height * 0.17;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBackgroundColor,
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: kSecondaryColor,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: size.height * 0.20,
                    color: kPrimaryColor,
                    child: const Text(
                      'De_\nTan',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          SideBtnText(
                            text: 'Trading',
                            onTap: () {
                              Provider.of<SideButtonModel>(context,
                                      listen: false)
                                  .number = 0;
                              setState(() {
                                animation = Tween<double>(
                                        begin: 55 +
                                            iSideButton * sizeSideContainer,
                                        end: 55)
                                    .animate(controller);
                                controller.forward(from: 0);
                              });
                            },
                          ),
                          SideBtnText(
                            text: 'Categories',
                            onTap: () {
                              Provider.of<SideButtonModel>(context,
                                      listen: false)
                                  .number = 1;

                              setState(() {
                                animation = Tween<double>(
                                        begin: 55 +
                                            iSideButton * sizeSideContainer,
                                        end: 55 + 1 * sizeSideContainer)
                                    .animate(controller);
                                controller.forward(from: 0);
                              });
                            },
                          ),
                          SideBtnText(
                            text: 'Favorite',
                            onTap: () {
                              Provider.of<SideButtonModel>(context,
                                      listen: false)
                                  .number = 2;
                              setState(() {
                                animation = Tween<double>(
                                        begin: 55 +
                                            iSideButton * sizeSideContainer,
                                        end: 55 + 2 * sizeSideContainer)
                                    .animate(controller);

                                controller.forward(from: 0.5);
                              });
                            },
                          ),
                        ],
                      ),
                      AnimatedBuilder(
                        animation: controller,
                        builder: (BuildContext context, Widget? child) {
                          return Positioned(
                            right: 0,
                            top: animation.value,
                            child: const Triangle(),
                          );
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconBtn(icon: Icons.shopping_cart, badge: true, onTap: () {}),
                  const Spacer(),
                  GreenBottomContainer(iButton: iButton)
                ],
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
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
                  Expanded(
                      child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          onPageChanged: (index) {
                            Provider.of<BottomButtonModel>(context,
                                    listen: false)
                                .number = index;
                          },
                          controller: pageController,
                          scrollDirection: Axis.horizontal,
                          itemCount: itemPlant.length ~/ 2,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      PlantCardImage(
                                          size: size, item: itemPlant[index]),
                                      const SizedBox(width: 20),
                                      const BtnSide(),
                                      const SizedBox(width: 20),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      const BtnSide(),
                                      const SizedBox(width: 20),
                                      PlantCardImage(
                                          size: size,
                                          item: itemPlant[index + 1]),
                                      const SizedBox(width: 20),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          })),
                  Container(
                    alignment: Alignment.center,
                    color: kBackgroundColor,
                    height: size.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              iButton--;
                              if (iButton == -1) {
                                Provider.of<BottomButtonModel>(context,
                                        listen: false)
                                    .number = 0;
                              } else {
                                Provider.of<BottomButtonModel>(context,
                                        listen: false)
                                    .number = iButton;
                              }
                            },
                            child: Image.asset(leftArrow, color: kBottomColor)),
                        for (int i = 0; i < totalPage; i++)
                          InkWell(
                            onTap: () {
                              Provider.of<BottomButtonModel>(context,
                                      listen: false)
                                  .number = i;
                              pageController.animateToPage(i,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.decelerate);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: size.height * 0.04,
                              width: size.height * 0.04,
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 200),
                                style: TextStyle(
                                    color: iButton == i
                                        ? Colors.black
                                        : kBottomColor,
                                    fontSize: iButton == i ? 24 : 16),
                                child: Text(
                                  (i + 1).toString(),
                                ),
                              ),
                            ),
                          ),
                        InkWell(
                          onTap: () {
                            iButton++;
                            if (iButton > totalPage - 1) {
                              Provider.of<BottomButtonModel>(context,
                                      listen: false)
                                  .number = totalPage - 1;
                            } else {
                              Provider.of<BottomButtonModel>(context,
                                      listen: false)
                                  .number = iButton;
                            }
                          },
                          child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationZ(math.pi),
                              child: Image.asset(
                                leftArrow,
                                color: kBottomColor,
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10)
                ],
              ))
        ],
      ),
    ));
  }
}

class SideBtnText extends StatelessWidget {
  const SideBtnText({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.17,
        child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
