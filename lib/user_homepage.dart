import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../user_post.dart';
import '../profile.dart';

void _profile(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
}

void _userhomepage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFE4CDCD),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UserpostCopyWidget())); //replace with posts screen
              },
              icon: Icon(Icons.post_add),
              iconSize: 36,
              tooltip: 'Help Post',
            )
          ],
          title: Text('Home'),
          centerTitle: true,
          backgroundColor: Color(0xff492727),
          foregroundColor: Color(0xFFEDCDCD),
          shadowColor: Colors.black,
          elevation: 20,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: ListView(children: [
                  for (int i = 0; i < 4; i++)
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      Container(
                        height: 10,
                      ),
                      Container(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Image.network(
                                'https://picsum.photos/seed/605/600',
                                width: MediaQuery.of(context).size.width,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                      Container(
                        alignment: Alignment.topCenter,
                        height: 160,
                        child: Container(
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 600,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Color(0x50FFFFFF),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(5),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Heading',
                                            style: GoogleFonts.getFont(
                                              'Montserrat',
                                              color: Color(0xFFA45B5B),
                                              fontSize: 29,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )),
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Description',
                                            style: GoogleFonts.getFont(
                                              'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ])

                  // Expanded(
                  //   child: Align(
                  //     alignment: AlignmentDirectional(0, -6.88),
                  //     child: Image.network(
                  //       'https://picsum.photos/seed/605/600',
                  //       width: 600,
                  //       height: 200,
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Align(
                  //     alignment: AlignmentDirectional(0, -3.05),
                  //     child: Container(
                  //       width: 600,
                  //       height: 150,
                  //       decoration: BoxDecoration(
                  //         color: Color(0x50FFFFFF),
                  //         borderRadius: BorderRadius.only(
                  //           bottomLeft: Radius.circular(50),
                  //           bottomRight: Radius.circular(5),
                  //           topLeft: Radius.circular(0),
                  //           topRight: Radius.circular(0),
                  //         ),
                  //       ),
                  //       child: Align(
                  //         alignment: AlignmentDirectional(0, 0.1),
                  //         child: Stack(
                  //           children: [
                  //             Align(
                  //               alignment: AlignmentDirectional(-0.9, -0.3),
                  //               child: Text(
                  //                 'Heading',
                  //                 style: GoogleFonts.getFont(
                  //                   'Montserrat',
                  //                   color: Color(0xFFA45B5B),
                  //                   fontSize: 29,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ),
                  //             Align(
                  //               alignment: AlignmentDirectional(-0.9, 0.15),
                  //               child: Text(
                  //                 'description',
                  //                 style: GoogleFonts.getFont(
                  //                   'Poppins',
                  //                   fontSize: 16,
                  //                   fontWeight: FontWeight.normal,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Align(
                  //     alignment: AlignmentDirectional(0, -6.88),
                  //     child: Image.network(
                  //       'https://picsum.photos/seed/605/600',
                  //       width: 600,
                  //       height: 200,
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Align(
                  //     alignment: AlignmentDirectional(0, -3.05),
                  //     child: Container(
                  //       width: 600,
                  //       height: 150,
                  //       decoration: BoxDecoration(
                  //         color: Color(0x50FFFFFF),
                  //         borderRadius: BorderRadius.only(
                  //           bottomLeft: Radius.circular(50),
                  //           bottomRight: Radius.circular(5),
                  //           topLeft: Radius.circular(0),
                  //           topRight: Radius.circular(0),
                  //         ),
                  //       ),
                  //       child: Align(
                  //         alignment: AlignmentDirectional(0, 0.1),
                  //         child: Stack(
                  //           children: [
                  //             Align(
                  //               alignment: AlignmentDirectional(-0.9, -0.3),
                  //               child: Text(
                  //                 'Heading',
                  //                 style: GoogleFonts.getFont(
                  //                   'Montserrat',
                  //                   color: Color(0xFFA45B5B),
                  //                   fontSize: 29,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ),
                  //             Align(
                  //               alignment: AlignmentDirectional(-0.9, 0.15),
                  //               child: Text(
                  //                 'description',
                  //                 style: GoogleFonts.getFont(
                  //                   'Poppins',
                  //                   fontSize: 16,
                  //                   fontWeight: FontWeight.normal,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ]))
              ],
            ),
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
