import 'package:flutter/material.dart';

abstract class LoaderProgress {
  final ValueNotifier<double?> progress = ValueNotifier<double?>(null);
}

class LoaderProgressImp extends LoaderProgress {
  LoaderProgressImp();
}
