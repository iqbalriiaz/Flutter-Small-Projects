import 'package:doctor_appointment_app/doctor_list.dart';
import 'package:flutter/material.dart';

class services extends StatefulWidget {
  const services({super.key});

  @override
  State<services> createState() => _servicesState();
}

class _servicesState extends State<services> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffFFFFFF),
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SERVICES',
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff516089),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'SEE ALL',
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xffFD9E44),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.02,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xffD5ECEE),
                        borderRadius: BorderRadius.circular(50)),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/covid2.PNG',
                        width: MediaQuery.of(context).size.width * 0.14,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorListPage()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xffD5ECEE),
                          borderRadius: BorderRadius.circular(50)),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/doctor.PNG',
                          width: MediaQuery.of(context).size.width * 0.14,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xffD5ECEE),
                        borderRadius: BorderRadius.circular(50)),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/hospital.PNG',
                        width: MediaQuery.of(context).size.width * 0.14,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xffD5ECEE),
                        borderRadius: BorderRadius.circular(50)),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/medicines.PNG',
                        width: MediaQuery.of(context).size.width * 0.14,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Covid-19',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff516089),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Doctors',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff516089),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Hospitals',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff516089),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Medicines',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff516089),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
