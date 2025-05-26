import 'package:flutter/material.dart';
import 'package:nbf_bookpublications_app/view/home.dart';
import 'package:nbf_bookpublications_app/view/cart_page.dart';
import 'package:nbf_bookpublications_app/view/library/detailbook_page.dart';
import 'package:nbf_bookpublications_app/view/library/favourite_book.dart';
import 'package:nbf_bookpublications_app/view/library/library_page.dart';
import 'package:nbf_bookpublications_app/view/library/mylibrary_book.dart';
import 'package:nbf_bookpublications_app/view/library/reading_book.dart';
import 'package:nbf_bookpublications_app/view/profile_page.dart';
import 'package:nbf_bookpublications_app/view/search_book_page.dart';
import 'navbar.dart';

class NavBarHomePage extends StatefulWidget {
  final int? index;

  const NavBarHomePage({super.key, this.index});

  @override
  _NavBarHomePageState createState() => _NavBarHomePageState();
}

class _NavBarHomePageState extends State<NavBarHomePage> {
  int _selectedIndex = 0;
  int libraryIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.index ?? 0; // Use index from queryParameters

    super.initState();
    if(libraryIndex>0){
      _selectedIndex = 2;
    }
  }

  void _onNavTapped(int index) {
    setState(() {
      if (index != 2) {
        libraryIndex = 0;
      }
      _selectedIndex = index;
    });
  }


  void _onLibraryPageChanged(int index) {
    Future.microtask(() {
      setState(() {
        libraryIndex = index;
      });
    });
  }



  final List<Widget> _pages = [
    HomePage(),
    SearchBookPage(),
    SizedBox(),
    CartPage(),
    ProfilePage()
  ];

  Widget customizeNavigator() {
    switch (libraryIndex) {
      case 0:
        return LibraryPage(
          onSubPageChange: _onLibraryPageChanged,
        );
      case 1:
        return ReadingBookPage(
          goBackToMainLibrary: () => _onLibraryPageChanged(0),
        );
      case 2:
        return FavouriteBookPage(
          goBackToMainLibrary: () => _onLibraryPageChanged(0),
        );
      case 3:
        return MyLibraryBookPage(
          onSubPageChange1: _onLibraryPageChanged,
          goBackToMainLibrary: () => _onLibraryPageChanged(0),
        );
      case 4:
        return BookDetailPage(
          goBackToMainLibrary: () => _onLibraryPageChanged(3),
        );
      default:
        return const Center(child: Text('Invalid Library Page'));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 2 ? customizeNavigator() : _pages[_selectedIndex], // Change page based on selected index
      bottomNavigationBar: CustomBottomNav(
        libraryIndex: libraryIndex,
        selectedIndex: _selectedIndex,
        onTap: _onNavTapped,
      ),
    );
  }
}
