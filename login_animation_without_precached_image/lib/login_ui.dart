import 'package:flutter/material.dart';

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

String imageLink = 'images/default_focus.png';

class _LoginDemoState extends State<LoginDemo> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  int charLength = 0;
  bool val = false;
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  onTap(String value) {
    setState(() {
      imageLink = value;
    });
  }

  onChanged(String value) {
    setState(() {
      charLength = value.length;
      if (charLength == 0) {
        onTap('images/2.png');
      } else if (charLength == 1) {
        onTap('images/3.png');
      } else if (charLength == 2) {
        onTap('images/4.png');
      } else if (charLength == 3) {
        onTap('images/5.png');
      } else if (charLength == 4) {
        onTap('images/6.png');
      } else if (charLength == 5) {
        onTap('images/7.png');
      } else if (charLength == 6) {
        onTap('images/8.png');
      } else if (charLength == 7) {
        onTap('images/9.png');
      } else if (charLength == 8) {
        onTap('images/10.png');
      } else if (charLength == 9) {
        onTap('images/11.png');
      } else if (charLength == 10) {
        onTap('images/12.png');
      } else if (charLength == 11) {
        onTap('images/13.png');
      } else if (charLength == 12) {
        onTap('images/14.png');
      } else if (charLength == 13) {
        onTap('images/15.png');
      } else if (charLength == 14) {
        onTap('images/16.png');
      } else if (charLength == 15) {
        onTap('images/17.png');
      } else if (charLength == 16) {
        onTap('images/18.png');
      } else if (charLength == 17) {
        onTap('images/19.png');
      } else if (charLength == 18) {
        onTap('images/20.png');
      } else if (charLength == 19) {
        onTap('images/21.png');
      } else if (charLength == 20) {
        onTap('images/22.png');
      } else if (charLength == 21) {
        onTap('images/23.png');
      } else if (charLength == 22) {
        onTap('images/24.png');
      } else {
        onTap('images/24.png');
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
                    backgroundImage: AssetImage(imageLink),
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
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Color(0XFFf3fafd),
                      border: Border.all(color: Color(0XFF247295)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      onChanged: onChanged,
                      onTap: () {
                        onTap('images/2.png');
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
                                      onTap('images/password_show.png');
                                    } else {
                                      _toggle();
                                      onTap('images/password_focus.png');
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
                        onTap('images/password_focus.png');
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