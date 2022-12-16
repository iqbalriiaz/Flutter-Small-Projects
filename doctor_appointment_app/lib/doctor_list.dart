// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'appointment.dart';
import 'model/doctor_details.dart';

class DoctorListPage extends StatefulWidget {
  const DoctorListPage({super.key});

  @override
  State<DoctorListPage> createState() => _DoctorListPageState();
}

class _DoctorListPageState extends State<DoctorListPage> {
  // final List<DoctorDetails> doctorInfo = List.generate(docName.length,
  //     (index) => DoctorDetails("${docImage[index]}", "${docName[index]}"));

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF07919D),
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Color(0xFFE7EDF9),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xFF07919D)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        "DOCTORS",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Container(
                        child: Text(
                          '  !  ',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xFF07919D),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: 'Search',
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.grey),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Icon(
                              Icons.search,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              flex: 7,
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'DOCTOR NEARBY',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF374878)),
                                ),
                                Text(
                                  'SEE ALL',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFFFA8113)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage: AssetImage(
                                        doctorInfo[index].docImage,
                                      ),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // "${docName[index]}",
                                        doctorInfo[index].docName,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFF374878)),
                                      ),
                                      Text("General Practioner",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                  255, 166, 167, 168))),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color:
                                                  Colors.blue.withOpacity(0.2),
                                            ),
                                            child: Icon(
                                              Icons.medical_services,
                                              color: Colors.blue,
                                              size: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("3 years",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color.fromARGB(
                                                      255, 166, 167, 168))),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color:
                                                  Colors.red.withOpacity(0.2),
                                            ),
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("92%",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color.fromARGB(
                                                      255, 166, 167, 168))),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Total fee",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color.fromARGB(
                                                          255, 166, 167, 168))),
                                              Text("\$80",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Color(0XFF374878))),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0XFFFA8113)),
                                            child: Text(
                                              'Make an appoinment',
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AppointmentPage(
                                                            doctorDetails:
                                                                doctorInfo[
                                                                    index])),
                                              );
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: doctorInfo.length),
            )
          ],
        ),
      ),
    );
  }
}
