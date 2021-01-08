import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:herewego/pages/home_page.dart';
import 'package:herewego/pages/sing_up.dart';
import 'package:herewego/service/aut_serive.dart';
import 'package:herewego/service/pref_service.dart';
import 'package:herewego/service/utils_serrvice.dart';
class SigInPage extends StatefulWidget {

  static final String id="sign_in";
  @override
  _SigInPageState createState() => _SigInPageState();
}

class _SigInPageState extends State<SigInPage> {
  var emailconroller=TextEditingController();
  var passwordconroller=TextEditingController();

  var isLoading = false;
  doLogin(){
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
      Utils.fireToast("check your email or password");

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
                    onPressed: doLogin,
                    child: Text("Sign In"),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: FlatButton(
                    color: Colors.white,
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, SigUpPage.id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Don't have an account",style: TextStyle(color: Colors.black),),
                        SizedBox(width: 10,),
                        Text("Sign Up",style: TextStyle(color: Colors.black),),
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
