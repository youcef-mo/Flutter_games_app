import 'package:flutter/material.dart';
import 'package:games_mix/models/game.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import 'my_drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Games Mix"),
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
      ),
      drawer: DrawerPage(),
      body: SafeArea(
        child: Column(
          children: [Expanded(child: glass())],
        ),
      ),
    );
  }

  Widget glass() {
    return GlassmorphicContainer(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      borderRadius: 0,
      blur: 7,
      alignment: Alignment.bottomCenter,
      border: 0,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.lightBlueAccent,
            Colors.cyanAccent[400],
          ],
          stops: [
            0.2,
            1,
          ]),
      borderGradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Color(0xFF4579C5).withAlpha(100),
            Color(0xFFFFFFF).withAlpha(55),
            Color(0xFFF75035).withAlpha(10),
          ],
          stops: [
            0.06,
            0.95,
            1
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Active Games",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: buildTextField(),
          ),
          Expanded(child: gamesList())
        ],
      ),
    );
  }

  Widget gamesList() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.separated(
        itemCount: 3,
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 30,
          thickness: 0,
          color: Colors.transparent,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(5),
            height: 90,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 15),
                  blurRadius: 17,
                  spreadRadius: -23,
                ),
              ],
            ),
            child: ListTile(
              isThreeLine: true,
              leading: Image.asset(
                games[index].image,
                fit: BoxFit.cover,
                height: 70,
              ),
              title: Text(
                games[index].title,
                style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: Text(
                games[index].value.toString() + ' %',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ps4 version"),
                  SizedBox(
                    height: 10,
                  ),
                  FAProgressBar(
                    size: 15,
                    currentValue: games[index].value.toInt(),
                    progressColor: Colors.cyanAccent,
                    borderRadius: 15,
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }

  Widget buildTextField() {
    return Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            Colors.white70,
            Colors.cyanAccent[100],
          ],
        ),
      ),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: "Search ",
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
          suffixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
        ),
      ),
    );
  }
}
