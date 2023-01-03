import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? dob;
  DateDuration? picked_birthday;
  DateDuration? next_birthday;
  DateDuration? previous_birthday;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Birthday Calculator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                "images/birthday.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    height: 60,
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              dob == null ? "No Birth day selected" : dob!,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDate();
                      });
                    },
                    child: Container(
                        height: 60,
                        child: Card(
                          elevation: 10,
                          child: Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                          color: Colors.blue[300],
                        )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Current date:",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w800,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(DateFormat.yMMMd().format(DateTime.now()),
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: screenHeight / 3,
              width: double.infinity,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Age:",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${picked_birthday ?? ""}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Next Birthday:",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${next_birthday ?? ""}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Text(
                      //   "Previous Birthday:",
                      //   style: TextStyle(
                      //       fontSize: 18,
                      //       color: Colors.grey,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Text(
                      //   "${previous_birthday ?? ""}",
                      //   style: TextStyle(
                      //       fontSize: 18, fontWeight: FontWeight.bold),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      setState(() {
        dob = DateFormat("dd/MM/yyyy").format(selectedDate);
        picked_birthday =
            AgeCalculator.age(selectedDate, today: DateTime.now());
        next_birthday = AgeCalculator.timeToNextBirthday(selectedDate,
            fromDate: DateTime.now());
      });
    }
  }
}
