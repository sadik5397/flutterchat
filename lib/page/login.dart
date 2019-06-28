import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class UserDetails {
  String proveiderDetails;
  String userName;
  String photoUrl;
  String userEmail;
  List<ProviderDetails> providerData;

  UserDetails(this.proveiderDetails, this.userName, this.photoUrl,
      this.userEmail, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);

  String providerDetails;
}

class _LoginState extends State<Login> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser> signIn(BuildContext context) async {
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    FirebaseUser userDetails =
        await firebaseAuth.signInWithCredential(credential);
    ProviderDetails providerInfo = ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerData = List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = UserDetails(
        userDetails.providerId,
        userDetails.displayName,
        userDetails.photoUrl,
        userDetails.email,
        providerData);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Profile(detailsUser: details,),
        ));
    return userDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text("Push Me"),
            color: Colors.teal,
            textColor: Colors.white,
            onPressed: () => signIn(context)
                .then((FirebaseUser user) => print(user))
                .catchError((e) => print(e)),
          ),
        ),
      ),
    );
  }
}
