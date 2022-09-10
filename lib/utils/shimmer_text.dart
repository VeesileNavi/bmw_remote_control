import 'package:car_app/utils/app_style_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerText extends StatelessWidget {
  const ShimmerText({Key? key, required this.text, required this.textAlign}) : super(key: key);
  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      loop: 0,
      period: Duration(milliseconds: 3000),
        baseColor: Colors.white.withOpacity(0.2),
        highlightColor: Colors.white.withOpacity(0.5),
        child: Text(
          text,
          textAlign: textAlign,
          style: AppStyleText.titleTextStyle.copyWith(color: Colors.white.withOpacity(0.5)),
        ));
  }
}
