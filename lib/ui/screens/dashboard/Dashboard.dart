import 'package:antonx/core/constants/colors.dart';
import 'package:antonx/ui/screens/cart/cart_screen.dart';
import 'package:antonx/ui/screens/home_screen/home_screen.dart';
import 'package:antonx/ui/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;
  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              label: "Home"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.content_copy_rounded),label: "Home"),
          ],
          unselectedItemColor: greyColor,
          selectedItemColor: mainColor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0.5,
          iconSize: 30,
          currentIndex: selectedIndex,
          onTap: onItemClicked,
          enableFeedback:true,
          type: BottomNavigationBarType.shifting,
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children:  [
            HomeScreen(),
            ProfileScreen(),
            CartScreen(),
            HomeScreen(),
          ],
        )
    );
  }
}
