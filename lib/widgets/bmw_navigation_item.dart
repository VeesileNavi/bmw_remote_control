import 'package:car_app/models/navigation_item_model.dart';
import 'package:car_app/utils/app_gradient.dart';
import 'package:car_app/utils/gradient_mask.dart';
import 'package:flutter/material.dart';

class BmwNavigationItem extends StatelessWidget {
  const BmwNavigationItem(
      {super.key,
      required this.item,
      required this.onTap,
      required this.selectedIndex});

  final NavigationItemModel item;
  final Function() onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final selected = selectedIndex == item.id;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: double.maxFinite,
        width: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: selected?[
            BoxShadow(
              color: Colors.blue.withOpacity(0.7),
              blurRadius: 36.0,
              spreadRadius: 0,
            ),
          ]:null),
        child: GradientMask(
          gradient:
              selected ? AppGradient.blueGradient : AppGradient.disabledGradient,
          child: Icon(
            item.iconData,
            size: 36,
          ),
        ),
      ),
    );
  }
}
