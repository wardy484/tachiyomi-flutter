import 'package:flutter/material.dart';
import 'package:fluttiyomi/favourites/widgets/library_appbar.dart';
import 'package:fluttiyomi/screens/settings_tab.dart';
import 'package:fluttiyomi/search/widgets/search_appbar.dart';
import 'package:fluttiyomi/settings/widgets/settings_appbar.dart';
import 'package:fluttiyomi/widgets/favourites/favourites_tab.dart';
import 'package:fluttiyomi/widgets/search/search_screen.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: <PreferredSizeWidget>[
        const LibraryAppbar(),
        const SearchAppbar(),
        const SettingsAppbar(),
      ].elementAt(_selectedIndex),
      body: [
        const FavouritesTab(),
        const SearchTab(),
        const SettingsTab(),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarked',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
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
