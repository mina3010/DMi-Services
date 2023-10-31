import 'package:DMI/core/res/colors.dart';
import 'package:flutter/cupertino.dart';

class AppSwitch<T> extends StatelessWidget {
  final void Function(bool) onChange;
  final bool switchValue;
  const AppSwitch({
    Key? key,
    required this.onChange,
    required this.switchValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
        activeColor: AppColors.colorIcon,
        value: switchValue,
        onChanged: onChange,
      ),
    );
  }
}
