import 'dart:math';

import 'package:dart_library_example_pw2/error_handling.dart';

class DelimetersCalculator {
  int num1 = 1;
  int num2 = 1;

  DelimetersCalculator(num1, num2) {
    assert(num1 is int && num2 is int);
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
  num pow(num degree) {
    int i = 1;
    num l = this;
    while (i < degree) {
      l *= this;
      i++;
    }
    return l;
  }

  num radix(num degree) {
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
    } catch (e, s) {
      print('any other error \n $e \n $s');
    }
    return i;
  }
}
