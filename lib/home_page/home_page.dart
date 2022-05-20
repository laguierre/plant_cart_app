import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_cart_app/constants.dart';
import 'dart:math' as math;
import '../widgets/widgets.dart';
import 'home_page_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                          controller: PageController(
                              initialPage: 0, viewportFraction: 1),
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      PlantCardImage(size: size),
                                      const SizedBox(width: 20),
                                      const BtnSide(),
                                      const SizedBox(width: 20),
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  Row(
                                    children: [
                                      SizedBox(width: 20),
                                      BtnSide(),
                                      SizedBox(width: 20),
                                      PlantCardImage(size: size),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          })),
                  Container(
                    height: size.height * 0.06,
                    color: Colors.blue,
                    child: Row(
                      children: [
                        Image.asset(leftArrow),
                        for(int i = 0; i < 4; i++)
                          Container(height: size.height * 0.04,height: size.height * 0.04)
                        Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationZ(math.pi),
                            child: Image.asset(leftArrow)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10)
                ],
              ))
        ],
      ),
    ));
  }
}
