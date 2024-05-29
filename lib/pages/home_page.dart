import 'package:ecommerce_app/components/bottom_nav_bar.dart';
import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:ecommerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// to control the bottom navbar
  int _selectedIndex = 0;

// to update the selected index
// when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavbar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: Colors.black));
        }),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // logo
            Column(
              children: [
                DrawerHeader(
                    child: Image.asset('lib/images/nike_logo.png',
                        color: Colors.white)),
                const Padding(
                  padding: EdgeInsets.only(left: 24.0),
                  child: ListTile(
                      leading: Icon(Icons.home, color: Colors.white),
                      title:
                          Text('Home', style: TextStyle(color: Colors.white))),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 24.0),
                  child: ListTile(
                      leading: Icon(Icons.info, color: Colors.white),
                      title:
                          Text('About', style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0, bottom: 24.0),
              child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text('Logout', style: TextStyle(color: Colors.white))),
            ),
            // oter pages
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
