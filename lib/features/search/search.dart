import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:moniepoint_real_estate/app_colors.dart';
import 'package:moniepoint_real_estate/features/search/custom_pop_up.dart';
import 'package:moniepoint_real_estate/features/search/custom_pop_up_item.dart';
import 'package:moniepoint_real_estate/features/search/glass_button.dart';
import 'package:moniepoint_real_estate/services/mapbox_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  MapBoxService mapBoxService = MapBoxService();
  final OverlayPortalController controller = OverlayPortalController();


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
                    GlassButton(
                      height: 50,
                      width: 50,
                      tooltip: 'Triangulate',
                      onTap: (){},
                      child: const Icon(
                        CupertinoIcons.layers_alt,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GlassButton(
                      height: 50,
                      width: 50,
                      tooltip: 'Zoom',
                      onTap: (){},
                      child: CustomPopUp(
                        items: const [
                          CustomPopItem(
                            icon: Icons.security,
                            text: 'Cosy areas',
                          ),
                          CustomPopItem(
                            icon: Icons.wallet,
                            text: 'Price',
                          ),
                          CustomPopItem(
                            icon: Icons.delete_sweep_rounded,
                            text: 'Infrastructure',
                          ),
                          CustomPopItem(
                            icon: Icons.layers,
                            text: 'Without any layer',
                          ),
                        ],
                        controller: controller,
                        currentIndex: 0,
                        onTap: (index){},
                        child: const Icon(
                          CupertinoIcons.paperplane,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 13),
                  decoration: BoxDecoration(
                      color: doveGrey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        CupertinoIcons.text_alignleft,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(width: 5,),
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
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.real_estate',
          ),
          MarkerLayer(
            markers: mapBoxService.getRandomMarkers,
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
                          hintStyle: const TextStyle(color: mineShaftGrey,fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      child: IconButton(
                       onPressed: (){},
                        color: Colors.white,
                        icon: const Icon(
                          Icons.tune,
                          color: Colors.black,
                        ),
                      ),
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
