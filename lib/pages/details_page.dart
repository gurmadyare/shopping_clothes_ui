import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_clothes/models/data/item_data.dart';
import 'package:shopping_clothes/pages/home_page.dart';
import 'package:shopping_clothes/widgets/small_text.dart';

class DetailsPage extends StatelessWidget {
  final ItemData item;
  const DetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: screenSize.height * .07, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //customAppBar
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                //left_side
                GestureDetector(
                    onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomePage();
                        })),
                    child: const Icon(Icons.arrow_back_ios)),

                //right-side
                const Row(children: [
                  Icon(Iconsax.lovely4),
                  SizedBox(width: 20),
                  Icon(Icons.share_outlined),
                  SizedBox(width: 20),
                  Badge(
                    label: Text("3"),
                    child: Icon(Iconsax.shopping_bag),
                  ),
                  SizedBox(width: 20),
                ]),
              ]),

              //ItemImage
              Image.asset(item.imagePath, width: 350, fit: BoxFit.fitHeight),

              //description
              const Row(
                children: [
                  Icon(Iconsax.card, color: Colors.black54),
                  SizedBox(width: 10),
                  SmallText(
                      text: "gurmad's_shop.id", fontColor: Colors.black54),
                ],
              ),
              const SizedBox(height: 10),

              SmallText(
                text: item.name.replaceAll('\n', ' '),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontColor: Colors.black,
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Icon(
                    Iconsax.star_1,
                    color: Colors.amber[600],
                  ),
                  SmallText(text: "  ${item.ratingNo}"),
                  const SmallText(text: "  ratings   "),
                  SmallText(text: ".   ${item.revKNo}+ reviews"),
                  SmallText(text: "   .    ${item.soldNo}+ sold"),
                ],
              ),
              const SizedBox(height: 20),

              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 60),
                    child: SmallText(
                      text: "About Items",
                      fontColor: Colors.green,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 10),
                  SmallText(text: "Reviews", fontSize: 18),
                ],
              ),

              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 3,
                width: screenSize.width * .25,
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 25),

              const Row(
                children: [
                  SmallText(text: "Brand: ", fontColor: Colors.black38),
                  SmallText(
                    text: "  ChArmkPR",
                    fontColor: Color.fromARGB(255, 91, 38, 38),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 80),
                    child:
                        SmallText(text: "Color: ", fontColor: Colors.black38),
                  ),
                  SmallText(
                    text: "  Asinhoi",
                    fontColor: Color.fromARGB(255, 91, 38, 38),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),

              const SizedBox(height: 45),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SmallText(
                          text: "Total price", fontColor: Colors.black38),
                      const SizedBox(height: 5),
                      SmallText(
                        text: "\$${item.price}",
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        fontColor: const Color(0xff2A977D),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 200,
                    child: Stack(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                              fixedSize: const Size(80, 50),
                              backgroundColor: const Color(0xff2A977D)),
                          icon: const Icon(Iconsax.shopping_bag),
                          label: const SmallText(
                            text: "1",
                            fontWeight: FontWeight.bold,
                            fontColor: Colors.white,
                          ),
                        ),
                        Positioned(
                          left: 80,
                          right: 2,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ),
                                fixedSize: const Size(120, 50),
                                backgroundColor: Colors.black),
                            child: const SmallText(
                              text: "Buy now",
                              fontColor: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
