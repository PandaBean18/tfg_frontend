import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../user_homepage.dart';

void _homepage(BuildContext context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => Homepage()));
}

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactnumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      //!Body of Sign In Page
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
            height: 600,
            decoration: BoxDecoration(
                color: Color.fromRGBO(228, 205, 205, 0.75),
                borderRadius: BorderRadius.circular(15)),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 50,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(161, 91, 91, 0.75)),
                  child: Text(
                    'Sign Up',
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
                    controller: fnameController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0)),
                      labelText: 'First Name',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: lnameController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0)),
                      labelText: 'Last Name',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: usernameController,
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
                    controller: passwordController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0)),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: emailController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0)),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextFormField(
                    controller: contactnumberController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0)),
                      labelText: 'Contact Number',
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () async {
                      var url =
                          Uri.parse('https://daybreaklimit.herokuapp.com/user');
                      var response = await http.post(url, body: {
                        'user[first_name]': fnameController.text,
                        'user[last_name]': lnameController.text,
                        'user[username]': usernameController.text,
                        'user[password]': passwordController.text,
                        'user[mail]': emailController.text,
                        'user[phone]': contactnumberController.text,
                      });
                      if (response.statusCode == 200) {
                        print(response.body);
                        return _homepage(context);
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: TextButton(onPressed: null, child: Text('Forgot Password?')),
      ),
    );
  }
}
