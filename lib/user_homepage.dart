import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../user_post.dart';
import '../profile.dart';

//? Home Page
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UserPost())); //replace with posts screen
            },
            icon: Icon(Icons.post_add),
            iconSize: 36,
            tooltip: 'Help Post',
          )
        ],
        title:
            Text('Home', style: TextStyle(fontFamily: 'Arial Rounded MT Bold')),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(228, 205, 205, 0.75),
        foregroundColor: Colors.black,
        shadowColor: Colors.black,
        elevation: 20,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://cdn.discordapp.com/attachments/1033448117703561326/1033448248385478738/AppBackground.png'),
              fit: BoxFit.cover),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(161, 91, 91, 0.75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.warning_rounded),
              tooltip: 'Notifications',
              iconSize: 36,
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.home_filled),
              tooltip: 'Home',
              iconSize: 36,
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              icon: Icon(Icons.person),
              tooltip: 'Profile',
              iconSize: 36,
            ),
          ],
        ),
      ),
    );
  }
}
