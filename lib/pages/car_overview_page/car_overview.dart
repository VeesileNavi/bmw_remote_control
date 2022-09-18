import 'package:car_app/models/car_model.dart';
import 'package:car_app/pages/car_overview_page/widgets/menu_item.dart';
import 'package:car_app/pages/main_navigation_page/main_navigation_page.dart';

import 'package:car_app/utils/app_colors.dart';
import 'package:car_app/utils/app_style_text.dart';
import 'package:car_app/utils/global_constants.dart';
import 'package:car_app/widgets/car_widgets/car_side_widget.dart';


import 'package:car_app/widgets/neumorphic_widgets/rounded_neuporphic_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CarOverview extends StatefulWidget {
  CarOverview({super.key});

  @override
  State<CarOverview> createState() => _CarOverviewState();
}

class _CarOverviewState extends State<CarOverview> {
  final carModel = CarModel(
    carMainAsset: GlobalConstants.carFrontMainAsset,
    carHeadlightAsset: GlobalConstants.frontHeadlights,
    carTurnSignalAsset: GlobalConstants.frontTurnSignal,
    isHeadlightOn: true,
    isTurnSignalOn: true,
  );

  late double containerDepth;

  @override
  void initState() {
    super.initState();
    containerDepth = 0;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => Future.delayed(
       const Duration(milliseconds: 300),
        () => setState(() {
              containerDepth = 6;
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: SizedBox(
          height: 140,
          child: CupertinoNavigationBar(
            padding: const EdgeInsetsDirectional.all(24),
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMW x5',
                    style: AppStyleText.titleTextStyle.copyWith(fontSize: 24)),
                Text('120km left',
                    style: AppStyleText.descriptionTextStyle
                        .copyWith(color: Colors.grey)),
              ],
            ),
            // trailing: Padding(
            //   padding: EdgeInsets.only(right: 16),
            //   child: CircleNeumorphicWidget(
            //     depth: 4,
            //     child: GestureDetector(
            //       onTap: () => Navigator.of(context).pop(),
            //       child: const Padding(
            //         padding: EdgeInsets.all(10),
            //         child: RotatedBox(
            //           quarterTurns: 3,
            //           child: Icon(
            //             Icons.arrow_forward_ios_rounded,
            //             size: 24,
            //             color: Colors.grey,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromRGBO(19, 19, 19, 1),
              Color.fromRGBO(19, 19, 19, 1),
              Color.fromRGBO(42, 45, 50, 1),
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 148),
            child: Column(
              children: [
                Hero(
                  tag: GlobalConstants.carOverviewHero,
                  child: CarSideWidget(
                    carModel: carModel,
                    opacity: 0.5,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                RoundedNeumorphicWidget(
                  depth: containerDepth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        CupertinoIcons.lock,
                        color: Colors.grey,
                        size: 24,
                      ),
                      Icon(CupertinoIcons.wifi_exclamationmark,
                          color: Colors.grey, size: 24),
                      Icon(CupertinoIcons.lightbulb,
                          color: Colors.grey, size: 24),
                      Icon(CupertinoIcons.sparkles,
                          color: Colors.grey, size: 24),
                    ],
                  ),
                ),
               const SizedBox(
                  height: 48,
                ),
                RoundedNeumorphicWidget(
                    depth: containerDepth,
                    child: Column(
                      children: [
                        CarOverviewMenuItem(
                          iconData: CupertinoIcons.archivebox,
                          title: 'mainpage',
                          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainNavigationPage())),
                        ),
                        CarOverviewMenuItem(
                          iconData: CupertinoIcons.archivebox,
                          title: 'awffaawf',
                        ),
                        CarOverviewMenuItem(
                          iconData: CupertinoIcons.archivebox,
                          title: 'awffaawf',
                        ),
                        CarOverviewMenuItem(
                          iconData: CupertinoIcons.archivebox,
                          title: 'awffaawf',
                        ),
                        CarOverviewMenuItem(
                          iconData: CupertinoIcons.archivebox,
                          title: 'awffaawf',
                        ),
                      ],
                    )),
                RoundedNeumorphicWidget(
                    depth: 6,
                    child: Column(
                      children: [
                        CarOverviewMenuItem(
                          iconData: CupertinoIcons.archivebox,
                          title: 'awffaawf',
                        ),
                        CarOverviewMenuItem(
                          iconData: CupertinoIcons.archivebox,
                          title: 'awffaawf',
                        ),
                        CarOverviewMenuItem(
                          iconData: CupertinoIcons.archivebox,
                          title: 'awffaawf',
                        ),
                        CarOverviewMenuItem(
                          iconData: CupertinoIcons.archivebox,
                          title: 'awffaawf',
                        ),
                        CarOverviewMenuItem(
                          iconData: CupertinoIcons.archivebox,
                          title: 'awffaawf',
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
