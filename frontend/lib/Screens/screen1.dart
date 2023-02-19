import 'package:flutter/material.dart';
import 'package:frontend/UI/search_bar.dart';
import 'package:frontend/UI/bottom_navbar.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchInput(),
      bottomNavigationBar: CustomNavbar(),
    );
  }
}
