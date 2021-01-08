import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:herewego/pages/home_page.dart';
import 'package:herewego/pages/signin_page.dart';
import 'package:herewego/service/aut_serive.dart';
import 'package:herewego/service/pref_service.dart';
import 'package:herewego/service/utils_serrvice.dart';
class SigUpPage extends StatefulWidget {
  static final String id="sign_up";
  @override
  _SigUpPageState createState() => _SigUpPageState();
}

class _SigUpPageState extends State<SigUpPage> {

  var isLoading = false;
  var fullnameconroller=TextEditingController();
  var emailconroller=TextEditingController();
  var passwordconroller=TextEditingController();
  doSignIn(){
    String fullname=fullnameconroller.text.toString().trim();
    String email=emailconroller.text.toString().trim();
    String password=passwordconroller.text.toString().trim();
    if(email.isEmpty||password.isEmpty) return
      AuthService.signInUser(context, email, password).then((firebaseUser) => {
        _getFirebaseUser(firebaseUser)

      });

  }
  _getFirebaseUser(FirebaseUser firebaseUser) async{
    if(firebaseUser!=null){
      await Prefs.saveUser(firebaseUser.uid);
      Navigator.pushReplacementNamed(context, MyHomePage.id);
    }else{
      Utils.fireToast("check your information");

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: fullnameconroller,
                  decoration: InputDecoration(
                      hintText: "Fullname"
                  ),
                ),
                TextField(
                  controller: emailconroller,
                  decoration: InputDecoration(
                      hintText: "Email"
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: passwordconroller,
                  decoration: InputDecoration(
                      hintText: "Password"
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: FlatButton(
                    color: Colors.red,
                    onPressed: doSignIn,
                    child: Text("Sign In"),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: FlatButton(
                    color: Colors.white,
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, SigInPage.id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("alerady have an account",style: TextStyle(color: Colors.black),),
                        SizedBox(width: 10,),
                        Text("Sign In",style: TextStyle(color: Colors.black),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            isLoading?
            Center(
              child: CircularProgressIndicator(),
            ): SizedBox.shrink(),
          ],
        ),
      ),

    );
  }
}
