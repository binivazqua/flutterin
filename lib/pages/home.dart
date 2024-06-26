import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterin/components/drProfile.dart';
import 'package:flutterin/components/utils.dart';
import 'package:flutterin/models/colorConstants.dart';
import 'package:flutterin/pages/subs/moodQuest.dart';
import 'package:flutterin/pages/subs/moodTracker.dart';
import 'package:flutterin/pages/user.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final _textController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;
  String myWord = 'New Word';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: SafeArea(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            // user app bar
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Yomogi'),
                  ),
                  Text('${user!.email}',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Jua',
                          fontWeight: FontWeight.w100)),
                ],
              ),
              IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(Icons.arrow_circle_right_rounded),
                iconSize: 40,
              )
              /*
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.pink[100],
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()));
                        },
                        icon: Icon(Icons.person))),
              ],
              */
            ]),

            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: colorConstants.orangito,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(children: [
                Container(
                  child: Icon(Icons.question_mark_rounded,
                      color: colorConstants.deepPurple, size: 80),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: colorConstants.fuxiaPurple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 25),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('How are you feeling?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Urbanist')),
                        Text(
                          'Track your mood now.',
                          style: TextStyle(fontFamily: 'Urbanist'),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => moodQuest()));
                          },
                          child: Text('Go!'),
                        ),
                        /*
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => moodTrackerPage()));
                            },
                            child: Text('Tracker')),*/
                      ]),
                ),
              ]),
            ),
            // card
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.tag_faces_outlined),
                    suffixIcon: IconButton(
                        onPressed: _wordOfTheDay, icon: Icon(Icons.add)),
                    border: InputBorder.none,
                    hintText: 'My positive word of the day...',
                    hintStyle: TextStyle(
                      fontSize: 13,
                    )),
              ),
            ),
            // horizontal listview --> type of professional
            SizedBox(height: 25),

            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  utilContainer(text: myWord, color: Colors.orange),
                  utilContainer(text: 'Love', color: Colors.purple),
                  utilContainer(text: 'Affection', color: Colors.yellow),
                  utilContainer(text: 'Confidence', color: Colors.grey),
                ],
              ),
            ),

            SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Nuestros especialistas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )),
                Text('Ver todos',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                    )),
              ],
            ),

            Expanded(
                child: SizedBox(
                    child: ListView(
              children: [
                drProfileCard(
                    drname: 'Dr. Francisco Mares',
                    score: '4',
                    color: colorConstants.fuxiaPurple),
                SizedBox(
                  height: 15,
                ),
                drProfileCard(
                    drname: 'Dr. Daniel César',
                    score: '4',
                    color: colorConstants.lightPeriwinkle),
                SizedBox(
                  height: 15,
                ),
                drProfileCard(
                    drname: 'Dr. Tyler Jones',
                    score: '4',
                    color: colorConstants.deepPurple),
                SizedBox(
                  height: 15,
                ),
                drProfileCard(
                    drname: 'Dr. Mac Millan',
                    score: '4',
                    color: colorConstants.pinky),
                SizedBox(
                  height: 15,
                )
              ],
            )))
          ]),
        ),
      ),
    );
  }

  void _wordOfTheDay() {
    setState(() {
      myWord = _textController.text;
    });
  }
}

/*
Expanded(
                child: SizedBox(
              width: 400,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  drProfileCard(
                    drname: 'Dra. Ana Zarza',
                    score: '5',
                  ),
                  drProfileCard(
                    drname: 'Dra. Karen Díaz',
                    score: '4',
                  ),
                  drProfileCard(
                    drname: 'Dr. Victor Salas',
                    score: '3',
                  ),
                  drProfileCard(
                    drname: 'Dr. Héctor Soto',
                    score: '4',
                  ),
                ],
              ),
            )),
*/

/*

child: ListView.separated(
                itemBuilder: (context, index) {
                  return drProfileCard(
                      drname: 'djkce',
                      score: '4',
                      color: colorConstants.periwinkle), 
                      drProfileCard(
                      drname: 'djkce',
                      score: '4',
                      color: colorConstants.periwinkle);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: 4,
              ),

*/