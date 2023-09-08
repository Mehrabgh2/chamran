import 'package:flutter/cupertino.dart';
import 'package:jovial_svg/jovial_svg.dart';

class SvgWidget extends StatelessWidget {
  const SvgWidget({
    Key? key,
    required this.path,
    this.color,
    this.fit,
    this.fastLoad = false,
  }) : super(key: key);
  final String path;
  final bool fastLoad;
  final Color? color;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return ScalableImageWidget.fromSISource(
      alignment: Alignment.center,
      fit: fit ?? BoxFit.fitWidth,
      si: ScalableImageSource.fromSvg(
        DefaultAssetBundle.of(context),
        path,
      ),
    );
  }
}
