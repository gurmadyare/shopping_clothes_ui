import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_clothes/models/data/item_data.dart';
import 'package:shopping_clothes/widgets/big_card.dart';
import 'package:shopping_clothes/widgets/cloth_tile.dart';
import 'package:shopping_clothes/widgets/tabs_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    final screenSize = MediaQuery.of(context).size;

    //items
    List<ItemData> items = [
      //items
      ItemData(
        imagePath: "assets/images/enterprise_casual_shirt.png",
        name: "Enterprise casual \nshort Sleeve T-SHIRT",
        ratingNo: 4.9,
        reviews: 3987,
        price: 12.3,
        revKNo: 3.9,
        soldNo: 4.2,
      ),
      ItemData(
        imagePath: "assets/images/summer_lien_shirt.png",
        name: "Mens's summerese \nlein casual T-SHIRT",
        ratingNo: 4.6,
        reviews: 1903,
        price: 15.00,
        revKNo: 1.9,
        soldNo: 5.3,
      ),
      ItemData(
        imagePath: "assets/images/cocunut_tree.png",
        name: "Causual men cotton\ncocunut tree T-SHIRT",
        ratingNo: 4.8,
        reviews: 2398,
        price: 14.5,
        revKNo: 2.3,
        soldNo: 8.7,
      ),
      ItemData(
        imagePath: "assets/images/img6.png",
        name: "Long sleeve men's\nreal cotton T-shirt  ",
        ratingNo: 4.7,
        reviews: 3459,
        price: 15.6,
        revKNo: 3.4,
        soldNo: 4.6,
      ),
      ItemData(
        imagePath: "assets/images/beach_shirt.png",
        name: "Men's casual short\nsleeve beach T-shirt",
        ratingNo: 4.7,
        reviews: 4502,
        price: 9.25,
        revKNo: 4.5,
        soldNo: 12.8,
      ),
      ItemData(
        imagePath: "assets/images/linen_lon_sleeve.png",
        name: "Pure linen long- \nsleeve men's T-shirt",
        ratingNo: 4.8,
        reviews: 3702,
        price: 13.8,
        revKNo: 3.7,
        soldNo: 9.2,
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            //appBar
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //searchBar
                    SizedBox(
                        width: screenSize.width * 0.7,
                        height: 50,
                        child: TextField(
                            decoration: InputDecoration(
                          hintText: "Search....",
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(right: 15, left: 10),
                            child: Icon(Iconsax.search_normal, size: 25),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ))),

                    //icons
                    const Badge(
                        label: Text('3'),
                        child: Icon(Iconsax.shopping_bag, size: 28)),
                    const Badge(
                        label: Text('9+'),
                        child: Icon(Iconsax.message, size: 28)),
                  ],
                )),

            //Big_Card
            SizedBox(
                height: screenSize.height * .21,
                child: PageView(
                  controller: controller,
                  children: [
                    BigCard(
                      discountNo: "80",
                      subTitle:
                          "Discover beautifull fashion \nclothes that suits your style",
                      imagePath: "assets/images/img1.png",
                      bgColor: Colors.grey.shade400,
                    ),
                    BigCard(
                      discountNo: "45",
                      subTitle:
                          "Discover the best fashion women \nclothes of the year with this discount ",
                      imagePath: "assets/images/women_clothes.png",
                      bgColor: Colors.grey.shade400,
                    ),
                    BigCard(
                      discountNo: "60",
                      subTitle:
                          "Big discount on all types of male \n suits in this month",
                      imagePath: "assets/images/suits.png",
                      bgColor: Colors.grey.shade400,
                    ),
                  ],
                )),
            const SizedBox(height: 20),

            //indicators
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.orange, dotHeight: 12),
            ),
            const SizedBox(height: 20),

            //tabs
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TabsCard(icon: Iconsax.category_2, tabName: "Category"),
                TabsCard(icon: Iconsax.airplane, tabName: "Flight"),
                TabsCard(icon: Iconsax.shopping_bag, tabName: "Category"),
                TabsCard(icon: Iconsax.magic_star, tabName: "Favorites"),
                TabsCard(icon: Iconsax.direct_inbox, tabName: "Inbox"),
                TabsCard(
                    icon: Icons.tips_and_updates_outlined, tabName: "Tips"),
              ],
            ),
            const SizedBox(height: 30),

            //ClothesTile
            Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisExtent: screenSize.height * .4),
                    itemCount: items.length,
                    itemBuilder: (_, index) {
                      return ClothesTile(item: items[index]);
                    })),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(20),
        color: Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Iconsax.home_15,
              color: Colors.green,
              size: 28,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 30),
              child: Icon(
                Iconsax.wallet_1,
                color: Colors.grey,
                size: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Icon(
                Iconsax.profile_2user,
                color: Colors.grey[500],
                size: 28,
              ),
            ),
            const Icon(
              Iconsax.setting,
              color: Colors.grey,
              size: 28,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {},
        child: const Icon(Iconsax.search_favorite, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
