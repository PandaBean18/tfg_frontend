import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tfg_app/user_homepage.dart';

void _profile(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
}

void _userhomepage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Image.network(
                    'https://cdn.discordapp.com/attachments/985120658193252413/1057599071877079080/wavenorm.png',
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Positioned(
                  top: 105.5,
                  left: (MediaQuery.of(context).size.width / 2) - 70,
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: const Color(0xff4B39EF),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                Positioned(
                  top: 250,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: const Text(
                      'Name',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF492727),
                        fontSize: 35,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 300,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: const Text(
                      'Username',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 350,
                  left: (MediaQuery.of(context).size.width -
                          (MediaQuery.of(context).size.width * 0.9)) /
                      2,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 75,
                      decoration: BoxDecoration(
                          color: Color(0xFFF7F7F7),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  'E-mail',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  'usermail@gmail.com',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
                Positioned(
                  top: 440,
                  left: (MediaQuery.of(context).size.width -
                          (MediaQuery.of(context).size.width * 0.9)) /
                      2,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 75,
                      decoration: BoxDecoration(
                          color: Color(0xFFF7F7F7),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  'Phone number',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  '9999999999',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
                Positioned(
                  top: 525,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: const Text(
                      'Contributions',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xA6492727),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 555,
                    child: Container(
                      height: MediaQuery.of(context).size.height - 620,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: ListView(
                        children: [
                          for (int i = 0; i < 3; i++)
                            Padding(
                                padding: EdgeInsets.all(15),
                                child: Container(
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF6F0F0),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                )),
                        ],
                      ),
                    ))
              ],
            )),
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
                onPressed: () {
                  if (true) {
                    return _userhomepage(context);
                  }
                },
                icon: Icon(Icons.home_filled),
                tooltip: 'Home',
                iconSize: 36,
              ),
              IconButton(
                onPressed: () => _profile(context),
                icon: Icon(Icons.person),
                tooltip: 'Profile',
                iconSize: 36,
              ),
            ],
          ),
        ));
  }
}
