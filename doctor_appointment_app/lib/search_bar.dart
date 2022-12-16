import 'package:flutter/material.dart';

class search_bar extends StatefulWidget {
  const search_bar({super.key});

  @override
  State<search_bar> createState() => _search_barState();
}

class _search_barState extends State<search_bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .35,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      color: Color(0xff07919D),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.waving_hand,
                        color: Color(0xffFECE4D),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Hello,",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff81C7CD)),
                      ),
                    ],
                  ),
                  Text(
                    "George Floyd",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xffF8FCFC),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, right: 20),
                    transform: Matrix4.rotationZ(100),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/doc3.jpg"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .00009,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .06,
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                Image.asset('assets/images/3.png'),
                SizedBox(
                  width: 10,
                ),
                Text('Search'),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SU',
                style: TextStyle(
                    color: Color(0xffD1EBED), fontWeight: FontWeight.w700),
              ),
              Text('MO',
                  style: TextStyle(
                      color: Color(0xffD1EBED), fontWeight: FontWeight.w700)),
              Text('TU',
                  style: TextStyle(
                      color: Color(0xffD1EBED), fontWeight: FontWeight.w700)),
              Text('WE',
                  style: TextStyle(
                      color: Color(0xffD1EBED), fontWeight: FontWeight.w700)),
              Text('TH',
                  style: TextStyle(
                      color: Color(0xffD1EBED), fontWeight: FontWeight.w700)),
              Text('FR',
                  style: TextStyle(
                      color: Color(0xffD1EBED), fontWeight: FontWeight.w700)),
              Text('SA',
                  style: TextStyle(
                      color: Color(0xffD1EBED), fontWeight: FontWeight.w700))
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.all(5),
                  width: 30,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color(0xffD1EBED).withOpacity(0.3)),
                      color: Color(0xff209CA7),
                      borderRadius: BorderRadius.circular(50)),
                  child:
                      Text('08', style: TextStyle(color: Color(0xffD1EBED)))),
              Container(
                  padding: EdgeInsets.all(5),
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child:
                      Text('09', style: TextStyle(color: Color(0xff07919D)))),
              Container(
                  padding: EdgeInsets.all(5),
                  width: 30,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color(0xffD1EBED).withOpacity(0.3)),
                      color: Color(0xff209CA7),
                      borderRadius: BorderRadius.circular(50)),
                  child:
                      Text('10', style: TextStyle(color: Color(0xffD1EBED)))),
              Container(
                  padding: EdgeInsets.all(5),
                  width: 30,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color(0xffD1EBED).withOpacity(0.3)),
                      color: Color(0xff209CA7),
                      borderRadius: BorderRadius.circular(50)),
                  child:
                      Text('11', style: TextStyle(color: Color(0xffD1EBED)))),
              Container(
                  padding: EdgeInsets.all(5),
                  width: 30,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color(0xffD1EBED).withOpacity(0.3)),
                      color: Color(0xff209CA7),
                      borderRadius: BorderRadius.circular(50)),
                  child:
                      Text('12', style: TextStyle(color: Color(0xffD1EBED)))),
              Container(
                  padding: EdgeInsets.all(5),
                  width: 30,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color(0xffD1EBED).withOpacity(0.3)),
                      color: Color(0xff209CA7),
                      borderRadius: BorderRadius.circular(50)),
                  child:
                      Text('13', style: TextStyle(color: Color(0xffD1EBED)))),
              Container(
                  padding: EdgeInsets.all(5),
                  width: 30,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color(0xffD1EBED).withOpacity(0.3)),
                      color: Color(0xff209CA7),
                      borderRadius: BorderRadius.circular(50)),
                  child:
                      Text('14', style: TextStyle(color: Color(0xffD1EBED)))),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Text(
                '. .',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.20,
              ),
              Text(
                '. .',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.10,
              ),
              Text(
                '. .',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.07,
              ),
              Text(
                '. .',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.23,
              ),
              Text(
                ' . .',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
