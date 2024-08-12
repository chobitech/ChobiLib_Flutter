part of 'chobilib_flutter.dart';

class Gaps {

  static final _gapBoxMap = <(bool, double), Widget>{};

  static Widget _createGapBox(bool isVertical, double size) {
    if (isVertical) {
      return SizedBox(height: size,);
    } else {
      return SizedBox(width: size,);
    }
  }


  static Widget _getGapBox(bool isVertical, double size) {
    final key = (isVertical, size);
    return _gapBoxMap[key] ?? _createGapBox(isVertical, size).also((v) => _gapBoxMap[key] = v);
  }

  static Widget getHorizontalGap(double size) {
    return _getGapBox(false, size);
  }

  static Widget getVerticalGap(double size) {
    return _getGapBox(true, size);
  }

  static Widget get horizontal4 => getHorizontalGap(4);
  static Widget get horizontal8 => getHorizontalGap(8);
  static Widget get horizontal16 => getHorizontalGap(16);
  static Widget get horizontal24 => getHorizontalGap(24);
  static Widget get horizontal32 => getHorizontalGap(32);
  static Widget get horizontal48 => getHorizontalGap(48);

  static Widget get vertical4 => getVerticalGap(4);
  static Widget get vertical8 => getVerticalGap(8);
  static Widget get vertical16 => getVerticalGap(16);
  static Widget get vertical24 => getVerticalGap(24);
  static Widget get vertical32 => getVerticalGap(32);
  static Widget get vertical48 => getVerticalGap(48);


  static const blankBoxKey = ValueKey('chobi_gaps_blank_box');
  static const blankBox = SizedBox.shrink(key: blankBoxKey,);




  Gaps._();

}