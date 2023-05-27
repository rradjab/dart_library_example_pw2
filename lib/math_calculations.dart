import 'dart:math';

import 'package:dart_library_example_pw2/error_handling.dart';

class DelimetersCalculator {
  int num1 = 1;
  int num2 = 1;

  DelimetersCalculator(num1, num2) {
    if ((num1 > 0) && (num2 > 0)) {
      this.num1 = num1;
      this.num2 = num2;
      print(
          'Dividers of $num1: ${primeFactors(num1)}\nDividers of $num2:${primeFactors(num2)}');
    } else {
      //print(number.abs()); or use abs method to convert - to +, only zero isn't suitable
      print('Digit values must be greater than zero');
    }
  }

  Set<int> primeFactors(int number) {
    Set<int> result = {};
    int i = number;
    do {
      if (number % i == 0) {
        result.add(number ~/ i);
      }
      i--;
    } while (i > 0);
    return result;
  }

  int getGCD() {
    return primeFactors(num1).intersection(primeFactors(num2)).last;
  }

  int getLCM() {
    return (num1 * num2) ~/ getGCD();
  }
}

num decToBin(num number) {
  List<int> l = [];
  num i = number.truncate();
  while (i > 0) {
    l.add(i.toInt() % 2);
    i ~/= 2;
  }
  String s = l.isNotEmpty ? l.reversed.toList().join() : '0';
  if (number - number.truncate() != 0) {
    l = [];
    i = double.parse('0.${number.toString().split('.')[1]}');
    while (i.toString().split('.')[1] != '0') {
      i *= 2;
      l.add(i.truncate());
      if (i.truncate() == 1) {
        i = double.parse('0.${i.toString().split('.')[1]}');
      }
      if (l.length > 11) break;
    }
    s += '.${l.isNotEmpty ? l.join() : '0'}';
  }
  return num.parse(s);
}

num binToDec(num number) {
  num n = number.truncate();
  num l = 0;
  int i = n.toString().length;
  while (i > 0) {
    i -= 1;
    l += int.parse(n.toString()[n.toString().length - 1 - i]) * pow(2, i);
  }

  n = 0;
  if (number - number.truncate() != 0) {
    i = 0;
    for (String e in number.toString().split('.')[1].split('')) {
      i += 1;
      n += int.parse(e) * pow(2, i * -1);
    }
  }
  return n + l;
}

num mnrmx(int a, int b, [bool min = true]) {
  return min
      ? a < b
          ? a
          : b
      : a > b
          ? a
          : b;
}

extension Degree on num {
  num pow(int degree) {
    int i = 1;
    num l = this;
    while (i < degree) {
      l *= this;
      i++;
    }
    return l;
  }

  num radix(int degree) {
    num i = 0;
    try {
      if (this < 0 || degree < 0) {
        throw NegativeNumberError();
      }
      while (i < this) {
        if (i.pow(degree) >= this) {
          break;
        }
        i++;
      }
      if (i.pow(degree) > this) {
        i--;
        while (i.pow(degree) < this) {
          i += 0.0000001;
        }
      }
    } on NegativeNumberError {
      print('Error: input number is negative');
    } catch (e) {
      print('any other error \n ');
    }
    return i;
  }
}
