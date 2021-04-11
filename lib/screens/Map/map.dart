// import 'dart:collection';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class ShowroomLocation extends StatefulWidget {
//   @override
//   _ShowroomLocationState createState() => _ShowroomLocationState();
// }

// class _ShowroomLocationState extends State<ShowroomLocation> {
//   BitmapDescriptor customIcon;
//   Set<Marker> markers = HashSet<Marker>();
//   GoogleMapController _controller;
//   BitmapDescriptor _markerIcon;

//   void initState() {
//     super.initState();
//     _setMarkerIcon();
//     markers = Set.from([]);
//   }

//   // void setPermissions() async {
//   //   Map<PermissionGroup, PermissionStatus> permissions =
//   //       await PermissionHandler()
//   //           .requestPermissions([PermissionGroup.location]);
//   // }

//   final CameraPosition _initialPosition =
//       CameraPosition(target: LatLng(26.6640760, 87.2691263), zoom: 22);

//   void _setMarkerIcon() async {
//     _markerIcon = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(), 'assets/images/marker.png');
//   }

//   void _onMapCreated(controller) {
//     controller = controller;
//     setState(() {
//       markers.add(Marker(
//           markerId: MarkerId('0'),
//           position: LatLng(26.6640760, 87.2691263),
//           infoWindow: InfoWindow(
//             title: "Pathibhara Enterprises",
//             snippet: "Decorate Your Home",
//           ),
//           icon: _markerIcon));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: _initialPosition,
//         mapType: MapType.normal,
//         // onMapCreated: (controller) {
//         //   setState(() {
//         //     _controller = controller;
//         //   });
//         // },
//         markers: markers,
//         onTap: (cordinate) {
//           _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
//           _onMapCreated(cordinate);
//         },
//       ),
//     );
//   }
// }