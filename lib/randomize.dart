part of 'chobilib_flutter.dart';


class Randomize<T> {

  final List<T> elements;
  late final Random _random;

  /// [elements] - The list of element.
  ///
  /// [random] - The instance of [Random] for randomize process. If null, this class uses the [Random] from [Random.secure()].
  Randomize(this.elements, {Random? random,}) {
    _random = random ?? Random.secure();
  }

  /// get next random element
  T next() => elements[_random.nextInt(elements.length)];


  /// Generates the list includes random elements.
  ///
  /// [size] - Size of the random list
  /// [duplicate] - When false, generates the random list without same element. default is true.
  /// The generated list of random element. If [duplicate] is false and [size] bigger than the length of [elements], the size of result list is clamped to the length of [elements].
  List<T> getRandomList(int size, {bool duplicate = true,}) {
    final res = <T>[];

    if (duplicate) {
      for (var i = 0; i < size; i++) {
        res.add(next());
      }
    } else {
      final tmpElements = [...elements];
      final maxSize = min(elements.length, size);
      for (var i = 0; i < maxSize; i++) {
        final n = _random.nextInt(tmpElements.length);
        res.add(tmpElements.removeAt(n));
      }
    }

    return res;
  }
}
