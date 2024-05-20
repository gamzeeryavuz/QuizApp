import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/data/data.dart';
import 'package:quiz/model/model.dart';
import 'package:quiz/screens/category_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.indigo,
                  Colors.purple,
                ])),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Test Your Skills",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Prepare yourself for any test",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white60,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Data.category.length,
                      padding: EdgeInsets.all(20),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              (MediaQuery.of(context).size.height - 50 - 25) /
                                  (4 * 240),
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        final category = Data.category[index];

                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CategoryScreen(category: category)));
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                          category.image,
                                          height: 100,
                                          width: 100,
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      category.name,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )));
                      },
                    )
                  ]),
            )));
  }
}
