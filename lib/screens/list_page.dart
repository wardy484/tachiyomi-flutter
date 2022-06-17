import 'package:flutter/material.dart';
import 'package:fluttiyomi/favourites/widgets/library_appbar.dart';
import 'package:fluttiyomi/home/pages/home_tab.dart';
import 'package:fluttiyomi/home/widgets/home_appbar.dart';
import 'package:fluttiyomi/screens/settings_tab.dart';
import 'package:fluttiyomi/search/widgets/search_appbar.dart';
import 'package:fluttiyomi/settings/widgets/settings_appbar.dart';
import 'package:fluttiyomi/widgets/favourites/favourites_tab.dart';
import 'package:fluttiyomi/widgets/search/search_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListPage extends ConsumerStatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: ListView(
      //     children: ref
      //         .watch(updateQueueProvider)
      //         .queue
      //         .map((e) => Text(e.name))
      //         .toList(),
      //   ),
      // ),
      appBar: <PreferredSizeWidget>[
        const LibraryAppbar(),
        const SearchAppbar(),
        const HomeAppbar(),
        const SettingsAppbar(),
      ].elementAt(_selectedIndex),
      body: [
        const FavouritesTab(),
        const SearchTab(),
        const HomeTab(),
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
            icon: Icon(Icons.book),
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
