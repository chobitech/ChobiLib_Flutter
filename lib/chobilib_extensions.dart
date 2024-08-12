part of 'chobilib_flutter.dart';

extension ChobiLibAnyExtensions<T> on T {

  /// Kotlin like also
  T also(void Function(T value) func) {
    func(this);
    return this;
  }

  /// kotlin like also with async process
  FutureOr<T> alsoAsync(FutureOr<void> Function(T value) funcAsync) async {
    await funcAsync(this);
    return this;
  }

  /// kotlin like let
  R let<R>(R Function(T value) func) => func(this);

  /// kotlin like let with async process
  FutureOr<R> letAsync<R>(FutureOr<R> Function(T value) funcAsync) async => await funcAsync(this);
}


extension ChobiLibAnyListExtensions<T> on List<T> {

  int get lastIndex => length - 1;

  List<T> getJointedList(T joint) {
    final res = <T>[];
    for (var t in this) {
      if (res.isNotEmpty) {
        res.add(joint);
      }
      res.add(t);
    }
    return res;
  }

}

extension ChobiLibStringBufferExtensions on StringBuffer {

  StringBuffer writeWithJoint(Object? obj, {String joint = '',}) {
    if (isNotEmpty && joint.isNotEmpty) {
      write(joint);
    }
    return this..write(obj);
  }

}

extension ChobiLibBoolExtensions on bool {
  int toInt() => this ? 1 : 0;
}

extension ChobiLibIntExtensions on int {
  bool toBool() => this > 0;
}
