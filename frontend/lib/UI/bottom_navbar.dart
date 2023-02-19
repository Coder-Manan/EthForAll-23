import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.folder_copy),
          label: 'Portfolio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.token),
          label: 'Tokens',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet),
          label: 'Wallet',
        ),
      ],
    );
  }
}
