import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../style/style.dart';

class CustomBottomNav extends StatelessWidget {
  final int libraryIndex;
  final int selectedIndex;
  final Function(int index) onTap;

  const CustomBottomNav({
    super.key,
    this.libraryIndex = 0,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {"icon": "assets/svgs/home.svg", "title": "Home"},
      {"icon": "assets/svgs/books.svg", "title": "Books"},
      {"icon": "assets/svgs/library.svg", "title": "Library"},
      {"icon": "assets/svgs/cart.svg", "title": "Cart"},
      {"icon": "assets/svgs/profile.svg", "title": "Profile"},
    ];

    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: btn2Color,
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(20),
        //   topRight: Radius.circular(20),
        // ),
        boxShadow: [
          BoxShadow(
            color: lightGreyColor,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  items[index]["icon"]!,
                  height: 22,
                  width: 22,
                  color: isSelected ? whiteColor : iconGreyColor,
                ),
                const Gap(4),
                Text(
                  items[index]["title"]!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? whiteColor : iconGreyColor,
                  ),
                ),
                const Gap(2),
                Container(
                  height: 2,
                  width: 28,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.orange : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
