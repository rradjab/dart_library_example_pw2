import 'dart:convert';
import 'dart:io';

class GaussMethod {
  var variablesOutput = <String, num>{};
  var equationsList = <List<int>>[];
  var equationsListCalc = <List<int>>[];
  int equations = 0;
  int variables = 0;

  Map<String, num> main() {
    stdout.write('Type equations count: ');
    equations = int.parse(stdin.readLineSync().toString());
    setVariableLetter(equations);
    stdout.write('Type variables count: ');
    variables = int.parse(stdin.readLineSync().toString());
    setVariableLetter(equations);
    equationsList = List<List<int>>.generate(
        equations, (index) => List<int>.generate(variables + 1, (index) => 0));
    assert(equations <= variables);
    for (int i = 0; i < equations * variables + equations; i++) {
      equationElement(i);
    }
    equationsListCalc = equationsList;
    beginCalculate();
    return variablesOutput;
  }

  int eqLine(int index) {
    if (index <= variables) {
      return 1;
    } else {
      return (index / (variables + 1)).truncate() + 1;
    }
  }

  void equationElement(int index) {
    var i = eqLine(index);
    var l = 0;
    if (index + 1 < variables + 1) {
      l = index + 1;
    } else if ((index + 1) % (variables + 1) == 0) {
      l = variables + 1;
    } else {
      l = (index + 1) % (variables + 1);
    }
    stdout.write('Type line($i) ${l == variables + 1 ? 'result' : l} number: ');
    equationsList[i - 1][l - 1] = int.parse(stdin.readLineSync().toString());
  }

  void setVariableLetter(int length) {
    for (String s in List<String>.generate(
        length, (index) => utf8.decode([97 + index]))) {
      variablesOutput[s] = 0;
    }
  }

  void beginCalculate() {
    num n = 0;
    for (int i = 0; i < equationsList.length; i++) {
      if (equationsList.length - 1 >= i + 1) {
        n = 0;
        for (int l = 0; l <= variables; l++) {
          if (l < variables) {
            if (l < equations) {
              if (equationsList[i][0] != 0 && equationsList[i + 1][0] != 0) {
                n = equationsList[i][0] / equationsList[i + 1][0];
              }
            } else {
              print('${utf8.decode([97 + l])} is free and assigned as 1');
              variablesOutput[utf8.decode([97 + l])] = 1;
            }
          }
        }
      } else {
        for (int l = 0; l < equationsList[i].length - 1; l++) {
          if (equationsList[i][l] == 0 || n > 0) {
            n += equationsList[i][l];
            print('${utf8.decode([97 + l])} is free and assigned as 0');
            variablesOutput[utf8.decode([97 + l])] = 0;
          } else {
            n = equationsList[i][variables] - n;
            variablesOutput[utf8.decode([97 + l])] = n / equationsList[i][l];
          }
        }
      }
    }
    print('Matrix is look like:');
    for (List<int> list in equationsList) {
      for (int i = 0; i < list.length; i++) {
        if (i == list.length - 1) {
          stdout.write(' | ${list[i]} \n');
        } else {
          stdout.write(' ${list[i]} ');
        }
      }
    }
  }
}
