import 'package:flutter/material.dart';
import 'package:store_app_using_bloc/features/cart/ui/cart_screen.dart';
import 'package:store_app_using_bloc/features/home/ui/home_screen.dart';
import 'package:store_app_using_bloc/features/wishlist/ui/my_wishlist_screen.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
   int _selectedIndex = 0;

   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  // screens
  final List<Widget> _screens = const [
    HomeScreen(),
    MyWishlistScreen(),
    CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
