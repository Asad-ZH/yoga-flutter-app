import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  FlexibiltyEssentials extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  String name = "";

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title:Image.network(
            'https://github.com/Asad-ZH/yoga-flutter-app/blob/main/myandroidapp/assets/appbarlogo.jpg?raw=true',
            fit: BoxFit.contain,
            height: 50,
          ),

        ),
        body:Stack(
            children:[
              Container(
                decoration: BoxDecoration(color: Colors.black),
              ),


              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8eW9nYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
                      ),
                      fit: BoxFit.cover,
                    )),
                height: MediaQuery.of(context).size.height * 0.25,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.fromLTRB(0,
                    MediaQuery.of(context).size.width * 0.05,0,
                    0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Flexibility Essentials", style: TextStyle(color: Colors.white,fontSize: 24)),
                    SizedBox(height: 20,),
                    Text("This routine is design to Stretch little bit of everything ",style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.green.withOpacity(0.4)),
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(const Radius.circular(8))
                ),

                height: MediaQuery.of(context).size.height * 0.26,
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    MediaQuery.of(context).size.width * 0.6,
                    MediaQuery.of(context).size.width * 0.05,
                    0),
                child: ListView(

                  scrollDirection: Axis.vertical,
                  children: [
                    ListTile(
                      leading: Icon(Icons.alarm_rounded, color: Colors.white),
                      title:Text('Duration',style: TextStyle(color: Colors. white),),
                      onTap: () =>null,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.fitness_center, color: Colors.white),
                      title:Text('Difficulty',style: TextStyle(color: Colors. white),),
                      onTap: () =>null,
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.audiotrack_outlined, color: Colors.white),
                      title:Text('Sound',style: TextStyle(color: Colors. white),),

                      onTap: () =>null,
                    ),


                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    height: 500,
                    width: 500,
                  ),
                  ElevatedButton(
                    child: Text('ElevatedButton'),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(4, 254, 179,0.3),
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {},

                  ),



                ],
              ),
            ]
        )
    );
  }
}
