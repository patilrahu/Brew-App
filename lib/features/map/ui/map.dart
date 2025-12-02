import 'package:brewy_app/features/home/bloc/brew_bloc.dart';
import 'package:brewy_app/features/home/bloc/brew_event.dart';
import 'package:brewy_app/features/home/bloc/brew_state.dart';
import 'package:brewy_app/widgets/app_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<BrewBloc>().add(LoadBrew());
  }

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
      child: Scaffold(
        body: BlocBuilder<BrewBloc, BrewState>(
          builder: (context, state) {
            if (state is BrewLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is BrewLoaded) {
              final brewList = state.brewData;

              return FlutterMap(
                options: MapOptions(center: LatLng(19.0760, 72.8777), zoom: 13),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: const ['a', 'b', 'c'],
                  ),

                  MarkerLayer(
                    markers: brewList.map((brew) {
                      return Marker(
                        point: LatLng(
                          brew.latitude ?? 0.0,
                          brew.longitude ?? 0.0,
                        ),
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.location_pin,
                          size: 40,
                          color: Colors.red,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
