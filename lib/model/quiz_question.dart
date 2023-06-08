class QuizQuestion {
  const QuizQuestion(this.text, this.choices);

  final String text;
  final List<String> choices;

  List<String> getShuffledChoices() {
    final shuffledChoices = List.of(choices);
    shuffledChoices.shuffle();
    return shuffledChoices;
  }
}
