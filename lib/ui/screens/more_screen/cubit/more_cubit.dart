import 'package:DMI/ui/screens/more_screen/cubit/more_state.dart';
import 'package:DMI/ui/screens/more_screen/repository/more_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreCubit extends Cubit<MoreState> {
  static MoreCubit get(BuildContext context) => BlocProvider.of(context);

  // late final MoreRepository _moreRepository;

  MoreCubit({MoreRepository? moreRepository})
      : super(const MoreState.initial()) {
    // _moreRepository = moreRepository ?? GetIt.I.get<MoreRepository>();
  }
}
