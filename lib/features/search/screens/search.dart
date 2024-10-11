import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:moniepoint_real_estate/core/app_colors.dart';
import 'package:moniepoint_real_estate/features/search/widget/custom_marker.dart';
import 'package:moniepoint_real_estate/features/search/widget/floating_widget.dart';
import 'package:moniepoint_real_estate/models/location.dart';
import 'package:moniepoint_real_estate/services/mapbox_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  MapBoxService mapBoxService = MapBoxService();

  ValueNotifier<bool> isExpanded = ValueNotifier(false);
  late List<Location> locations;

  @override
  void initState() {
    locations = mapBoxService.getRandomLocations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingWidget(isExpanded: isExpanded,),
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
          return AnimatedSwitcher(
            duration: 500.ms,
            child: value
                ? MarkerLayer(
              key: const ValueKey('expanded'), // Add key here
              markers: List<Marker>.from(
                locations.map(
                      (e)=> Marker(
                    key: ValueKey(e.lat), // Add key here (assuming 'id' is unique)
                    height: 35,
                    width: 35,
                    point: LatLng(e.lat, e.long),
                    child: CustomMarker(isExpanded: value),
                  ),
                ),
              ),
            )
                : MarkerLayer(
              key: const ValueKey('collapsed'), // Add key here
              markers: List<Marker>.from(
                locations.map(
                      (e) => Marker(
                    key: ValueKey(e.lat), // Add key here
                    height: 35,
                    width: 70,
                    point: LatLng(e.lat, e.long),
                    child: CustomMarker(isExpanded: value),
                  ),
                ),
              ),
            ),
          );
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
                    ).animate().scale(
                          duration: 0.8.seconds,
                          curve: Curves.easeOut,
                        ),
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
                    ).animate().scale(
                          duration: 0.8.seconds,
                          curve: Curves.easeOut,
                        ),
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


