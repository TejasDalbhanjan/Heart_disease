import 'package:flutter/material.dart';

class Registraion extends StatefulWidget {
  @override
  _RegistraionState createState() => _RegistraionState();
}

class _RegistraionState extends State<Registraion> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phoneno = TextEditingController();
  TextEditingController _confirmpassController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      key: _scaffoldkey,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0XFFF95A3B), const Color(0XFFF96713)],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              stops: [0.0, 0.8],
              tileMode: TileMode.mirror),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PhysicalModel(
              elevation: 40.0,
              shadowColor: Colors.pink,
              color: Colors.black,
              child: Container(
                color: Colors.redAccent[100],
                child: Form(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextFormField(
                          controller: _name,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Name",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            labelStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter full name!';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: TextFormField(
                          controller: _phoneno,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Phone Number",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            labelStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Number!';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: TextFormField(
                          controller: _passController,
                          validator: (value) {
                            if (value.isEmpty || value.length < 8) {
                              return 'Enter Valid password !';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => node.nextFocus(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            labelText: "Password",
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            labelStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                          obscureText: true,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: TextFormField(
                          controller: _confirmpassController,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => node.nextFocus(),
                          validator: (String val) {
                            if (val != _passController.text)
                              return "Invalid Password";
                            else
                              return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                          obscureText: true,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: RaisedButton(
                          onPressed: null,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Colors.red,
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          disabledColor: Colors.red,
                          focusElevation: 9,
                          textColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
