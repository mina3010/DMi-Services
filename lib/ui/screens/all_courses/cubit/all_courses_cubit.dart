import 'package:DMI/core/data/model/responses/course/course.dart';
import 'package:DMI/ui/screens/all_courses/cubit/all_courses_state.dart';
import 'package:DMI/ui/screens/all_courses/repository/all_courses_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCoursesCubit extends Cubit<AllCoursesState> {
  static AllCoursesCubit get(BuildContext context) => BlocProvider.of(context);

  // late final AllCoursesRepository _allCoursesRepository;

  List<Course> courses = [
    Course(
      id: 1,
      title: 'Lesson 1',
      mainImageUrl:
          'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg',
      date: '2023-09-26',
      numOfLessons: 5,
      type: 'Type A',
      description: 'Description for Lesson 1',
    ),
    Course(
      id: 1,
      title: 'Lesson 2',
      mainImageUrl:
          'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg',
      date: '2023-09-27',
      numOfLessons: 7,
      type: 'Type B',
      description: 'Description for Lesson 2',
    ),
    Course(
      id: 1,
      title: 'Lesson 3',
      mainImageUrl:
          'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg',
      date: '2023-09-26',
      numOfLessons: 5,
      type: 'Type A',
      description: 'Description for Lesson 1',
    ),
    Course(
      id: 1,
      title: 'Lesson 4',
      mainImageUrl:
          'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg',
      date: '2023-09-26',
      numOfLessons: 5,
      type: 'Type A',
      description: 'Description for Lesson 1',
    ),
    Course(
      id: 1,
      title: 'Lesson 5',
      mainImageUrl:
          'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg',
      date: '2023-09-26',
      numOfLessons: 5,
      type: 'Type A',
      description: 'Description for Lesson 1',
    ),
    Course(
      id: 1,
      title: 'Lesson 6',
      mainImageUrl:
          'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg',
      date: '2023-09-26',
      numOfLessons: 5,
      type: 'Type A',
      description: 'Description for Lesson 1',
    ),
    // Add more Course instances as needed
  ];

  AllCoursesCubit({
    AllCoursesRepository? allCoursesRepository,
  }) : super(const AllCoursesState.initial()) {
    // _allCoursesRepository =
    //     allCoursesRepository ?? GetIt.I.get<AllCoursesRepository>();
  }

  Future init() async {}
}
