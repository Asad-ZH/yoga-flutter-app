import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myandroidapp/main.dart';
import 'package:myandroidapp/sticky_notes.dart';
import 'Fitness_files/flexibilty_essentials.dart';
import 'NavBar.dart';
import 'package:video_player/video_player.dart';

import 'Settings.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController controller;
  late Future<void> initialVideoPlayer;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
      initialVideoPlayer = controller.initialize();
      super.initState();
      controller.setLooping(true);
      controller.setVolume(1.0);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer:NavBar(),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title:Image.network(
          'https://github.com/Asad-ZH/yoga-flutter-app/blob/main/myandroidapp/assets/appbarlogo.jpg?raw=true',
          fit: BoxFit.contain,
          height: 50,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
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


        body: Container(
          decoration: BoxDecoration(color: Colors.black),
          child: SingleChildScrollView(

            child: Column(
              children:[
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.01,
                          MediaQuery.of(context).size.height * 0.02,
                          MediaQuery.of(context).size.width * 0.01,
                          0),
                      child: FutureBuilder(
                        future: initialVideoPlayer,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: 18 / 10,
                              child: VideoPlayer(controller),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.1,
                      bottom: MediaQuery.of(context).size.height * 0.1,
                      child: Center(
                        child: Opacity(
                          opacity: 1.0,
                          child: IconButton(
                            color: Colors.white,
                            iconSize: 60,
                            icon: Icon(controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow),
                            onPressed: () {
                              setState(() {
                                if (controller.value.isPlaying) {
                                  controller.pause();
                                } else {
                                  controller.play();
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.001,
                      left: MediaQuery.of(context).size.width * 0.06,
                      child: IconButton(
                        color: Colors.white,
                        iconSize: 30,
                        icon: Icon(controller.value.volume == 0
                            ? Icons.volume_mute
                            : Icons.volume_up),
                        onPressed: () {
                          setState(() {
                            controller
                                .setVolume(controller.value.volume == 0 ? 1 : 0);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StickNotes()),
                          );
                        },
                        child: Container(
                          width: 120,
                          height: 120,
                          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Color.fromRGBO(4, 254, 179,0.3)),
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: const BorderRadius.all(const Radius.circular(8))
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[

                              Image.network(
                              "https://github.com/Asad-ZH/yoga-flutter-app/blob/main/myandroidapp/assets/fitness.png?raw=true",
                              fit: BoxFit.contain,
                              height: 80,
                              ),

                                Text("Fitness", style: TextStyle(fontSize: 18, color: Colors.white)),

                          ]),
                        ),
                    ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StickNotes()),
                          );
                        },
                       child: Container(
                         width: 120,
                         height: 120,
                         margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                         decoration: BoxDecoration(
                             border: Border.all(width: 1, color: Color.fromRGBO(4, 254, 179,0.3)),
                             color: Colors.grey.withOpacity(0.2),
                             borderRadius: const BorderRadius.all(const Radius.circular(8))
                         ),
                         child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,

                             children:[
                               Image.network(
                                 "https://github.com/Asad-ZH/yoga-flutter-app/blob/main/myandroidapp/assets/diet.png?raw=true",
                                 fit: BoxFit.contain,
                                 height: 60,
                               ),
                               SizedBox(height: 10),
                               Text("Diet", style: TextStyle(fontSize: 18, color: Colors.white)),
                             ]),
                       ),
                     ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StickNotes()),
                          );
                        },
                       child: Container(
                         width: 120,
                         height: 120,
                         margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                         decoration: BoxDecoration(
                             border: Border.all(width: 1, color: Color.fromRGBO(4, 254, 179,0.3)),
                             color: Colors.grey.withOpacity(0.2),
                             borderRadius: const BorderRadius.all(const Radius.circular(8))
                         ),
                         child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children:[
                               Image.network(
                                 "https://github.com/Asad-ZH/yoga-flutter-app/blob/main/myandroidapp/assets/resume.png?raw=true",
                                 fit: BoxFit.contain,
                                 height: 60,
                               ),
                               SizedBox(height: 10),

                               Text("Notes", style: TextStyle(fontSize: 18, color: Colors.white)),

                             ]),
                       ),
                     ),

                   ],
                  ),
                ),

                SizedBox(height: 20),

                Container(
                  margin:EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,0,
                      MediaQuery.of(context).size.width * 0.05, 0
                  ),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child:Text("Yoga Essentials", style: TextStyle(fontSize: 25,color: Colors.white),)),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [

                      GestureDetector(
                        child: buildImageInteractionCard01(),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FlexibiltyEssentials()),
                              );
                            },
                  ),
                      buildImageInteractionCard02(),
                      buildImageInteractionCard03(),
                    ],

                  ),
                ),

                SizedBox(height: 20),

                Container(
                  margin:EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,0,
                      MediaQuery.of(context).size.width * 0.05, 0
                  ),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child:Text("Body Focus", style: TextStyle(fontSize: 25,color: Colors.white),)),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [

                      GestureDetector(
                        child: buildImageInteractionCard11(),
                        onTap: (){
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => FlexibiltyEssentials()),
                          // );
                        },
                      ),
                      buildImageInteractionCard12(),
                      buildImageInteractionCard13(),
                    ],

                  ),
                ),

                SizedBox(height: 20),

                Container(
                  margin:EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.05,0,
                      MediaQuery.of(context).size.width * 0.05, 0
                  ),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child:Text("Keep Healthy", style: TextStyle(fontSize: 25,color: Colors.white),)),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [

                      buildImageInteractionCard21(),
                      buildImageInteractionCard22(),
                      buildImageInteractionCard23(),
                    ],

                  ),
                ),

                SizedBox(height: 20),



              ],





          ),
      ),
        ),

    );
  }

  Widget buildImageInteractionCard01() =>  Card(
    color: Colors.grey.withOpacity(0.2),

    margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.025,0,
        MediaQuery.of(context).size.width * 0.025, 0
    ),

    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child:Column(

      children: [
        Container(

          child:
            Ink.image(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8eW9nYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
              ),
              height: 160,
              width: 300,
              fit: BoxFit.cover,
            ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0,8,0,0),
            child: Text(
              'Flexibility Essentials',
              style: TextStyle(fontSize: 20,color: Colors.white ),
            ),
          ),
        ),
      ],
    ),
  );
  Widget buildImageInteractionCard02() =>  Card(
    color: Colors.grey.withOpacity(0.2),

    margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.025,0,
        MediaQuery.of(context).size.width * 0.025, 0
    ),

    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child:Column(

      children: [
        Container(

          child:
            Ink.image(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1599901860904-17e6ed7083a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8eW9nYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              ),
              height: 160,
              width: 300,
              fit: BoxFit.cover,
            ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0,8,0,0),
            child: Text(
              'Strength Essentials',
              style: TextStyle(fontSize: 20,color: Colors.white ),
            ),
          ),
        ),
      ],
    ),
  );
  Widget buildImageInteractionCard03() =>  Card(
    color: Colors.grey.withOpacity(0.2),

    margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.025,0,
        MediaQuery.of(context).size.width * 0.025, 0
    ),

    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child:Column(

      children: [
        Container(

          child:
            Ink.image(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1508672019048-805c876b67e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
              ),
              height: 160,
              width: 300,
              fit: BoxFit.cover,
            ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0,8,0,0),
            child: Text(
              'Balance Essentials',
              style: TextStyle(fontSize: 20,color: Colors.white ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget buildImageInteractionCard11() =>  Card(
    color: Colors.grey.withOpacity(0.2),

    margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.025,0,
        MediaQuery.of(context).size.width * 0.025, 0
    ),

    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child:Column(

      children: [
        Container(

          child:
          Ink.image(
            image: NetworkImage(
               "https://images.unsplash.com/photo-1524863479829-916d8e77f114?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8eW9nYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
            ),
            height: 160,
            width: 300,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0,8,0,0),
            child: Text(
              'Chest Opener',
              style: TextStyle(fontSize: 20,color: Colors.white ),
            ),
          ),
        ),
      ],
    ),
  );
  Widget buildImageInteractionCard12() =>  Card(
    color: Colors.grey.withOpacity(0.2),

    margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.025,0,
        MediaQuery.of(context).size.width * 0.025, 0
    ),

    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child:Column(

      children: [
        Container(

          child:
          Ink.image(
            image: NetworkImage(
              "https://images.unsplash.com/photo-1489659639091-8b687bc4386e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"
            ),
            height: 160,
            width: 300,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0,8,0,0),
            child: Text(
              'Hip Opener',
              style: TextStyle(fontSize: 20,color: Colors.white ),
            ),
          ),
        ),
      ],
    ),
  );
  Widget buildImageInteractionCard13() =>  Card(
    color: Colors.grey.withOpacity(0.2),

    margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.025,0,
        MediaQuery.of(context).size.width * 0.025, 0
    ),

    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child:Column(

      children: [
        Container(

          child:
          Ink.image(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1624704200567-760cf26ae848?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjZ8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"
            ),
            height: 160,
            width: 300,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0,8,0,0),
            child: Text(
              'Upper Back & Neck',
              style: TextStyle(fontSize: 20,color: Colors.white ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget buildImageInteractionCard21() =>  Card(
    color: Colors.grey.withOpacity(0.2),

    margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.025,0,
        MediaQuery.of(context).size.width * 0.025, 0
    ),

    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child:Column(

      children: [
        Container(

          child:
          Ink.image(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1570691079236-4bca6c45d440?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nzd8fHlvZ2F8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"
            ),
            height: 160,
            width: 300,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0,8,0,0),
            child: Text(
              'Healthy Back',
              style: TextStyle(fontSize: 20,color: Colors.white ),
            ),
          ),
        ),
      ],
    ),
  );
  Widget buildImageInteractionCard22() =>  Card(
    color: Colors.grey.withOpacity(0.2),

    margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.025,0,
        MediaQuery.of(context).size.width * 0.025, 0
    ),

    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child:Column(

      children: [
        Container(

          child:
          Ink.image(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1605910959675-2e28d06cc321?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTA5fHx5b2dhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
            ),
            height: 160,
            width: 300,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0,8,0,0),
            child: Text(
              'Neck & Shoulders',
              style: TextStyle(fontSize: 20,color: Colors.white ),
            ),
          ),
        ),
      ],
    ),
  );
  Widget buildImageInteractionCard23() =>  Card(
    color: Colors.grey.withOpacity(0.2),

    margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.025,0,
        MediaQuery.of(context).size.width * 0.025, 0
    ),

    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child:Column(

      children: [
        Container(

          child:
          Ink.image(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1591228127791-8e2eaef098d3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTM0fHx5b2dhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
            ),
            height: 160,
            width: 300,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0,8,0,0),
            child: Text(
              'Upper Back',
              style: TextStyle(fontSize: 20,color: Colors.white ),
            ),
          ),
        ),
      ],
    ),
  );
}

