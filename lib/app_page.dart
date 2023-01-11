import 'package:flutter/material.dart';
import 'package:fluttiyomi/downloads/presentation/widgets/download_tab.dart';
import 'package:fluttiyomi/favourites/presentation/favourites_appbar.dart';
import 'package:fluttiyomi/favourites/presentation/favourites_tab.dart';
import 'package:fluttiyomi/home/pages/home_tab.dart';
import 'package:fluttiyomi/home/widgets/home_appbar.dart';
import 'package:fluttiyomi/search/widgets/search_appbar.dart';
import 'package:fluttiyomi/settings/presentation/settings_appbar.dart';
import 'package:fluttiyomi/settings/presentation/settings_tab.dart';
import 'package:fluttiyomi/widgets/search/search_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppPage extends ConsumerStatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends ConsumerState<AppPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: <PreferredSizeWidget>[
        const FavouritesAppbar(),
        const SearchAppbar(),
        const HomeAppbar(),
        AppBar(
          centerTitle: false,
          title: const Text("Downloads"),
        ),
        const SettingsAppbar(),
      ].elementAt(_selectedIndex),
      body: [
        const FavouritesTab(),
        const SearchTab(),
        const HomeTab(),
        const DownloadsTab(),
        const SettingsTab(),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: BottomAppbarIcon(icon: FontAwesomeIcons.bookBookmark),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: BottomAppbarIcon(icon: FontAwesomeIcons.magnifyingGlass),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: BottomAppbarIcon(icon: FontAwesomeIcons.compass),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: BottomAppbarIcon(icon: FontAwesomeIcons.download),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: BottomAppbarIcon(icon: FontAwesomeIcons.gear),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class BottomAppbarIcon extends StatelessWidget {
  final IconData icon;

  const BottomAppbarIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: FaIcon(icon),
    );
  }
}
