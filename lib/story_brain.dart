import 'story.dart';

// ignore_for_file: prefer_final_fields
class StoryBrain {
  int _storyno = 0;

  List<Story> _storyData = [
    Story(
        para:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.'),
    Story(
        para: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice2: 'Wait, I know how to change a tire.'),
    Story(
        para:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        para:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: ''),
    Story(
        para:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        para:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '')
  ];

  String getPara() {
    return _storyData[_storyno].para;
  }

  String getChoice1() {
    return _storyData[_storyno].choice1;
  }

  String getChoice2() {
    return _storyData[_storyno].choice2;
  }

  void restart() {
    _storyno = 0;
  }

  void nextStory(choiceNumber) {
    if (choiceNumber == 1 && _storyno == 0) {
      _storyno = 2;
    } else if (choiceNumber == 2 && _storyno == 0) {
      _storyno = 1;
    } else if (choiceNumber == 1 && _storyno == 1) {
      _storyno = 2;
    } else if (choiceNumber == 2 && _storyno == 1) {
      _storyno = 3;
    } else if (choiceNumber == 1 && _storyno == 2) {
      _storyno = 5;
    } else if (choiceNumber == 2 && _storyno == 2) {
      _storyno = 4;
    } else if (_storyno == 3 || _storyno == 4 || _storyno == 5) {
      restart();
    }
  }

  bool visibl(){
    if (_storyno == 3 || _storyno == 4 || _storyno == 5) {
      return false;
    }
    else{
      return true;
    }
  }


}
