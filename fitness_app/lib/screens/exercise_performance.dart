import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../models/exercises.dart';

class ExercisePerformance extends StatefulWidget {
  const ExercisePerformance(
      {Key? key, this.exercisesModel, required this.second})
      : super(key: key);

  final ExercisesModel? exercisesModel;
  final int second;

  @override
  State<ExercisePerformance> createState() => _ExercisePerformanceState();
}

class _ExercisePerformanceState extends State<ExercisePerformance> {
  final CountDownController _controller = CountDownController();

  // bool _isPause = false;

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
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const SizedBox(
                      //   width: 30,
                      // ),
                      // _button(title: "Start", onPressed: () => _controller.start()),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      _button(title: "Pause", onPressed: () => _controller.pause()),
                      const SizedBox(
                        width: 10,
                      ),
                      _button(title: "Resume", onPressed: () => _controller.resume()),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      // _button(
                      //     title: "Restart",
                      //     onPressed: () => _controller.restart(duration: widget.second))
                    ],
                  ),
                  CircularCountDownTimer(
                    duration: widget.second,
                    initialDuration: 0,
                    controller: _controller,
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 5,
                    ringColor: Colors.grey[300]!,
                    ringGradient: null,
                    fillColor: Colors.lightGreen,
                    fillGradient: null,
                    backgroundColor: Colors.green,
                    backgroundGradient: null,
                    strokeWidth: 12.0,
                    strokeCap: StrokeCap.round,
                    textStyle: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textFormat: CountdownTextFormat.S,
                    isReverse: false,
                    isReverseAnimation: false,
                    isTimerTextShown: true,
                    autoStart: true,
                    onStart: () {
                      debugPrint('Countdown Started');
                    },
                    onComplete: () {
                      debugPrint('Countdown Ended');

                      Alert(
                        context: context,
                        style: alertStyle,
                        type: AlertType.success,
                        title: "You have completed",
                        desc: "${widget.exercisesModel!.title}",
                        buttons: [
                          DialogButton(
                            onPressed: () => Navigator.pop(context),
                            color: Colors.green,
                            radius: BorderRadius.circular(0.0),
                            child: Text(
                              "Done",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ).show();
                    },
                    onChange: (String timeStamp) {
                      debugPrint('Countdown Changed $timeStamp');
                    },
                    // timeFormatterFunction:
                    //     (defaultFormatterFunction, duration) {
                    //   if (duration.inSeconds == widget.second) {
                    //     return "Done";
                    //   } else {
                    //     return Function.apply(
                    //         defaultFormatterFunction, [duration]);
                    //   }
                    // },
                  ),
                ],
              ),
            ),


            Expanded(
              flex: 4,
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: "${widget.exercisesModel!.gif}",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fitWidth,
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
              ),
            ),





            // FloatingActionButton.extended(
            //          onPressed: (){
            //            setState(() {
            //              if(_isPause){
            //                _isPause = false;
            //                _controller.resume();
            //              }else{
            //                _isPause = true;
            //                _controller.pause();
            //              }
            //            });
            //          },
            //          icon: Icon(_isPause ? Icons.play_arrow : Icons.pause),
            //          label: Text(_isPause ? 'Resume' : 'Pause'),
            //        ),
          ],
        ),
      ),
    );
  }

  var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    descTextAlign: TextAlign.start,
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.green,
    ),
    alertAlignment: Alignment.center,
  );

  Widget _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}
