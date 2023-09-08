import 'package:chamran/util/app_util.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AreaTempWidget extends StatelessWidget {
  const AreaTempWidget({
    required this.value,
    super.key,
  });
  final String? value;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .175,
      width: size.width,
      padding: EdgeInsets.only(
        top: size.height * .0025,
        bottom: size.height * .0025,
        left: size.width * .03,
        right: size.width * .0475,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(200),
            spreadRadius: -3,
            blurRadius: 20,
            blurStyle: BlurStyle.outer,
            offset: const Offset(-3, -3),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          stops: const [-.45, .45],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1c1c1c).withOpacity(.2),
            Colors.transparent,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'درجه سانتی گراد',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width * .03,
                fontFamily: 'Shabnam',
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Transform.scale(
                      scaleX: -1,
                      child: SizedBox(
                        width: size.width * .095,
                        height: size.width * .095,
                        child: SfRadialGauge(
                          enableLoadingAnimation: true,
                          axes: <RadialAxis>[
                            RadialAxis(
                              maximum: 60,
                              minimum: 0,
                              startAngle: 0,
                              endAngle: 360,
                              labelFormat: '',
                              showTicks: false,
                              axisLineStyle: const AxisLineStyle(
                                thickness: 1,
                                color: Colors.transparent,
                              ),
                              pointers: [
                                RangePointer(
                                  value:
                                      value != null ? double.parse(value!) : 0,
                                  color: const Color(0xFF147D77),
                                  width: 2,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF147D77),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF147D77).withAlpha(200),
                            spreadRadius: -3,
                            blurRadius: 20,
                            blurStyle: BlurStyle.outer,
                            offset: const Offset(-2, -2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        AppUtil.replacePersianNumber(value ?? '-'),
                        style: TextStyle(
                          fontSize: size.width * .07,
                          fontFamily: 'Shabnam',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Text(
            //   AppUtil.replacePersianNumber(value ?? ''),
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontSize: size.width * .065,
            //     fontFamily: 'ShabnamBold',
            //     color: Colors.white,
            //   ),
            // ),
          ),
          Expanded(
            child: Text(
              'دما محیط',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width * .03,
                fontFamily: 'Shabnam',
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: size.width * .02),
        ],
      ),
    );
  }
}
