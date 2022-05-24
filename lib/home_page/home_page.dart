import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_cart_app/constants.dart';
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
                  _SideDrawer(context, iSideButton, sizeSideContainer),
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
                  PlantPageView(pageController: pageController, size: size),
                  _PlantPageView(size, iButton, context),
                  const SizedBox(height: 10)
                ],
              ))
        ],
      ),
    ));
  }

  Container _PlantPageView(Size size, int iButton, BuildContext context) {
    return Container(
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
                            pageController.animateToPage(Provider.of<BottomButtonModel>(context,
                                listen: false)
                                .number,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.decelerate);                            },
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
                          pageController.animateToPage(Provider.of<BottomButtonModel>(context,
                              listen: false)
                              .number,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.decelerate);
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
                );
  }

  Stack _SideDrawer(BuildContext context, int iSideButton, double sizeSideContainer) {
    return Stack(
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
                );
  }
}
