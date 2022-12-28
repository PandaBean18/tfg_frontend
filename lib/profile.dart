import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFE4CDCD),
        appBar: AppBar(
          title: Text(
            'T.E.S.F',
            style: TextStyle(fontFamily: 'Arial Rounded MT Bold'),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(228, 205, 205, 0.75),
          foregroundColor: Colors.black,
          shadowColor: Colors.black,
          elevation: 20,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn.discordapp.com/attachments/1033448117703561326/1033448248385478738/AppBackground.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, -0.9),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, -0.4),
                          child: Text(
                            '[Name]',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, -0.1),
                          child: Text(
                            '[emial]',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, -0.2),
                          child: Text(
                            '[phone number]',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, -0.3),
                          child: Text(
                            '[user id]',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.82),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: MediaQuery.of(context).size.height * 0.4,
                            decoration: BoxDecoration(
                              color: Color(0x77FFFFFF),
                              // ignore: prefer_const_literals_to_create_immutables
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  color: Color(0x33000000),
                                  offset: Offset(5, 5),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-0.85, -0.9),
                                  child: Text(
                                    'Resolved',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, -0.14),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 2),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: Text(
                                          '[Issue]',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, -0.61),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 2),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                        child: Text(
                                          '[Issue]',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromRGBO(161, 91, 91, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
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
                onPressed: null,
                icon: Icon(Icons.person),
                tooltip: 'Profile',
                iconSize: 36,
              ),
            ],
          ),
        ));
  }
}
