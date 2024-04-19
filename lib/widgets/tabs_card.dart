import 'package:flutter/material.dart';
import 'package:shopping_clothes/widgets/small_text.dart';

class TabsCard extends StatelessWidget {
  final IconData icon;
  final String tabName;
  const TabsCard({super.key, required this.icon, required this.tabName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //tabIcon
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
          child: Icon(icon),
        ),
        const SizedBox(height: 10),

        //tabname
        SmallText(text: tabName),
      ],
    );
  }
}
