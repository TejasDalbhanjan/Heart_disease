import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _secureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController _phoneNo = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _scaffoldkey,
      body: Container(
        child: Form(
          key: _formKey,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red[50],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(1500),
                        bottomLeft: Radius.circular(1500))),
              ),
              Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.contain,
                    image: new AssetImage(
                      "assets/heart.jfif",
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                    ),
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Heart Disease",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        letterSpacing: 5,
                        wordSpacing: 5,
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Prediction",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        letterSpacing: 5,
                        wordSpacing: 5,
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.height * 0.01,
                        MediaQuery.of(context).size.height * 0.45,
                        MediaQuery.of(context).size.height * 0.01,
                        0),
                    child: TextFormField(
                      maxLength: 10,
                      controller: _phoneNo,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Phone Number",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty || value.length != 10) {
                          return 'Enter correct number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.height * 0.01,
                        0,
                        MediaQuery.of(context).size.height * 0.01,
                        0),
                    child: TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_secureText
                              ? Icons.remove_red_eye
                              : Icons.security),
                          onPressed: () {
                            setState(() {
                              _secureText = !_secureText;
                            });
                          },
                        ),
                      ),
                      obscureText: _secureText,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter correct password';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white),
                      ),
                      onPressed: null,
                      elevation: 10,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                          fontSize: MediaQuery.of(context).size.height * 0.03,
                        ),
                      ),
                      color: Colors.red,
                      highlightColor: Colors.redAccent,
                      height: MediaQuery.of(context).size.height * 0.07,
                      minWidth: MediaQuery.of(context).size.height * 0.4,
                      disabledColor: Colors.red,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: InkWell(
                      focusColor: Colors.red,
                      highlightColor: Colors.red,
                      onTap: null,
                      child: Text(
                        "New Registration",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
