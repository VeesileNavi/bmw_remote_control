import 'package:car_app/utils/app_style_text.dart';
import 'package:flutter/material.dart';

class CarOverviewMenuItem extends StatelessWidget {
  const CarOverviewMenuItem({Key? key, required this.iconData, required this.title, this.onTap}) : super(key: key);
  final IconData iconData;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Icon(iconData, color: Colors.white.withOpacity(0.4), size: 24,),
              const SizedBox(width: 12,),
              Text(title, style: AppStyleText.titleTextStyle.copyWith(fontSize: 16, color: Colors.white.withOpacity(0.4)),),
            ],),
            Icon(Icons.arrow_forward_ios_rounded, color: Colors.white.withOpacity(0.4),)
          ],),
      ),
    );
  }
}
