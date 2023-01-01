import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../flutter_flow_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:geolocator/geolocator.dart';
import '../profile.dart';
import '../user_homepage.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

void _profile(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
}

void _userhomepage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
}

class UserpostCopyWidget extends StatefulWidget {
  const UserpostCopyWidget({Key? key}) : super(key: key);

  @override
  _UserpostCopyWidgetState createState() => _UserpostCopyWidgetState();
}

class _UserpostCopyWidgetState extends State<UserpostCopyWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ImagePicker picker = ImagePicker();
  XFile? image;
  String? selected_image = 'Upload Image                   ';
  double image_picker_fontsize = 19;
  Icon image_picker_icon = Icon(
    Icons.keyboard_arrow_right,
    color: Color(0xFFA45B5B),
    size: 32,
  );
  String position_button_text = 'Use my location';
  double? latitude;
  double? longitude;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:
            Text('Location services are disabled. Please enable the services.'),
      ));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFE4CDCD),
        appBar: AppBar(
          backgroundColor: Color(0xFF492727),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0, -0.45),
            child: Text(
              'Create Post',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFFEDCDCD),
                fontSize: 22,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 10,
        ),
        body: Column(children: [
          Expanded(
              child: ListView(
            children: [
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 80, 20, 40),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        color: Color(0x50A45B5B),
                        borderRadius: BorderRadius.circular(50),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0.5),
                            child: FFButtonWidget(
                              onPressed: () async {
                                image = await picker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  if (image != null) {
                                    selected_image =
                                        image?.path.split("/").last.toString();
                                    image_picker_fontsize = 9;
                                    image_picker_icon = Icon(
                                      Icons.add_task_rounded,
                                      color: Color(0xFFA45B5B),
                                      size: 32,
                                    );
                                  }
                                  ;
                                });
                              },
                              text: selected_image != null
                                  ? selected_image as String
                                  : 'Upload Image                   ',
                              options: FFButtonOptions(
                                width: 500,
                                height: 60,
                                color: Color(0x50A45B5B),
                                textStyle: GoogleFonts.getFont(
                                  'Poppins',
                                  color: Color(0xFF492727),
                                  fontSize: image_picker_fontsize,
                                  fontWeight: FontWeight.w500,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 50,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.90, 0.1),
                            child: image_picker_icon,
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.87, 0),
                            child: Icon(
                              Icons.add_a_photo,
                              color: Color(0xFF492727),
                              size: 24,
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
                  child: TextFormField(
                    controller: textController1,
                    autocorrect: true,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      hintStyle: GoogleFonts.getFont(
                        'Poppins',
                        color: Color(0xFF39D2C0),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF492727),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF492727),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    style: TextStyle(fontFamily: 'Poppins', height: 1),
                    maxLines: null,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
                child: TextFormField(
                  controller: textController2,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Reference Number',
                    hintStyle: GoogleFonts.getFont(
                      'Poppins',
                      color: Color(0xFF39D2C0),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF492727),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF492727),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    height: 1,
                  ),
                  maxLines: null,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
                child: TextFormField(
                  controller: textController3,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintStyle: GoogleFonts.getFont(
                      'Poppins',
                      color: Color(0xFF39D2C0),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF492727),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF492727),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    height: 1.7,
                  ),
                  maxLines: null,
                  minLines: 3,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: EdgeInsets.all(15),
                    child: TextButton(
                      onPressed: () {
                        return;
                      },
                      child: InkWell(
                        onTap: () async {
                          if (latitude == null) {
                            setState(() {
                              position_button_text = "Getting location...";
                            });
                            await _getCurrentPosition();
                            setState(() {
                              if (latitude != null) {
                                position_button_text =
                                    "Location selected. Tap to view";
                              } else {
                                position_button_text = "Use my location";
                              }
                            });
                          } else {
                            launchUrl(Uri.parse(
                                "https://google.com/maps/search/?api=1&query=$latitude,$longitude"));
                          }
                        },
                        child: Container(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          decoration: BoxDecoration(
                              color: Color(0xFFAD8873),
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.transparent, width: 1),
                                  bottom: BorderSide(
                                      color: Colors.transparent, width: 1),
                                  left: BorderSide(
                                      color: Colors.transparent, width: 1),
                                  right: BorderSide(
                                      color: Colors.transparent, width: 1)),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 0.1,
                                    spreadRadius: 0.1)
                              ]),
                          child: Text(
                            position_button_text,
                            style: GoogleFonts.getFont(
                              'Poppins',
                              color: Color(0xFF492727),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FFButtonWidget(
                  onPressed: () {
                    // code to post
                  },
                  text: "Create post",
                  options: FFButtonOptions(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    color: Color(0xFFAD8873),
                    textStyle: GoogleFonts.getFont(
                      'Poppins',
                      color: Color(0xFF492727),
                      fontWeight: FontWeight.w500,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 30,
                  ),
                ),
              ),
            ],
          ))
        ]),
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
