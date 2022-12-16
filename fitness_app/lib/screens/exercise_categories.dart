import 'dart:convert';

import 'package:fitness_app/screens/exercise_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/exercises.dart';

class ExerciseCategories extends StatefulWidget {
  const ExerciseCategories({Key? key}) : super(key: key);

  @override
  State<ExerciseCategories> createState() => _ExerciseCategoriesState();
}

class _ExerciseCategoriesState extends State<ExerciseCategories> {
  @override
  void initState() {
    // TODO: implement initState
    fetchData();

    super.initState();
  }

  List<ExercisesModel> allData = [];
  late ExercisesModel exercisesModel;

  fetchData() async {
    String apiLink =
        "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json?fbclid=IwAR0rA-YaYFkaozGiPvFvVfHlYnf8jEj07-qAVUZCVVI299KuRPkcuh7b7Nw";
    try {
      var response = await http.get(Uri.parse(apiLink));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (var item in data["exercises"]) {
          exercisesModel = ExercisesModel(
            id: item["id"],
            gif: item["gif"],
            seconds: item["seconds"],
            thumbnail: item["thumbnail"],
            title: item["title"],
          );
          setState(() {
            allData.add(exercisesModel);
          });
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: allData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text(index.toString())));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExerciseDetails(
                              exercisesModel: allData[index],
                            )));
                  },
                  child: Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "${allData[index].thumbnail}",
                                ),
                                fit: BoxFit.cover)),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              color: Colors.black,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${allData[index].title}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      "${allData[index].seconds} min",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        // child: Image.network(
                        //   "${allData[index].thumbnail}",
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
