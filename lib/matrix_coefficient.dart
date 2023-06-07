import 'dart:convert';
import 'dart:io';

import 'package:dart_library_example_pw2/input_operations.dart';
import 'package:dart_library_example_pw2/math_calculations.dart';

class GaussMethod {
  var variablesOutput = <String, num?>{};
  var equationsList = <List<num>>[];
  var equationsListCalc = <List<num>>[];
  var outMessage = <String>[];
  int equations = 0;
  int variables = 0;

  Map<String, num?> main() {
    print('Gauss method:');
    equations = getInt('equations count');
    variables = getInt('variables count');
    setVariableLetter(variables);
    equationsList = List<List<num>>.generate(
        equations, (index) => List<num>.generate(variables + 1, (index) => 0));
    equationsListCalc = List<List<num>>.generate(
        equations, (index) => List<num>.generate(variables + 1, (index) => 0));
    if (equations <= 0 || variables <= 0) {
      print('Wrong parameters');
      return variablesOutput;
    }
    for (int i = 0; i < equations * variables + equations; i++) {
      equationElement(i);
    }
    if (!beginCalculate()) {
      variablesOutput.updateAll((key, value) => value = 0);
    }
    print(outMessage.map((e) => 'Var $e is free and assigned as 0').join('\n'));
    print('\nOutput variables:');
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
    stdout.write('Line($i) ${l == variables + 1 ? 'result' : 'element $l'}: ');
    String s = stdin.readLineSync().toString().replaceAll(',', '.');
    var n = num.tryParse(s);
    if (n == null) {
      print('"$s" is wrong number and replaced by 0');
      n = 0;
    }
    equationsList[i - 1][l - 1] = n;
    equationsListCalc[i - 1][l - 1] = n;
  }

  void setVariableLetter(int length) {
    for (String s in List<String>.generate(
        length, (index) => utf8.decode([97 + index]))) {
      variablesOutput[s] = null;
    }
  }

  void swapLineIfZero(int lineIndex) {
    for (int i = lineIndex; i < equations; i++) {
      if (equationsListCalc[i][i] == 0) {
        for (int l = i + 1; l < equations; l++) {
          if (equationsListCalc[l][i] != 0) {
            equationsListCalc.insert(i, equationsListCalc.removeAt(l));
            break;
          }
        }
      } else {
        break;
      }
    }
  }

  bool beginCalculate() {
    num n = 0;
    for (int i = 0; i < mnrmx(equations, variables, false); i++) {
      if (equationsList.length > 1) {
        // equations < variables
        if (i > equations - 1) {
          outMessage.add(utf8.decode([97 + i]));
          variablesOutput[utf8.decode([97 + i])] = 0;
        } else {
          if (variables == 1) {
            equationsList[i][0] != 0
                ? n = equationsList[i][1] / equationsList[i][0]
                : n = 0;
            variablesOutput[utf8.decode([97 + i])] = n;
            break;
            //if equations count not more than variables count
          } else if (i < variables - 1) {
            //if next line of equation exists
            if (equations - 1 >= i + 1) {
              swapLineIfZero(i);
              //if elements column is not only zeroes
              if (equationsListCalc[i][i] != 0) {
                for (int l = i + 1; l < variables; l++) {
                  if (equationsListCalc[l][i] != 0) {
                    int o = 1;
                    if (equationsListCalc[l][i] > 0 &&
                        equationsListCalc[i][i] > 0) {
                      o = -1;
                    } else if (equationsListCalc[l][i] < 0 &&
                        equationsListCalc[i][i] < 0) {
                      o = -1;
                    }
                    n = equationsListCalc[l][i] / equationsListCalc[i][i];
                    for (int m = i; m <= variables; m++) {
                      equationsListCalc[l][m] =
                          (equationsListCalc[i][m]) * n.abs() +
                              equationsListCalc[l][m] * (o);
                    }
                  }
                }
              } else {
                outMessage.add(utf8.decode([97 + i]));
                variablesOutput[utf8.decode([97 + i])] = 0;
              }
            }
          }
        }
      } else {
        for (int l = 0; l < equationsList[i].length - 1; l++) {
          if (equationsList[i][l] == 0 || n > 0) {
            n += equationsList[i][l];
            outMessage.add(utf8.decode([97 + l]));
            variablesOutput[utf8.decode([97 + l])] = 0;
          } else {
            n = equationsList[i][variables] - n;
            variablesOutput[utf8.decode([97 + l])] =
                num.parse((n / equationsList[i][l]).toStringAsFixed(5));
          }
        }
        break;
      }
    }
    print('\nMatrix is looks like:');
    for (List<num> list in equationsList) {
      for (int i = 0; i < list.length; i++) {
        if (i == list.length - 1) {
          stdout.write(' | ${list[i]} \n');
        } else {
          stdout.write(' ${list[i]} ');
        }
      }
    }
    for (int i = variables - 1; i >= 0; i--) {
      for (int l = variables - 1; l >= 0; l--) {
        if (variablesOutput[utf8.decode([97 + l])] == null) {
          n = equationsListCalc[i][variables];
          for (int m = l + 1; m < variables; m++) {
            n -= equationsListCalc[i][m] *
                variablesOutput[utf8.decode([97 + m])]!;
          }
          if (equationsListCalc[i][l] == 0) {
            variablesOutput[utf8.decode([97 + l])] = 1;
          } else {
            variablesOutput[utf8.decode([97 + l])] =
                num.parse((n / equationsListCalc[i][l]).toStringAsFixed(5));
          }
          l = -1;
        }
      }
    }
    //check for compatibility
    for (int i = equations - 1; i >= 0; i--) {
      n = equationsList[i][variables];
      for (int l = variables - 1; l >= 0; l--) {
        n -= equationsList[i][l] * variablesOutput[utf8.decode([97 + l])]!;
      }
      if (n != 0 || n > 1E-5) {
        print('System is incompatible');
        return false;
      }
    }
    print('\nGauss method looks like:');
    for (List<num> list in equationsListCalc) {
      for (int i = 0; i < list.length; i++) {
        if (i == list.length - 1) {
          stdout.write(' | ${list[i]} \n');
        } else {
          stdout.write(' ${list[i]} ');
        }
      }
    }
    return true;
  }
}
