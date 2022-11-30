import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:representative_a47nexpress/components/bloc/cubit/cubit.dart';
import 'package:representative_a47nexpress/components/bloc/cubit/states.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class GetCurrentLocationScreen extends StatelessWidget {
  const GetCurrentLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MandobCubit,MandobStates>(
      builder: (context, state) {
        var cuibt=MandobCubit.get(context);
        return  Scaffold(
          body:  Stack(
            fit: StackFit.expand,
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(30.0444, 31.2357),
                ),
                onMapCreated: (GoogleMapController controller) {
                  cuibt.googleMapController = controller;
                },
                markers: Set.of(cuibt.myMarker != null ? [cuibt.myMarker!] : []),
                circles: Set.of(cuibt.mycircle != null ? [cuibt.mycircle!] : []),
                // circles:circle,
                zoomControlsEnabled: false,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: FloatingSearchBar(
                  hint: 'Search...',
                 height: 60,
                 // controller:controller,
                  scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
                  transitionDuration: const Duration(milliseconds: 800),
                  transitionCurve: Curves.easeInOut,
                  physics: const BouncingScrollPhysics(),
                  axisAlignment: 0.0,
                  openAxisAlignment: 0.0,
                  width: 600,
                  debounceDelay: const Duration(milliseconds: 500),
                  onQueryChanged: (query) {// Call your model, bloc, controller here.
                  },
                  transition: CircularFloatingSearchBarTransition(),
                  actions: [
                    FloatingSearchBarAction(
                      showIfOpened: false,
                      child: CircularButton(
                        icon: const Icon(Icons.place),
                        onPressed: () {},
                      ),
                    ),
                    FloatingSearchBarAction.searchToClear(
                      showIfClosed: false,
                    ),
                  ],
                  builder: (context, transition) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child:Column(
                        children: [],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: () {
             cuibt.getCurrentLocation();
            },
          ),
        );
      },
    );
  }
}
