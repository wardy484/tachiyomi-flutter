import 'package:flutter/material.dart';
import 'package:fluttiyomi/downloads/widgets/download_tab.dart';
import 'package:fluttiyomi/favourites/presentation/favourites_appbar.dart';
import 'package:fluttiyomi/home/pages/home_tab.dart';
import 'package:fluttiyomi/home/widgets/home_appbar.dart';
import 'package:fluttiyomi/screens/settings_tab.dart';
import 'package:fluttiyomi/search/widgets/search_appbar.dart';
import 'package:fluttiyomi/settings/widgets/settings_appbar.dart';
import 'package:fluttiyomi/widgets/favourites/favourites_tab.dart';
import 'package:fluttiyomi/widgets/search/search_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        const FavouritesAppbar(),
        // AppBar(
        //   centerTitle: false,
        //   title: const Text("Chapter updates"),
        // ),
        const SearchAppbar(),
        const HomeAppbar(),
        const SettingsAppbar(),
        AppBar(
          centerTitle: false,
          title: const Text("Downloads"),
        ),
      ].elementAt(_selectedIndex),
      body: [
        const FavouritesTab(),
        // const ChapterUpdatesPage(),
        const SearchTab(),
        const HomeTab(),
        const SettingsTab(),
        const DownloadsTab(),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bookBookmark),
            label: 'Bookmarked',
          ),
          // BottomNavigationBarItem(
          //   icon: FaIcon(FontAwesomeIcons.fire),
          //   label: 'Chapter updates',
          // ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.compass),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
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
