import '../flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import '../profile.dart';
import '../user_homepage.dart';

void _profile(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
}

void _userhomepage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
}

class InduvidualpostWidget extends StatelessWidget {
  final int post_id;
  InduvidualpostWidget({Key? key, required this.post_id}) : super(key: key);

  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFE4CDCD),
        appBar: AppBar(
          title: Text('Post'),
          centerTitle: true,
          backgroundColor: Color(0xff492727),
          foregroundColor: Color(0xFFEDCDCD),
          shadowColor: Colors.black,
          elevation: 20,
        ),
        body: SafeArea(
            child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        height: 10,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.all(10),
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0x80FFFFFF),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text(
                                "Heading $post_id",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  color: Color(0xFFA45B5B),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    "https://google.com/maps/search/?api=1&query=22,77"));
                              },
                              child: Container(
                                margin: EdgeInsets.all(20),
                                alignment: Alignment.center,
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Color(0xFFA45B5B),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Icon(
                                              Icons.location_on_outlined,
                                              color: Color(0xFFE4CDCD),
                                            ))),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      width: 150,
                                      child: Text(
                                        "View location",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.getFont(
                                          'Montserrat',
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: 240,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color(0xFFA45B5B),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              'https://cdn.pixabay.com/photo/2017/02/01/22/02/mountain-landscape-2031539__340.jpg',
                              fit: BoxFit.contain,
                            ),
                          )),
                      Container(
                        margin: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 20),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'DESCRIPTION:',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            color: Color(0xFF492727),
                            fontSize: 31,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 20),
                        child: Text(
                          'Hello Everyone, I am a capybara named Max. Our local police station has been really corrupt over the yeara and had kept our family hungry until Inspector Manohar Lal and Commsioner Rowley came in. They have done us a favour by ordering pizza to sustain our species. Please do as they say. Thank you ',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 20),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'POSTED BY:',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  color: Color(0xFFA45B5B),
                                  fontSize: 21,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Max',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  color: Color(0xFF492727),
                                  fontSize: 19,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '@realMax',
                                textAlign: TextAlign.start,
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 20),
                        child: Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'CONTACTS:',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                color: Color(0xFF492727),
                                fontSize: 31,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Column(
                        children: [
                          InkWell(
                              onTap: () {
                                Clipboard.setData(
                                        new ClipboardData(text: "9315755933"))
                                    .then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Phone number copied to your keyboard!')));
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 10, 20),
                                width: 450,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xFF492727),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            20, 5, 0, 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Author | ',
                                              style: GoogleFonts.getFont(
                                                'Montserrat',
                                                color: Color(0xFFE4CDCD),
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              'Max',
                                              style: GoogleFonts.getFont(
                                                'Montserrat',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            )
                                          ],
                                        )),
                                    Container(
                                        alignment: Alignment.centerRight,
                                        width: 200,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Color(0x41A45B5B),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(10, 5, 0, 10),
                                              child: Text('9315755933',
                                                  style: GoogleFonts.getFont(
                                                    'Montserrat',
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  )),
                                            ),
                                            Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFA45B5B),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              child: Icon(
                                                Icons.phone,
                                                size: 30,
                                              ),
                                            ),
                                            //Icon(Icons.phone)
                                          ],
                                        ))
                                  ],
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                Clipboard.setData(
                                        new ClipboardData(text: "9910538215"))
                                    .then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Phone number copied to your keyboard!')));
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 10, 20),
                                width: 450,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xFF492727),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            20, 5, 0, 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Reference',
                                              style: GoogleFonts.getFont(
                                                'Montserrat',
                                                color: Color(0xFFE4CDCD),
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        )),
                                    Container(
                                        alignment: Alignment.centerRight,
                                        width: 200,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Color(0x41A45B5B),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(10, 5, 0, 10),
                                              child: Text('9910538215',
                                                  style: GoogleFonts.getFont(
                                                    'Montserrat',
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  )),
                                            ),
                                            Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFA45B5B),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              child: Icon(
                                                Icons.phone,
                                                size: 30,
                                              ),
                                            ),
                                            //Icon(Icons.phone)
                                          ],
                                        ))
                                  ],
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ))),
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
