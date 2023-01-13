import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/helper/sharedprefhelp.dart';

import 'login.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(30),
            color: Colors.cyan,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 40, bottom: 15),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage("https://cdn-icons-png.flaticon.com/512/64/64572.png"),
                        fit: BoxFit.fill),

                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile',
            style: TextStyle(
              fontSize: 18
            ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings',
              style: TextStyle(
                  fontSize: 18
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text('Sign Out',
              style: TextStyle(
                  fontSize: 18
              ),
            ),
              onTap: ()async {
                await FirebaseAuth.instance.signOut().then((value) async
                {
                  await SharedprefFunction.saveLogInStatus(false);
                  await SharedprefFunction.saveUserEmail("");
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()), (route)=>false);
                });
              })
        ],
      ),
    );
  }
}
