import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:herewego/pages/signin_page.dart';
import 'package:herewego/service/pref_service.dart';

class AuthService{
  static final _auth=FirebaseAuth.instance;//bu orqali firebase funksiyalarini auth ichiga joylaymiz

  static Future<FirebaseUser> signInUser(BuildContext context ,String email,String password) async{
    try{
      _auth.signInWithEmailAndPassword(email:email,password:password);
      final FirebaseUser firebaseUser=await _auth.currentUser();
      print(firebaseUser.toString());
      return firebaseUser;

    }catch(e){print(e);}
    return null;
}
 //__________
  static Future<FirebaseUser> signUpUser(
      BuildContext context ,String fullname,String email,String password) async{
    try{
      AuthResult authResult= await _auth.createUserWithEmailAndPassword(email:email,password:password);
      final FirebaseUser firebaseUser=authResult.user;
      print(firebaseUser.toString());
      return firebaseUser;

    }catch(e){print(e);}
    return null;
  }
 //________________
  static void signOutUser(BuildContext context ) async{

      _auth.signOut();
      Prefs.removeUserId().then((value) {
        Navigator.pushReplacementNamed(context, SigInPage.id);
      });


    }

}