part of 'chobilib_flutter.dart';

class RandomString extends Randomize<String> {

  static const _digits = '0123456789';
  static const _hexChars = 'abcdefg';
  static const _nonHexChars = 'hijklmnopqrstuvwxyz';
  static const _allChars = _hexChars + _nonHexChars;

  RandomString(super.elements, {super.random,});

  /// [elementString] - The string used for [elements].
  RandomString.fromString(String elementString, {Random? random,}) : this(elementString.characters.toList(), random: random);

  /// Creates a [RandomString] instance with digit string(0-9).
  RandomString.withDigitOnly({Random? random,}) : this.fromString(_digits, random: random);

  /// Creates a [RandomString] instance with lower hex string(0-9a-f).
  RandomString.withLowerHex({Random? random,}) : this.fromString(_digits + _hexChars, random: random);

  /// Creates a [RandomString] instance with upper hex string(0-9A-F).
  RandomString.withUpperHex({Random? random,}) : this.fromString(_digits + _hexChars.toUpperCase(), random: random);

  /// Creates a [RandomString] instance with hex string(0-9a-fA-F).
  RandomString.withHex({Random? random,}) : this.fromString(_digits + _hexChars + _hexChars.toUpperCase(), random: random);

  /// Creates a [RandomString] instance with lower digits and characters string(0-9a-z).
  RandomString.withLowerDigitsChars({Random? random,}) : this.fromString(_digits + _allChars, random: random);

  /// Creates a [RandomString] instance with upper digits and characters string(0-9A-Z).
  RandomString.withUpperDigitsChars({Random? random,}) : this.fromString(_digits + _allChars.toUpperCase(), random: random);

  /// Creates a [RandomString] instance with digits and characters string(0-9a-zA-Z).
  RandomString.withDigitsChars({Random? random,}) : this.fromString(_digits + _allChars + _allChars.toUpperCase(), random: random);


  String getRandomString(int size, {bool duplicate = true,}) => getRandomList(size, duplicate: duplicate).join('');

}