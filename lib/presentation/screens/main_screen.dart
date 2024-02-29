import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lettucelink/presentation/screens/home_screen.dart';
import 'package:lettucelink/presentation/screens/water_screen.dart';
import 'package:lettucelink/presentation/widgets/NavBar/bottom_navigation_bar.dart';
import 'package:lettucelink/presentation/widgets/Page/page_content.dart';
 
import '../../theme.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Color navigationBarColor = ThemeColor.navigationBarColor;
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const <Widget>[
            HomeScreen(),
            WaterScreen(),
            PageContent(color: Colors.green, text: 'Page 3 Content'),
            PageContent(color: Colors.blue, text: 'Page 4 Content'),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          navigationBarColor: navigationBarColor,
          selectedIndex: selectedIndex,
          pageController: pageController,
          onItemSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
            pageController.animateToPage(
              selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad,
            );
          },
        ),
      ),
    );
  }
}
