import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'main.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Settings"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Settings()),
              );
            },
          ),
        ],
      ),
      body:Stack(
        children:[
        Container(
            decoration: BoxDecoration(color: Colors.black),
        ),

         Container(
           decoration: BoxDecoration(
               border: Border.all(width: 1, color: Colors.green.withOpacity(0.4)),
               color: Colors.grey.withOpacity(0.2),
               borderRadius: const BorderRadius.all(const Radius.circular(8))
           ),
          height: 285,
          margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.1,
              MediaQuery.of(context).size.width * 0.05,
              MediaQuery.of(context).size.width * 0.1,
              0),
            child: ListView(

              scrollDirection: Axis.vertical,
              children: [
                ListTile(
                  leading: Icon(Icons.account_circle_outlined, color: Colors.white),
                  title:Text('Edit Profile',style: TextStyle(color: Colors. white),),
                  onTap: () =>null,
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.alarm_rounded, color: Colors.white),
                  title:Text('Reminders',style: TextStyle(color: Colors. white),),
                  onTap: () =>null,
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.audiotrack_outlined, color: Colors.white),
                  title:Text('Sound',style: TextStyle(color: Colors. white),),

                  onTap: () =>null,
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.add_circle_outline_rounded, color: Colors.white),
                  title:Text('About BlackStone',style: TextStyle(color: Colors. white),),
                  onTap: () =>null,
                ),

            ],
          ),
        )
        ]
      )
    );
  }
}
