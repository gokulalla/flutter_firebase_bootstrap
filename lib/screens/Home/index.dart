import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  HomeScreenState createState() => new HomeScreenState();

}

class HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text('Pro Sequence')),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, "/Login");
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: Column(
              children: <Widget>[

                Center(
                  child: RaisedButton(
                      onPressed: () => Navigator.pushNamed(context, "/Join"),
                      child: Text('Join Room')
                  ),
                ),


              ],
            )
        )
    );
  }
}