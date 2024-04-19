import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_clothes/models/data/item_data.dart';
import 'package:shopping_clothes/pages/details_page.dart';
import 'package:shopping_clothes/widgets/small_text.dart';

class ClothesTile extends StatelessWidget {
  final ItemData item;
  const ClothesTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        //image
        GestureDetector(
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailsPage(item: item);
          })),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: screenSize.height * .2,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: item.imagePath == "assets/images/img3.png"
                      ? screenSize.width * .05
                      : 0),
              child: Center(
                  child: Image.asset(
                item.imagePath,
                width: 200,
                fit: BoxFit.fitHeight,
              )),
            ),
          ),
        ),

        //favoritesIcon
        Padding(
          padding: EdgeInsets.only(left: screenSize.width * .34, top: 10),
          child: const Icon(Icons.favorite_border_rounded),
        ),

        //details
        Positioned(
          top: screenSize.height * .22,
          left: 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SmallText(text: "T-SHIRT", fontColor: Colors.black54),
              Text(
                item.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5),

              //ratings
              Row(
                children: [
                  Icon(
                    Iconsax.star_1,
                    color: Colors.amber[600],
                  ),
                  const SizedBox(width: 5),

                  //RatingNo
                  SmallText(text: "${item.ratingNo}"),

                  //divider
                  const SmallText(text: "  |  "),
                  SmallText(text: "${item.reviews}"),
                  const SizedBox(width: 15),

                  //reviews
                  SmallText(
                    text: "\$${item.price}",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontColor: Colors.green,
                  )
                ],
              ),
              const SizedBox(height: 5),

              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(screenSize.width * .41, 20),
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.orangeAccent,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.add_shopping_cart_sharp),
                  label: const SmallText(text: "Add to cart"))
            ],
          ),
        ),
      ],
    );
  }
}
