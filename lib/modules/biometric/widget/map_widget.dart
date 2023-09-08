import 'package:chamran/widget/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    required this.latitude,
    required this.longitude,
    super.key,
  });
  final double? latitude;
  final double? longitude;

  @override
  State<MapWidget> createState() => _StatisticsMapItemState();
}

class _StatisticsMapItemState extends State<MapWidget> {
  bool _changed = false;
  MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (!_changed && widget.latitude != null && widget.longitude != null) {
      mapController.moveAndRotate(
          LatLng(widget.latitude!, widget.longitude!), 14, 0);
    }
    return Container(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: size.height * .0125),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'موقعیت مکانی',
                style: TextStyle(
                  fontFamily: 'Shabnam',
                  fontSize: size.width * .0325,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * .015),
          SizedBox(
            height: size.height * .2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  center: widget.latitude != null && widget.longitude != null
                      ? LatLng(widget.latitude!, widget.longitude!)
                      : null,
                  zoom: 14,
                  onPositionChanged: (position, hasGesture) {
                    setState(() {
                      _changed = true;
                    });
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png',
                    // rastertiles/voyager_labels_under
                    subdomains: const ['a', 'b', 'c', 'd'],
                  ),
                  MarkerLayer(
                    markers: [
                      if (widget.latitude != null && widget.longitude != null)
                        Marker(
                          width: size.width * .1,
                          height: size.width * .1,
                          point: LatLng(widget.latitude!, widget.longitude!),
                          builder: (ctx) => const SvgWidget(
                            path: 'assets/icons/marker.svg',
                            fastLoad: true,
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: size.height * .015),
        ],
      ),
    );
  }
}
