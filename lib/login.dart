import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../admin_homepage.dart';
import '../user_homepage.dart';
//* Login page starts from here. Point to be noted here is
//* once the user enters password for login, user will be checked if it is admin or not,
//* If the user is an admin and the password given is correct, then AdminHomePage will load
//* Else the user is a normal user and the password given is correct, then HomePage will load.

void _adminhomepage(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => AdminHomepage()));
}

void _homepage(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => Homepage()));
}

void loginalert(BuildContext context) {
  final alert = AlertDialog(
    title: const Text('Login Failed'),
    content: const Text('Username or Password was incorrect'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Retry'),
      )
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController loginuserController = TextEditingController();
  TextEditingController loginpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'T.E.S.F Login',
          style: TextStyle(fontFamily: 'Arial Rounded MT Bold'),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(228, 205, 205, 0.75),
        foregroundColor: Colors.black,
        shadowColor: Colors.black,
        elevation: 20,
      ),
      body: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.discordapp.com/attachments/1033448117703561326/1033448248385478738/AppBackground.png'),
                fit: BoxFit.cover)),
        child: PhysicalModel(
          color: Colors.transparent,
          shadowColor: Colors.black,
          elevation: 20,
          child: Container(
            width: 350,
            height: 300,
            decoration: BoxDecoration(
                color: Color.fromRGBO(228, 205, 205, 0.75),
                borderRadius: BorderRadius.circular(15)),
            child: ListView(children: [
              Container(
                alignment: Alignment.center,
                width: 200,
                height: 50,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(161, 91, 91, 0.75)),
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 24,
                    fontFamily: 'Arial Rounded MT Bold',
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  controller: loginuserController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0)),
                    labelText: 'Username',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: TextFormField(
                  controller: loginpassController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0)),
                    labelText: 'Password',
                  ),
                ),
              ),
              TextButton(
                  onPressed: () async {
                    var url = Uri.parse(
                        'https://daybreaklimit.herokuapp.com/auth/login');

                    var response = await http.post(url, body: {
                      'user[username]': loginuserController.text,
                      'user[password]': loginpassController.text,
                    });

                    if (response.statusCode == 200) {
                      var decResponse = jsonDecode(response.body);
                      var tokenvalue = decResponse['token'];
                      var refreshtokenvalue = decResponse['refresh_token'];
                      print(tokenvalue);
                      print(refreshtokenvalue);

                      var authurl = Uri.parse(
                          'https://daybreaklimit.herokuapp.com/users/me');

                      var authresponse = await http.get(authurl,
                          headers: {"Authorization": "$tokenvalue"});

                      if (authresponse.statusCode == 200) {
                        var authadmin = jsonDecode(authresponse.body);
                        var user = authadmin['user'];
                        var authuser = user['admin'];
                        print(authuser);

                        if (authuser == true) {
                          return _adminhomepage(context);
                        } else {
                          return _homepage(context);
                        }
                      }
                      print(authresponse.body);
                    }
                    if (response.statusCode == 401) {
                      print(response.body);
                      return loginalert(context);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 50,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(161, 91, 91, 0.75),
                    ),
                    child: Text(
                      'Proceed',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Arial Rounded MT Bold',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
