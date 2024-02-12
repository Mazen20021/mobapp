// import 'package:flutter/material.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

// class Maps extends StatefulWidget {
//   const Maps({super.key});
//   @override
//   State<Maps> createState() {
//     return _maps();
//   }
// }

// class _maps extends State<Maps> {
//   GeoPoint? geoPoint;
//   MapController controller = MapController(
//     initMapWithUserPosition: false,
//     initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
//     areaLimit: BoundingBox(
//       east: 10.4922941,
//       north: 47.8084648,
//       south: 45.817995,
//       west: 5.9559113,
//     ),
//   );

//   get mapController => null;

//   get id => null;
//   Future<void> currentloc() async {
//     await controller.currentLocation();
//   }

//   Future<void> zoomin() async {
//     await controller.zoomIn();
//   }

//   Future<void> zoomout() async {
//     await controller.zoomOut();
//   }

//   Future<void> zoomlvl() async {
//     await controller.setZoom(zoomLevel: 8);
//   }

//   Future<void> currentzoomlvl() async {
//     await controller.getZoom();
//   }

//   Future<void> map_bounding_box() async {
//     await controller.limitAreaMap(BoundingBox(
//       east: 10.4922941,
//       north: 47.8084648,
//       south: 45.817995,
//       west: 5.9559113,
//     ));
//   }

//   Future<void> map_bounding_box_rm() async {
//     await controller.removeLimitAreaMap();
//   }

//   Future<void> track() async {
//     await controller.enableTracking();
//   }

//   Future<void> untrack() async {
//     await controller.disabledTracking();
//   }

//   Future<void> updateloc() async {
//     await controller
//         .changeLocation(GeoPoint(latitude: 47.35387, longitude: 8.43609));
//   }

//   Future<void> changeloc() async {
//     await controller
//         .goToLocation(GeoPoint(latitude: 47.35387, longitude: 8.43609));
//   }

//   Future<void> recuotionloc() async {
//     geoPoint = await controller.myLocation();
//   }

//   Future<void> selectloc() async {
//     geoPoint = await controller.selectPosition();
//   }

//   Future<void> createmarker() async {
//     await controller.addMarker(GeoPoint as GeoPoint,
//         markerIcon: MarkerIcon(
//           icon: const Icon(
//             Icons.location_history_rounded,
//             color: Colors.red,
//             size: 48,
//           ),
//         ));
//   }

//   Future<void> rmmarker() async {
//     await controller.removeMarker(geoPoint!);
//   }

//   Future<void> rotate(double degree) async {
//     await controller.rotateMapCamera(degree);
//   }

//   Future<void> rmshapes(double degree) async {
//     await controller.removeAllShapes();
//   }

//   Future<void> drawcirc(double degree) async {
//     /// to draw
//     await controller.drawCircle(CircleOSM(
//       key: "circle0",
//       centerPoint: GeoPoint(latitude: 47.4333594, longitude: 8.4680184),
//       radius: 1200.0,
//       color: Colors.red,
//       strokeWidth: 0.3,
//     ));

//     /// to remove Circle using Key
//     await controller.removeCircle("circle0");

//     /// to remove All Circle in the map
//     await controller.removeAllCircle();
//   }

//   Future<void> drawrec(double degree) async {
//     /// to draw
//     await controller.drawRect(RectOSM(
//       key: "rect",
//       centerPoint: GeoPoint(latitude: 47.4333594, longitude: 8.4680184),
//       distance: 1200.0,
//       color: Colors.red,
//       strokeWidth: 0.3,
//     ));

//     /// to remove Rect using Key
//     await controller.removeRect("rect");

//     /// to remove All Rect in the map
//     await controller.removeAllRect();
//   }

//   Future<void> drawroad() async {
//     RoadInfo roadInfo = await controller.drawRoad(
//       GeoPoint(latitude: 47.35387, longitude: 8.43609),
//       GeoPoint(latitude: 47.4371, longitude: 8.6136),
//       roadType: RoadType.car,
//       intersectPoint: [
//         GeoPoint(latitude: 47.4361, longitude: 8.6156),
//         GeoPoint(latitude: 47.4481, longitude: 8.6266)
//       ],
//       roadOption: RoadOption(
//           roadWidth: 10, roadColor: Colors.blue, showMarkerOfPOI: false),
//     );
//     print("${roadInfo.distance}km");
//     print("${roadInfo.duration}sec");
//   }

//   Future<void> deleteroad() async {
//     await controller.removeLastRoad();
//   }

//   @override
//   OSMFlutter build(BuildContext context) {
//     controller.dispose();
//     return OSMFlutter(
//       controller: mapController,
//       trackMyPosition: false,
//       initZoom: 12,
//       minZoomLevel: 8,
//       maxZoomLevel: 14,
//       stepZoom: 1.0,
//       userLocationMarker: UserLocationMaker(
//         personMarker: MarkerIcon(
//           icon: const Icon(
//             Icons.location_history_rounded,
//             color: Colors.red,
//             size: 48,
//           ),
//         ),
//         directionArrowMarker: MarkerIcon(
//           icon: const Icon(
//             Icons.double_arrow,
//             size: 48,
//           ),
//         ),
//       ),
//       roadConfiguration: RoadConfiguration(
//         startIcon: MarkerIcon(
//           icon: const Icon(
//             Icons.person,
//             size: 64,
//             color: Colors.brown,
//           ),
//         ),
//         roadColor: Colors.yellowAccent,
//       ),
//       markerOption: MarkerOption(
//           defaultMarker: MarkerIcon(
//         icon: const Icon(
//           Icons.person_pin_circle,
//           color: Colors.blue,
//           size: 56,
//         ),
//       )),
//     );
//   }
// }
