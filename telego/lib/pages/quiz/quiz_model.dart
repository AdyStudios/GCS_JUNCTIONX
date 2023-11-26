class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "Who is the founder of Yettel?",
    [
      Answer("Tibor Rékási", false),
      Answer("Sigve Brekke", false),
      Answer("Jason King", true),
      Answer("Margherita Della Valle", false),
    ],
  ));

  list.add(Question(
    "What does LTE stand for in the context of mobile networks?",
    [
      Answer("Long-Term Evolution", true),
      Answer("Large Telecommunication Enterprise", false),
      Answer("Low-Tech Equipment", false),
      Answer("Local Telephone Exchange", false),
    ],
  ));

  list.add(Question(
    "In telecommunications, what is a modem used for?",
    [
      Answer("Managing email servers", false),
      Answer("Monitoring data usage", false),
      Answer("Mobile device management", false),
      Answer("Modulating and Demodulating signals", true),
    ],
  ));

  list.add(Question(
    "True or False: Fiber optic cables transmit data using pulses of light.",
    [
      Answer("True", true),
      Answer("False", false),
    ],
  ));

  return list;
}