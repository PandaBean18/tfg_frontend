import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flutter_flow_widgets.dart';

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
      body: SafeArea(
          child: Expanded(
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
                      alignment: AlignmentDirectional(-0.6, -0.05),
                      child: Text(
                        'Upload Image',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF492727),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.92, 0),
                      child: Icon(
                        Icons.photo_camera,
                        color: Color(0xFF492727),
                        size: 24,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.75, 0),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFFA45B5B),
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 1),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
              child: TextFormField(
                controller: textController1,
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
          Expanded(
            child: Align(
              alignment: AlignmentDirectional(0, -0.8),
              child: FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Create Post',
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
          ),
        ],
      ))),
    );
  }
}
