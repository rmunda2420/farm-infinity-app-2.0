import 'dart:math';

class GenAppId {
  String generateRandomString() {
    // Get the current date in DDMMYY format
    String currentDate = _getCurrentDate();

    // Generate four random alphabetic characters
    String randomChars = _generateRandomAlphabeticCharacters(4);

    // Concatenate the values to form the final string
    String randomString = "$currentDate$randomChars";

    return randomString;
  }

  String _getCurrentDate() {
    // Get the current date in DDMMYY format
    DateTime now = DateTime.now();
    String day = now.day.toString().padLeft(2, '0');
    String month = now.month.toString().padLeft(2, '0');
    String year = now.year.remainder(100).toString().padLeft(2, '0');
    return "$day$month$year";
  }

  String _generateRandomAlphabeticCharacters(int count) {
    // Generate the specified count of random uppercase alphabetic characters
    String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    String result = '';
    for (int i = 0; i < count; i++) {
      result += alphabet[Random().nextInt(alphabet.length)];
    }
    return result;
  }
}
