import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import '../../../theme.dart';

// 
// check this
// https://pub.dev/packages/water_drop_nav_bar/install
// 


class BottomNavBar extends StatelessWidget {
  final Color navigationBarColor;
  final int selectedIndex;
  final PageController pageController;
  final Function(int) onItemSelected;

  const BottomNavBar({
    Key? key,
    required this.navigationBarColor,
    required this.selectedIndex,
    required this.pageController,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WaterDropNavBar(
      waterDropColor: ThemeColor.bottomNavBarDropColor,
      backgroundColor: navigationBarColor,
      onItemSelected: onItemSelected,
      selectedIndex: selectedIndex,
      barItems:  <BarItem>[
        BarItem(
          filledIcon: Icons.home,
          outlinedIcon: Icons.home_outlined,
        ),
        BarItem(
          filledIcon: Icons.water_drop,
          outlinedIcon: Icons.water_drop_outlined,
        ),
        BarItem(
          filledIcon: Icons.chat,
          outlinedIcon: Icons.chat_bubble_outline_outlined,
        ),
        BarItem(
          filledIcon: Icons.settings, 
          outlinedIcon: Icons.settings_outlined,
        ),
      ],
    );
  }
}
