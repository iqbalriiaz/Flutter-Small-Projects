import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Image> images = [
  Image.asset("images/img1.png"),
  Image.asset("images/img2.png"),
  Image.asset("images/img3.png"),
  Image.asset("images/img4.png"),
  Image.asset("images/img5.png"),
  Image.asset("images/img6.png"),
  Image.asset("images/img7.png"),
  Image.asset("images/img8.png"),
  Image.asset("images/img9.png"),
];

final List<String> productName = [
  "Gold Earrings",
  "Bangle",
  "Silver Earrings",
  "Ring",
  "Crown",
  "Necklace set",
  "Silver Necklace",
  "Gold Earrings",
  "Bangle"
];

final List<String> productPrice = [
  "\$900",
  "\$500",
  "\$700",
  "\$500",
  "\$300",
  "\$250",
  "\$300",
  "\$100",
  "\$200",
];

class _HomePageState extends State<HomePage> {
  int selectedGridItem = -1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 242, 230),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hey Riaz",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        color: Color.fromARGB(255, 226, 223, 223),
                        child: Stack(
                          children: [
                            Icon(
                              Icons.notifications_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(top: 5),
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffc32c37),
                                    border: Border.all(
                                        color: Colors.white, width: 1)),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Let's Make A Bid !",
                    style: TextStyle(color: Color.fromARGB(255, 128, 127, 127)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        // optional flex property if flex is 1 because the default flex is 1
                        flex: 8,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true, //<-- SEE HERE
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: 'Search Items',
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        flex: 1,
                        child: Container(
                            height: 58,
                            width: double.infinity,
                            decoration: BoxDecoration(color: Colors.black),
                            child: Icon(
                              Icons.multiple_stop,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 158, 122, 2)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: Color.fromARGB(255, 238, 224, 191),
                          height: 150,
                          width: 100,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 80,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: images[index].image,
                                        fit: BoxFit.scaleDown),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${productName[index]}",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending Auctions",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 158, 122, 2)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: images.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 17,
                        mainAxisSpacing: 17,
                        childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGridItem = index;
                            });
                          },
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 238, 224, 191),
                                        image: DecorationImage(
                                            image: images[index].image,
                                            fit: BoxFit.scaleDown),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: FavoriteButton(
                                          isFavorite: false,
                                          iconSize: 40,
                                          iconDisabledColor: Colors.white,
                                          valueChanged: (_isFavorite) {}),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  height: 10,
                                  width: double.infinity,
                                  color: Color.fromARGB(255, 223, 207, 157),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${productName[index]}",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        productPrice[index],
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 158, 122, 2)),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
