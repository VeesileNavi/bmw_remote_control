import 'package:car_app/models/navigation_item_model.dart';
import 'package:car_app/pages/main_navigation_page/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../car_overview_page/car_overview.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({Key? key}) : super(key: key);

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {

  late PageController _pageController;

  @override
  void initState(){
    _pageController = PageController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          CarOverview(),
          Container(color: Colors.white,),
          Container(color: Colors.blue,),
          Container(color: Colors.red,),
        ],
      ),
      bottomNavigationBar: BmwBottomNavigationBar(
        items: const [
          NavigationItemModel(id: 0, iconData: Icons.lightbulb),
          NavigationItemModel(id: 1, iconData: Icons.local_gas_station_outlined),
          NavigationItemModel(id: 2, iconData: Icons.flare_sharp),
          NavigationItemModel(id: 3, iconData: Icons.person),
        ],
        onTap: (index) {
          _pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.linear);
        },
        initialIndex: 0,
      ),
    );
  }
}
