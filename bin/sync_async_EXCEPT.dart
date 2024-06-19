void main() {
  print(stringToInt('a'));
}

int stringToInt(String text) {
  int value;
  try {
    value = int.parse(text);
  } catch (e) {
    //value = 0;
    throw Exception('O texto informado ($text) não é um número');
  }

  return value;
}