import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz/model/model.dart';
import 'package:quiz/screens/home_screen.dart';
import 'package:quiz/screens/quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final int totalQuestions;
  final int totalAttempts;
  final int totalCorrect;
  final int totalScore;
  final QuizSet quizset;

  const ResultScreen(
      {super.key,
      required this.totalQuestions,
      required this.totalAttempts,
      required this.totalCorrect,
      required this.totalScore,
      required this.quizset});

  @override
  Widget build(BuildContext context) {
    String feedBack = totalScore < 30
        ? "You failed !"
        : totalScore < 60
            ? "Good!"
            : totalScore < 80
                ? "Great"
                : "Awesome!";

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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 30,
                            )),
                        Text(" Quiz Result ",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ), 
                  Center(
                    child: Container(  
                      width: MediaQuery.of(context).size.width/1.3,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(  
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child:Column(   
                        children: [   
                          Text(  
                            feedBack,
                            style: TextStyle(   
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("You Have Scored",
                          style:TextStyle(   
                            fontSize:18,
                            fontWeight: FontWeight.w500,
                    
                          )
                          ),
                          SizedBox(height: 10,),
                          Text(  
                            "${totalScore}/${totalQuestions *10 }",
                            style:TextStyle(  
                              fontSize:25,
                              fontWeight: FontWeight.w500,
                              
                            )
                                             ),
                                             SizedBox(height: 50,),
                                             Row(  
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [   
                                                InkWell(  
                                                  onTap: (){
                                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>QuizScreen(quizSet: quizset)));
                                                  },
                                                  child:Container(   
                                                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                                    decoration: BoxDecoration(   
                                                      borderRadius: BorderRadius.circular(10),
                                                      gradient: LinearGradient(
                         begin: Alignment.topCenter,
                         end: Alignment.bottomCenter,
                         colors: [
                         Colors.indigo,
                         Colors.purple,
                         ])         
                                                    ), 
                                                    child:Text(   
                                                      "Repeat",
                                                      style:TextStyle(  
                                                        color:Colors.white,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w500
                                                      )
                                                    )
                                                  )
                                                ) ,
                                                InkWell(  
                                                  onTap: (){
                                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
                                                  },
                                                  child:Container(   
                                                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                                    decoration: BoxDecoration(   
                                                      borderRadius: BorderRadius.circular(10),
                                                      gradient: LinearGradient(
                         begin: Alignment.topCenter,
                         end: Alignment.bottomCenter,
                         colors: [
                         Colors.indigo,
                         Colors.purple,
                         ])         
                                                    ), 
                                                    child:Text(   
                                                      "Home ",
                                                      style:TextStyle(  
                                                        color:Colors.white,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w500
                                                      )
                                                    )
                                                  )
                                                ) ,

                                              ],
                                             )
                        ],
                      )
                    ),
                  )
                ])));
  }
}
