import 'package:flutter/material.dart';

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {

  bool _obscureText = true;
  bool rememberObscureState = true;
  int charLength = 0;
  bool val = false;


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Image dynamicImage = Image.asset('images/default_focus.png');

  late Image defaultFocus;
  late Image passwordShow;
  late Image passwordFocus;
  late Image image2;
  late Image image3;
  late Image image4;

  late Image image5;
  late Image image6;
  late Image image7;
  late Image image8;
  late Image image9;
  late Image image10;
  late Image image11;
  late Image image12;
  late Image image13;
  late Image image14;
  late Image image15;
  late Image image16;
  late Image image17;
  late Image image18;
  late Image image19;
  late Image image20;
  late Image image21;
  late Image image22;
  late Image image23;
  late Image image24;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    defaultFocus = Image.asset('images/default_focus.png');
    passwordShow = Image.asset('images/password_show.png');
    passwordFocus = Image.asset('images/password_focus.png');
    image2 = Image.asset('images/2.png');
    image3 = Image.asset('images/3.png');
    image4 = Image.asset('images/4.png');
    image5 = Image.asset('images/5.png');
    image6 = Image.asset('images/6.png');
    image7 = Image.asset('images/7.png');
    image8 = Image.asset('images/8.png');
    image9 = Image.asset('images/9.png');
    image10 = Image.asset('images/10.png');
    image11 = Image.asset('images/11.png');
    image12 = Image.asset('images/12.png');
    image13 = Image.asset('images/13.png');
    image14 = Image.asset('images/14.png');
    image15 = Image.asset('images/15.png');
    image16 = Image.asset('images/16.png');
    image17 = Image.asset('images/17.png');
    image18 = Image.asset('images/18.png');
    image19 = Image.asset('images/19.png');
    image20 = Image.asset('images/20.png');
    image21 = Image.asset('images/21.png');
    image22 = Image.asset('images/22.png');
    image23 = Image.asset('images/23.png');
    image24 = Image.asset('images/24.png');
  }

  @override
  void didChangeDependencies() {

    precacheImage(dynamicImage.image, context);
    precacheImage(defaultFocus.image, context);
    precacheImage(passwordShow.image, context);
    precacheImage(passwordFocus.image, context);

    precacheImage(image2.image, context);
    precacheImage(image3.image, context);
    precacheImage(image4.image, context);
    precacheImage(image5.image, context);
    precacheImage(image6.image, context);
    precacheImage(image7.image, context);
    precacheImage(image8.image, context);
    precacheImage(image9.image, context);
    precacheImage(image10.image, context);
    precacheImage(image11.image, context);
    precacheImage(image12.image, context);
    precacheImage(image13.image, context);
    precacheImage(image14.image, context);
    precacheImage(image15.image, context);
    precacheImage(image16.image, context);
    precacheImage(image17.image, context);
    precacheImage(image18.image, context);
    precacheImage(image19.image, context);
    precacheImage(image20.image, context);
    precacheImage(image21.image, context);
    precacheImage(image22.image, context);
    precacheImage(image23.image, context);
    precacheImage(image24.image, context);

    super.didChangeDependencies();
  }

  onChanged(String value) {
    setState(() {
      charLength = value.length;
      if (charLength == 0) {
        dynamicImage = defaultFocus;
      } else if (charLength == 1) {
        dynamicImage = image3;
      } else if (charLength == 2) {
        dynamicImage = image4;
      } else if (charLength == 3) {
        dynamicImage = image5;
      } else if (charLength == 4) {
        dynamicImage = image6;
      } else if (charLength == 5) {
        dynamicImage = image7;
      } else if (charLength == 6) {
        dynamicImage = image8;
      } else if (charLength == 7) {
        dynamicImage = image9;
      } else if (charLength == 8) {
        dynamicImage = image10;
      } else if (charLength == 9) {
        dynamicImage = image11;
      } else if (charLength == 10) {
        dynamicImage = image12;
      } else if (charLength == 11) {
        dynamicImage = image13;
      } else if (charLength == 12) {
        dynamicImage = image14;
      } else if (charLength == 13) {
        dynamicImage = image15;
      } else if (charLength == 14) {
        dynamicImage = image16;
      } else if (charLength == 15) {
        dynamicImage = image17;
      } else if (charLength == 16) {
        dynamicImage = image18;
      } else if (charLength == 17) {
        dynamicImage = image19;
      } else if (charLength == 18) {
        dynamicImage = image20;
      } else if (charLength == 19) {
        dynamicImage = image21;
      } else if (charLength == 20) {
        dynamicImage = image22;
      } else if (charLength == 21) {
        dynamicImage = image23;
      } else if (charLength == 22) {
        dynamicImage = image24;
      } else {
        dynamicImage = image24;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  CircleAvatar(
                    radius: 90.0,
                    backgroundImage: dynamicImage.image,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Hello Riaz !',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF217298)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Welcome back, you\'ve been missed!',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF217298)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10,right:10),
                    decoration: BoxDecoration(
                      color: Color(0XFFf3fafd),
                      border: Border.all(color: Color(0XFF247295)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      onChanged: onChanged,
                      onTap: () {
                        dynamicImage = defaultFocus;
                        setState(() {});
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: 'email@domain.com',
                          labelStyle:
                              TextStyle(color: Color(0XFF76a7be), fontSize: 18),
                          border: InputBorder.none),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF217298)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                          children: [
                            Checkbox(
                                value: val,
                                onChanged: (value) {
                                  setState(() {
                                    if (val = value!) {
                                      _toggle();
                                      dynamicImage = passwordShow;

                                      setState(() {
                                        rememberObscureState = false;
                                        print(rememberObscureState);
                                      });
                                    } else {
                                      _toggle();
                                      dynamicImage = passwordFocus;

                                      setState(() {
                                        rememberObscureState = true;
                                        print(rememberObscureState);
                                      });
                                    }
                                  });
                                }),
                            Text(
                              'Show',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF217298)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Color(0XFFf3fafd),
                      border: Border.all(color: Color(0XFF247295)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      onTap: () {
                        setState(() {
                          print(rememberObscureState);
                          if(rememberObscureState == false){
                            dynamicImage = passwordShow;
                          }
                          else {
                            dynamicImage = passwordFocus;
                          }

                        });

                      },
                      obscureText: _obscureText,
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(color: Color(0XFF76a7be), fontSize: 18),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      width: double.infinity,
                      height: 50,
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        style: OutlinedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Color(0xFF4eb8dd)),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
