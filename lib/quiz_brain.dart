import 'dart:math';

import 'package:quizzed/question.dart';

import 'question.dart';

class QuizBrain {
  int _qsnNumber = new Random().nextInt(48) + 1;
  List<int> answeredQsn = [];
  List<Question> _questions = [
    Question('Snake has legs', false),
    Question('The capital of Libya is Benghazi', false),
    Question('Albert Einstein was awarded the Nobel Prize in Physics', true),
    Question('Baby koalas are called joeys', true),
    Question('Gone with the Wind takes place in Savannah, Georgia', false),
    Question(
        'Brazil is the only country in the Americas whose official language is Portuguese',
        true),
    Question('The first name of Kramer in Seinfeld is Cosmo', true),
    Question('The American Civil War ended in 1776', false),
    Question('A right triangle can never be equilateral', true),
    Question('The Ford Edsel was named after Henry Ford’s father', false),
    Question(
        'The Dickens novel Oliver Twist begins with the well-known phrase: “It was the best of times, it was the worst of times.”',
        false),
    Question('“Paprika” is the Hungarian word for “pepper.”', true),
    Question(
        'The Bill of Rights contains 10 amendments to the Constitution', true),
    Question('Snow White’s seven dwarfs all worked as lumberjacks', false),
    Question('The name Sylvia Plath was a pseudonym', false),
    Question('There are seven red stripes in the United States flag', true),
    Question(
        'The favorite food of the Teenage Mutant Ninja Turtles is pizza', true),
    Question('Thomas Jefferson was the second president of the United States',
        false),
    Question('No bird can fly backwards', false),
    Question(
        'Freddy Kreuger is the villain in the “Friday the 13th” movies', false),
    Question('Sun produces atomic energy', true),
    Question('Dolphin is a kind of whale', false),
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
    Question('The boiling point of water is 221 degrees F', false),
    Question('Morocco is in Europe', false),
    Question('The largest planet in our solar system is Neptune', false),
    Question(
        'Tom Hanks did NOT win the Best Actor Oscar for Forrest Gump', false),
    Question('Nike is the Greek goddess of victory', true),
    Question('Hot water freezes faster than cold water', true),
    Question('The U.S. Supreme court is made up of 12 judges', false),
    Question('Africa is the largest continent in the world', false),
    Question('The Bible book of Acts was written by Luke', true),
    Question('A meter is slightly longer than a yard', true),
    Question('President Kennedy was assassinated in Houston', false),
    Question('Iceland is the largest island in the world', false),
    Question('There are 88 keys in a piano', true),
    Question('Dolphins are fish', false),
  ];

  String getQsnString() {
    return _questions[_qsnNumber].qsnText;
  }

  bool getQsnAnswer() {
    return _questions[_qsnNumber].qsnAnswer;
  }

  int nextQsnNumber() {
    answeredQsn.add(_qsnNumber);
    print(answeredQsn);
    int hooks() {
      int tempQsnNum = new Random().nextInt(48) + 1;
      for (int i = 0; i < answeredQsn.length; i++) {
        if (answeredQsn[i] == tempQsnNum) {
          return hooks();
        }
      }
      return tempQsnNum;
    }

    _qsnNumber = hooks();
    return _qsnNumber;
  }
}
