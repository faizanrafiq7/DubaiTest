import 'package:dubaietest/Screens/Home_Screen.dart';
import 'package:dubaietest/Widgets/Terms&ConditionsWidgets.dart';
import 'package:dubaietest/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../const.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _load = true;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  handleSignIn(GoogleSignInAccount user) async {
    if (user != null) {
      await NetworkHelper().post(name: user.displayName, userEmail: user.email);
      navigate(context, HomeScreen());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account);
    }).catchError((err) {
      setState(() {
        _load = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    h = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;

    w = mediaQuery.size.width -
        mediaQuery.padding.left -
        mediaQuery.padding.right;

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.black, Colors.black.withOpacity(0.9)]),
      ),
      child: Center(
        child: _load
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Faizan Rafiq',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 37,
                    ),
                  ),
                  Text(
                    'Employment Test',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.08,
                  ),
                  Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Container(
                    margin: const EdgeInsets.all(18.0),
                    height: h * 0.05,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        GoogleSignInAccount user = await googleSignIn.signIn();

                        if (user != null) {
                          handleSignIn(user);
                        }
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                height: h * 0.025,
                                image: AssetImage(
                                  'assets/images/google.png',
                                )),
                            SizedBox(
                              width: w * 0.03,
                            ),
                            Text(
                              'Sign In with Google',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TermsWidget()
                ],
              ),
      ),
    ));
  }
}
