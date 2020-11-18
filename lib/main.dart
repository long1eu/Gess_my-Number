import 'package:flutter/material.dart';
import 'dart:math';
import 'test.dart';

// todo: format your code
void main() {
  runApp(Guess());
}
class Guess extends StatefulWidget {
  @override
  _GuessState createState() => _GuessState();
}
class _GuessState extends State<Guess> {
  // todo: always specify types
  final guessedNumber = new TextEditingController();
  // todo: always specify types
  final rng = new Random();
  // todo: proper variable names(message)
  String display = ' ';
  // todo: proper variable names
  String guess1 = ' ';

  void ourAns() {
    numberRandom = numberRandom;
    print(guessedNumber.text);
    int guess = int.parse(guessedNumber.text);

    if (guess > 100 || guess < 1) {
      setState(() {
        display = 'Choose number between 1 and 100';
      });
      // todo: move this at the end
      guessedNumber.clear();
    } // todo; add else
    if (guess > numberRandom) {
      setState(() {
        // todo: why parentheses
        display = ("Try a LOWER number!");
      });
      guessedNumber.clear();
    } else if (guess < numberRandom) {
      setState(() {
        display = ("Try a HIGHER number!");
      });
      guessedNumber.clear();
    } else {
     setState(() {
       display = ("That is right.");
     });
    }
    print(display);
    guess1 = guess.toString();
    //return guess;
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Guess my number'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'lib/img/nr.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'I\'m thinking of a number between 1 and 100. ',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'It\'s your turn to guess my number ! ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Your number is $guess1',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      display,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              Card(
                color: Colors.blue,
                child: Column(
                  children: [
                    Text(
                      'Select your number ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        labelText: ('Your ans is...'),
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      controller: guessedNumber,
                    ),
                    FlatButton(
                      child: Text(
                        'Guess',
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        print(guess1);
                        ourAns();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}