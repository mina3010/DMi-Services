import 'package:DMI/core/data/model/responses/course/course.dart';
import 'package:DMI/ui/screens/profile_screen/cubit/profile_state.dart';
import 'package:DMI/ui/screens/profile_screen/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  // late final ProfileRepository _profileRepository;

  final Course course = Course(
    id: 1,
    title: 'Lesson 1',
    mainImageUrl:
        'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg',
    date: '2023-09-26',
    numOfLessons: 5,
    type: 'Type A',
    description: 'Description for Lesson 1',
  );

  ProfileCubit({ProfileRepository? profileRepository})
      : super(const ProfileState.initial()) {
    // _profileRepository = profileRepository ?? GetIt.I.get<ProfileRepository>();
  }
}
