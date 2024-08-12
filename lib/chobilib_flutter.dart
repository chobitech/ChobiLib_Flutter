
import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'chobilib_extensions.dart';
part 'randomize.dart';
part 'random_string.dart';
part 'gaps.dart';
part 'pop_and_app_terminable.dart';

class ChobilibFlutter {

  /// The blank box for various use
  static const blankBox = SizedBox.shrink(key: ValueKey('chobilib_flutter_blank_box'),);

  ChobilibFlutter._();

}
