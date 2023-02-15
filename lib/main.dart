// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'story_brain.dart';
import 'package:flutter/services.dart';


StoryBrain sb = StoryBrain();

void main() {

  WidgetsFlutterBinding.ensureInitialized(); //code to hide status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
  SystemUiOverlay.bottom                                                   
]); 

  runApp(StoryPage());
}


class StoryPage extends StatelessWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DestiniPage(),
        
      ),
    );
  }
}

class DestiniPage extends StatefulWidget {
  const DestiniPage({Key? key}) : super(key: key);

  @override
  _DestiniPageState createState() => _DestiniPageState();
}

class _DestiniPageState extends State<DestiniPage> {

  List<Color> colors1 = [Colors.grey,Colors.black];
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/sky.jpg'), fit: BoxFit.cover),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Expanded(
            flex: 12,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  sb.getPara(),
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: TextButton(
                    child: Text(sb.getChoice1(),style: TextStyle(fontSize: 20.0),),
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.indigo[400],
                        enableFeedback: true),
                    onPressed: () {
                      setState(() {
                        sb.nextStory(1);
                      });
                    },
                  ),
                ),
              ),),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Visibility(
                  visible: sb.visibl(),
                  child: Card(
                    child: TextButton(
                      child: Text(sb.getChoice2(),style: TextStyle(fontSize: 20.0),),
                      style: TextButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                          enableFeedback: true),
                      onPressed: () {
                        setState(() {
                          sb.nextStory(2);
                        });
                        
                      },
                    ),
                  ),
                ),
              ),),
        ],
      ),
    );
  }
}
