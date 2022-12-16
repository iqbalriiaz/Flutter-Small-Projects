import 'package:fitness_app/screens/exercise_categories.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/home_page_image.png"),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    color: Colors.white,
                    child: Text("মহিলা",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 40)),
                  ),
                  Container(
                    height: 50,
                    color: Colors.green,
                    child: Text("Fitness",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("Keeps you fit everyday.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  )),

            ],
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>
          ExerciseCategories())
        );
      },
      backgroundColor: Colors.green,
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
