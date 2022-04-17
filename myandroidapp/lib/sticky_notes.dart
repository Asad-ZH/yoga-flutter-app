import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myandroidapp/page/notes_page.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//
//   runApp(MyApp());
// }

class StickNotes extends StatelessWidget {
  static final String title = 'Notes SQLite';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: NotesPage(),
      );
}
