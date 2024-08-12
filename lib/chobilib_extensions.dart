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

  int get lastIndex => (length > 0) ? length - 1 : -1;

  void replace(int index, T newValue) {
    if (index < 0 || index > lastIndex) {
      return;
    }

    this[index] = newValue;
  }

  void addWithSeparator({T? separator, required T value,}) {
    if (isNotEmpty && separator != null) {
      add(separator);
    }
    add(value);
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

  int asPositiveInt() => !toBool() ? 0 : this;
}

extension ChobiLibSizeExtensions on Size {
  Rect getRect({double left = 0.0, double top = 0.0,}) {
    return Rect.fromLTWH(left, top, width, height);
  }

  Rect getRectWithCenter({required double centerX, required double centerY,}) {
    return Rect.fromCenter(center: Offset(centerX, centerY), width: width, height: height);
  }
}

extension ChobiLibCanvasExtension on Canvas {

  void drawText(
      String text,
      Offset position,
      {
        TextStyle? style,
        Alignment alignment = Alignment.centerLeft,
        TextAlign textAlign = TextAlign.left,
        int maxLines = 1,
      }
      ) {

    final textSpan = TextSpan(
      text: text,
      style: style,
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: textAlign,
      maxLines: maxLines,
    );

    textPainter.layout();

    final double x, y;

    if (alignment.x < 0) {
      x = position.dx;
    } else if (alignment.x > 0) {
      x = position.dx - textPainter.width;
    } else {
      x = position.dx - textPainter.width * 0.5;
    }

    if (alignment.y < 0) {
      y = position.dy - textPainter.height;
    } else if (alignment.y > 0) {
      y = position.dy + textPainter.height;
    } else {
      y = position.dy - textPainter.height * 0.5;
    }

    textPainter.paint(this, Offset(x, y));
  }
}

extension ChobiLibDynamicMapExtension<T> on Map<T, dynamic> {

  R get<R>(T key, R defVal) {
    return this[key] ?? defVal;
  }

  DateTime? getDateTime(T key, {DateTime? defaultDateTime}) {
    return this[key]?.let((t) => DateTime.fromMillisecondsSinceEpoch(t)) ?? defaultDateTime;
  }

  DateTime getDateTimeOrNow(T key) {
    return getDateTime(key, defaultDateTime: DateTime.now())!;
  }
}

extension ChobiLibTextEditControllerExtension on TextEditingController {

  int get currentCursorPosition => selection.end;

  void setCursorPosition({int position = 0}) {
    selection = TextSelection.fromPosition(TextPosition(offset: position.clamp(0, text.length)));
  }

  void moveCursorWithDelta(int delta) {
    setCursorPosition(position: currentCursorPosition + delta);
  }

  void setText(String text, {bool movePositionToEnd = true}) {
    final curPos = (selection.end).clamp(0, this.text.length);
    final pos = movePositionToEnd ? (curPos + text.length) : curPos;
    this.text = text;
    setCursorPosition(position: pos);
  }

  void insertText(String text, {int? positionAt}) {
    final insertPos = (positionAt ?? selection.end).clamp(0, this.text.length);

    final curChars = this.text.characters.toList();

    if (insertPos == this.text.length) {
      curChars.add(text);
    } else {
      curChars.insert(insertPos, text);
    }

    this.text = curChars.join('');
    setCursorPosition(position: insertPos + text.length);
  }

  void setOrInsertString(String s) {
    final textValue = value;
    final curSelection = textValue.selection;

    String text;
    int offset;

    if (curSelection.start == curSelection.end && curSelection.start == -1) {
      text = s;
      offset = s.length;
    } else {
      text = textValue.text.replaceRange(curSelection.start, curSelection.end, s);
      offset = curSelection.start + s.length;
    }

    value = TextEditingValue(
      text: text,
      selection: TextSelection.fromPosition(TextPosition(offset: offset)),
    );
  }


  void delCharFromTextController() {
    final textValue = value;
    final curSelection = textValue.selection;

    var startPos = curSelection.start;
    final endPos = curSelection.end;

    if (startPos == -1 || textValue.text.isEmpty) {
      return;
    }

    if (startPos == endPos) {
      if (startPos > 0) {
        startPos--;
      } else {
        return;
      }
    }

    value = TextEditingValue(
      text: textValue.text.replaceRange(startPos, endPos, ''),
      selection: TextSelection.fromPosition(TextPosition(offset: startPos)),
    );

  }
}

extension ChobiFontWeightExtensions on FontWeight {

  List<FontVariation> toFontVariations() {
    return [
      FontVariation.weight(value.toDouble()),
    ];
  }

}

extension ChobiTextStyleExtensions on TextStyle {

  TextStyle applyVariableWeight() {
    return copyWith(
      fontVariations: fontWeight?.toFontVariations(),
    );
  }

}

extension ChobiTextThemeExtensions on TextTheme {

  TextTheme applyFontWeightToFontVariationsWith({
    String? fontFamily,
    Color? color,
  }) {
    return copyWith(
      displayLarge: displayLarge?.applyVariableWeight(),
      displayMedium: displayMedium?.applyVariableWeight(),
      displaySmall: displaySmall?.applyVariableWeight(),

      headlineLarge: headlineLarge?.applyVariableWeight(),
      headlineMedium: headlineMedium?.applyVariableWeight(),
      headlineSmall: headlineSmall?.applyVariableWeight(),

      titleLarge: titleLarge?.applyVariableWeight(),
      titleMedium: titleMedium?.applyVariableWeight(),
      titleSmall: titleSmall?.applyVariableWeight(),

      labelLarge: labelLarge?.applyVariableWeight(),
      labelMedium: labelMedium?.applyVariableWeight(),
      labelSmall: labelSmall?.applyVariableWeight(),

      bodyLarge: bodyLarge?.applyVariableWeight(),
      bodyMedium: bodyMedium?.applyVariableWeight(),
      bodySmall: bodySmall?.applyVariableWeight(),
    ).apply(
      fontFamily: fontFamily,
      displayColor: color,
      bodyColor: color,
    );
  }
}

extension ChobiLibBuildContextExtension on BuildContext {

  TextTheme get currentTextTheme => Theme.of(this).textTheme;
  ColorScheme get currentColorScheme => Theme.of(this).colorScheme;

  Size get screenSize => MediaQuery.of(this).size;

  EdgeInsets get safeAreaPadding => MediaQuery.of(this).padding;

  Rect get screenAreaWithinSafeArea {
    final size = screenSize;
    final sPad = safeAreaPadding;
    return Rect.fromLTWH(
      sPad.left,
      sPad.top,
      size.width - sPad.left - sPad.right,
      size.height - sPad.top - sPad.bottom,
    );
  }

}

