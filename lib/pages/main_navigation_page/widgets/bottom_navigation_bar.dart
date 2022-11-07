import 'dart:ui';

import 'package:car_app/models/navigation_item_model.dart';
import 'package:car_app/pages/main_navigation_page/widgets/bottom_navigation_bar_painter.dart';
import 'package:car_app/utils/app_gradient.dart';
import 'package:car_app/utils/gradient_mask.dart';
import 'package:car_app/widgets/navigation_item.dart';
import 'package:flutter/material.dart';

class BmwBottomNavigationBar extends StatefulWidget {
  const BmwBottomNavigationBar(
      {super.key,
      required this.onTap,
      required this.items,
      this.initialIndex = 0});

  final void Function(int index) onTap;
  final List<NavigationItemModel> items;
  final int initialIndex;

  @override
  State<BmwBottomNavigationBar> createState() => _BmwBottomNavigationBarState();
}

class _BmwBottomNavigationBarState extends State<BmwBottomNavigationBar> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 78,
              width: double.maxFinite,
              child: CustomPaint(
                painter: BottomNavigationBarPainter(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: widget.items.getRange(0, widget.items.length~/2)
                              .map((e) => BmwNavigationItem(
                                    item: e,
                                    onTap: () {
                                      setState((){selectedIndex = e.id;});
                                        widget.onTap(e.id);
                                    },
                                    selectedIndex: selectedIndex,
                                  ))
                              .toList()),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: widget.items.getRange(widget.items.length~/2, widget.items.length)
                              .map((e) => BmwNavigationItem(
                            item: e,
                            onTap: () {
                              setState((){selectedIndex = e.id;});
                              widget.onTap(e.id);
                            },
                            selectedIndex: selectedIndex,
                          ))
                              .toList()),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1),
                  ),
                  height: 68,
                  width: 68,
                  child: const GradientMask(
                      gradient: AppGradient.blueGradient,
                      child: Icon(
                        Icons.add,
                        size: 48,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
