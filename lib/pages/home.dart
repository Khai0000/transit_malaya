import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:transit_malaya/pages/announcement.dart';
import 'package:transit_malaya/pages/side_nav_bar.dart';
import 'package:transit_malaya/pages/travel.dart';
import 'package:transit_malaya/provider/marker_provider.dart';
import 'package:transit_malaya/widgets/bus_map.dart';
import 'package:transit_malaya/widgets/bus_map_options.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPage = 0;
  List<Marker> markerList = [];

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    final List<Widget> pages = [
      Column(
        children: [
          Expanded(
            child: BusMap(
              actionOnMap: () {},
            ),
          ),
          const BusMapOption(),
        ],
      ),
      const Travel(),
      const Announcement(),
    ];

    return SafeArea(
      key: scaffoldKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Transit Malaya",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          elevation: 5,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: pages[selectedPage],
        // body: const Travel(),
        drawer: const SideNavbar(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: (value) {
            setState(() {
              selectedPage = value;
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus),
              label: "Routes",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Travel",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notifications",
            ),
          ],
        ),
      ),
    );
  }
}
