import 'package:DMI/core/data/remote/dio_helper.dart';

abstract class RemoteDataSource {}

class RemoteDataSourceImp extends RemoteDataSource {
  late final DioHelper dioHelper;

  RemoteDataSourceImp({required this.dioHelper});
}
