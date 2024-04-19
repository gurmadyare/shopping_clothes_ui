import 'package:flutter/material.dart';
import 'package:shopping_clothes/widgets/big_text.dart';
import 'package:shopping_clothes/widgets/small_text.dart';

class BigCard extends StatelessWidget {
  final String discountNo;
  final String subTitle;
  final String imagePath;
  final Color bgColor;
  const BigCard(
      {super.key,
      required this.discountNo,
      required this.subTitle,
      required this.imagePath,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(children: [
        Positioned(
            top: 0,
            bottom: 0,
            right: 20,
            left: 0,
            child: Container(
                margin: const EdgeInsets.only(top: 20, left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20))))),

        //img
        Padding(
          padding: imagePath == "assets/images/suits.png"
              ? const EdgeInsets.only(left: 170, top: 30)
              : const EdgeInsets.only(left: 220, top: 30),
          child: Image.asset(imagePath, width: 200, fit: BoxFit.cover),
        ),

        //left_text
        Padding(
          padding: const EdgeInsets.only(top: 35, left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BigText(
                text: "#FASHION'S DAY",
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              BigText(text: "$discountNo % OFF", fontSize: 24),
              SmallText(text: subTitle, fontSize: 12),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const SmallText(
                    text: "Check this out",
                    fontColor: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        )
      ]),
    );
  }
}
