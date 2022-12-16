import 'package:doctor_appointment_app/nav_bar.dart';
import 'package:doctor_appointment_app/search_bar.dart';
import 'package:doctor_appointment_app/services.dart';
import 'package:doctor_appointment_app/update.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            color: Color(0xffF1F7FF),
            child: Column(
              children: [
                Expanded(flex: 4, child: search_bar()),
                SizedBox(height: MediaQuery.of(context).size.height * .0065),
                Expanded(flex: 3, child: services()),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .0065,
                ),
                Expanded(flex: 2, child: update()),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .0065,
                ),
                Expanded(flex: 1, child: NavBar())
              ],
            )),
      ),
    );
  }
}
