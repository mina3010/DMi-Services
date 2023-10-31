import 'package:DMI/ui/screens/contact_us_screen/cubit/contact_us_state.dart';
import 'package:DMI/ui/screens/contact_us_screen/repository/contact_us_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  static ContactUsCubit get(BuildContext context) => BlocProvider.of(context);

  // late final ContactUsRepository _contactUsRepository;

  ContactUsCubit({ContactUsRepository? contactUsRepository})
      : super(const ContactUsState.initial()) {
    // _contactUsRepository =
    //     contactUsRepository ?? GetIt.I.get<ContactUsRepository>();
  }
}
