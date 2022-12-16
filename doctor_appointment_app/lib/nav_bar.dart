import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: MediaQuery.of(context).size.height * .0615,
      color: Color(0xffFFFFFF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.home,
            color: Color(0xffFD8311),
          ),
          Icon(
            Icons.collections_bookmark_sharp,
            color: Colors.grey,
          ),
          Icon(
            Icons.calendar_month_outlined,
            color: Colors.grey,
          ),
          Icon(
            Icons.settings,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
