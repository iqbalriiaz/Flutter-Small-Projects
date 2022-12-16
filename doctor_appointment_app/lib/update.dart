import 'package:flutter/material.dart';

class update extends StatefulWidget {
  const update({super.key});

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .215,
      color: Color(0xffFFFFFF),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DAILY UPDATE',
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff516089),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ':  ',
                style: TextStyle(
                    fontSize: 28,
                    color: Color(0xff516089),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.0009),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Symptoms of Covid to\n watch our for',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff516089),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    ' August 09. 8.23 AM',
                    style: TextStyle(
                        color: Color(0xff9BA3BB),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/pic.PNG',
                width: MediaQuery.of(context).size.width * 0.30,
              )
            ],
          )
        ],
      ),
    );
  }
}
