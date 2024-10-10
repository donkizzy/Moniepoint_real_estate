import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:moniepoint_real_estate/app_colors.dart';
import 'package:moniepoint_real_estate/features/search/custom_marker.dart';
import 'package:moniepoint_real_estate/features/search/glass_button.dart';
import 'package:moniepoint_real_estate/location.dart';
import 'package:moniepoint_real_estate/services/mapbox_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  MapBoxService mapBoxService = MapBoxService();
  final OverlayPortalController controller = OverlayPortalController();
  Map<String, IconData> menuTitles = {
    'Cosy areas': Icons.verified_user_outlined,
    'Price': Icons.wallet_outlined,
    'Infrastructure': Icons.pageview_outlined,
    'Without any layer': Icons.layers_outlined,
  };
  ValueNotifier<bool> isExpanded = ValueNotifier(false);
  late List<Location> locations ;

  @override
  void initState() {
   locations = mapBoxService.getRandomLocations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100.0, left: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    const GlassButton(
                      height: 50,
                      width: 50,
                      child: Icon(
                        CupertinoIcons.layers_alt,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    PopupMenuButton(
                      popUpAnimationStyle: AnimationStyle(
                        curve: Curves.easeInOut,
                        duration: 800.milliseconds,
                        reverseCurve: Curves.easeIn,
                      ),
                      position: PopupMenuPosition.over,
                      offset: const Offset(0, -195),
                      onSelected: (value) {
                        if (value == 'Price') {
                          isExpanded.value = !isExpanded.value ;
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      menuPadding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context) {
                        return menuTitles.keys.map((choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  menuTitles[choice],
                                  color: tapaGrey,
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  choice,
                                  style: const TextStyle(color: tapaGrey, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          );
                        }).toList();
                      },
                      child: const GlassButton(
                        height: 50,
                        width: 50,
                        child: Icon(
                          CupertinoIcons.paperplane,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                  decoration: BoxDecoration(color: doveGrey.withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        CupertinoIcons.text_alignleft,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'List of variants',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(
            mapBoxService.current.lat,
            mapBoxService.current.long,
          ),
          initialZoom: 9.2,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png',
            subdomains: const ['a', 'b', 'c', 'd'],
            userAgentPackageName: 'com.example.real_estate',
            retinaMode: true,
          ),
          ValueListenableBuilder(
            valueListenable: isExpanded,
            builder: (BuildContext context, bool value, Widget? child) {
              return MarkerLayer(
                markers:  List<Marker>.from(locations.map(
                        (e) => Marker(
                          height: 35,
                      width: !value? 35 : 70,
                      point: LatLng(e.lat, e.long),
                      child:  CustomMarker(isExpanded: value,),
                    ),
                  ),
                ),
              ) ;
            },
          ),
          Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Saint Petersburg',
                          hintStyle: const TextStyle(color: mineShaftGrey, fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                        ),
                      ),
                    ).animate().scale(duration: 0.8.seconds, curve: Curves.easeOut,),
                    const SizedBox(
                      width: 10,
                    ),
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      child: IconButton(
                        onPressed: () {},
                        color: Colors.white,
                        icon: const Icon(
                          Icons.tune,
                          color: Colors.black,
                        ),
                      ),
                    ).animate().scale(duration: 0.8.seconds, curve: Curves.easeOut,),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
