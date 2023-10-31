import 'package:DMI/ui/screens/about_screen/cubit/about_state.dart';
import 'package:DMI/ui/screens/about_screen/repository/about_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutCubit extends Cubit<AboutState> {
  static AboutCubit get(BuildContext context) => BlocProvider.of(context);

  // late final AboutRepository _aboutRepository;

  AboutCubit({AboutRepository? aboutRepository})
      : super(const AboutState.initial()) {
    // _aboutRepository = aboutRepository ?? GetIt.I.get<AboutRepository>();
  }
}
