import 'dart:math';

class Conversions {
  String decToBin(num number) {
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
    return s;
  }

  num binToDec(String number) {
    String s = number;
    if (number.contains('.')) {
      s = number.toString().split('.')[0];
    }

    num l = 0;
    int i = s.length;
    while (i > 0) {
      i -= 1;
      l += int.parse(s[s.length - 1 - i]) * pow(2, i);
    }

    num n = 0;
    if (number != s) {
      i = 0;
      for (String e in number.split('.')[1].split('')) {
        i += 1;
        n += int.parse(e) * pow(2, i * -1);
      }
    }
    return n + l;
  }
}
