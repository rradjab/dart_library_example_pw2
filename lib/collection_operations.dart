class CollectionOperations {
  String inputText = '';
  Map<String, int> countWording = {
    'zero': 0,
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9
  };

  CollectionOperations(this.inputText) {
    print('Input text:"$inputText"');
  }

  Iterable<num> extractNumbers() {
    return inputText
        .split(' ')
        .map((e) => num.tryParse(e))
        .where((e) => e != null)
        .cast<num>();
  }

  Map<String, int> elementCount(Iterable<String> wordCollection) {
    return <String, int>{
      for (var item in wordCollection)
        item.toString(): checkCount(item, wordCollection)
    };
  }

  int checkCount(String word, Iterable<String> collection) {
    int i = 0;
    for (String s in collection) {
      if (s == word) {
        i++;
      }
    }
    return i;
  }

  Set<int> extractUnicalInts(Iterable<String> collection) {
    return collection
        .map((e) => countWording[e.toLowerCase()])
        .where((e) => e != null)
        .cast<int>()
        .toSet();
  }
}
