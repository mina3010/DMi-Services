import 'package:DMI/core/data/model/app/preference.dart';
import 'package:DMI/ui/screens/main_screen/cubit/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MainCubit extends Cubit<MainState> {
  static MainCubit get(BuildContext context) => BlocProvider.of(context);

  late final Preference _preference;

  MainCubit() : super(const MainState.initial());

  void init() {
    _preference = GetIt.I.get<Preference>();
  }

  void setLanguage(String locale) {
    MainState currentState = state;
    emit(const MainState.loading());
    _preference.locale = locale;
    emit(currentState);
  }

  void changeTheme() {
    MainState currentState = state;
    emit(const MainState.loading());
    emit(currentState);
  }
}
