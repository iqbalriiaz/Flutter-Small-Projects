import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/models/exercises.dart';
import 'package:fitness_app/screens/exercise_performance.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExerciseDetails extends StatefulWidget {
  ExerciseDetails({Key? key, this.exercisesModel}) : super(key: key);

  final ExercisesModel? exercisesModel;

  @override
  State<ExerciseDetails> createState() => _ExerciseDetailsState();
}

class _ExerciseDetailsState extends State<ExerciseDetails> {
  int second = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Exercise",
          style: TextStyle(color: Colors.green),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.green,
            )),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: "${widget.exercisesModel!.thumbnail}",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Center(
                  child: Icon(
                Icons.error,
                size: 50,
              )),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(


                margin: EdgeInsets.only(top: 10.0),
                color: Colors.black,
                child: Text(
                  "${widget.exercisesModel!.title}",

                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                        customColors: CustomSliderColors(
                      trackColor: Colors.white,
                      progressBarColor: Colors.green,
                    )),
                    min: 0,
                    max: 60,
                    initialValue: second.toDouble(),
                    onChange: (double value) {
                      // callback providing a value while its being changed (with a pan gesture)
                      setState(() {
                        second = value.toInt();
                      });
                    },
                    onChangeStart: (double startValue) {
                      // callback providing a starting value (when a pan gesture starts)
                    },
                    onChangeEnd: (double endValue) {
                      // ucallback providing an ending value (when a pan gesture ends)
                    },
                    innerWidget: (double value) {
                      // use your custom widget inside the slider (gets a slider value from the callback)
                      return Center(
                          child: Container(
                        height: 100,
                        width: 200,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            "${second}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 60,
                                color: Colors.green),
                          ),
                        ),
                      ));
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ExercisePerformance(
                                exercisesModel: widget.exercisesModel,
                                second: second,
                              )));
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text("START"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
