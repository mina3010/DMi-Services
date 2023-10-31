import 'package:DMI/core/data/model/responses/general/app_notification.dart';
import 'package:DMI/ui/screens/notifications_screen/cubit/notifications_state.dart';
import 'package:DMI/ui/screens/notifications_screen/repository/notifications_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  static NotificationsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  // late final NotificationsRepository _notificationsRepository;

  final List<AppNotification> notificationList = [
    AppNotification(
      date: '2023-05-04T02:30:00Z',
      title: 'Notification A',
      content: 'aaaaaaaa',
      imageURL: '',
      isRead: false,
    ),
    AppNotification(
      date: '2023-05-04T02:30:00Z',
      title: 'Notification B',
      content: 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
      imageURL: '',
      isRead: false,
    ),
    AppNotification(
      date: '2023-05-04T02:30:00Z',
      title: 'Notification C',
      content:
          'Cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccsdfsdkfhsj dlfjsdlkfj ldskjfkdsjf lkdsj fklsdj flksdj fklsdj flksdj flkdsjf lksdj fldsfjsdlkfjsdlj flsdkj fldskfjsdlkfjsdlkccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc',
      imageURL: '',
      isRead: false,
    ),
    AppNotification(
      date: '2023-05-04T02:30:00Z',
      title: 'Notification A',
      content: 'aaaaaaaa',
      imageURL: '',
      isRead: true,
    ),
    AppNotification(
      date: '2023-05-04T02:30:00Z',
      title: 'Notification B',
      content: 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
      imageURL: '',
      isRead: true,
    ),
    AppNotification(
      date: '2023-05-04T02:30:00Z',
      title: 'Notification C',
      content:
          'Cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccsdfsdkfhsj dlfjsdlkfj ldskjfkdsjf lkdsj fklsdj flksdj fklsdj flksdj flkdsjf lksdj fldsfjsdlkfjsdlj flsdkj fldskfjsdlkfjsdlkccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc',
      imageURL: '',
      isRead: true,
    ),
    AppNotification(
      date: '2023-05-04T02:30:00Z',
      title: 'Notification A',
      content: 'aaaaaaaa',
      imageURL: '',
      isRead: true,
    ),
    AppNotification(
      date: '2023-05-04T02:30:00Z',
      title: 'Notification B',
      content: 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
      imageURL: '',
      isRead: true,
    ),
    AppNotification(
      date: '2023-05-04T02:30:00Z',
      title: 'Notification C',
      content:
          'Cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccsdfsdkfhsj dlfjsdlkfj ldskjfkdsjf lkdsj fklsdj flksdj fklsdj flksdj flkdsjf lksdj fldsfjsdlkfjsdlj flsdkj fldskfjsdlkfjsdlkccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc',
      imageURL: '',
      isRead: true,
    ),
    AppNotification(
      date: '2023-05-04T02:30:00Z',
      title: 'Notification A',
      content: 'aaaaaaaa',
      imageURL: '',
      isRead: true,
    ),
    AppNotification(
      date: '2023-05-04T02:30:00Z',
      title: 'Notification B',
      content: 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
      imageURL: '',
      isRead: true,
    ),
    AppNotification(
      date: '2023-05-04T02:30:00Z',
      title: 'Notification C',
      content:
          'Cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccsdfsdkfhsj dlfjsdlkfj ldskjfkdsjf lkdsj fklsdj flksdj fklsdj flksdj flkdsjf lksdj fldsfjsdlkfjsdlj flsdkj fldskfjsdlkfjsdlkccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc',
      imageURL: '',
      isRead: true,
    ),
    AppNotification(
      date: '2023-05-04T02:30:00Z',
      title: 'Notification A',
      content: 'aaaaaaaa',
      imageURL: '',
      isRead: true,
    ),
    AppNotification(
      date: '2023-05-04T02:30:00Z',
      title: 'Notification B',
      content: 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
      imageURL: '',
      isRead: true,
    ),
    AppNotification(
      date: '2023-05-04T02:30:00Z',
      title: 'Notification C',
      content:
          'Cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccsdfsdkfhsj dlfjsdlkfj ldskjfkdsjf lkdsj fklsdj flksdj fklsdj flksdj flkdsjf lksdj fldsfjsdlkfjsdlj flsdkj fldskfjsdlkfjsdlkccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc',
      imageURL: '',
      isRead: true,
    ),
  ];

  NotificationsCubit({NotificationsRepository? notificationsRepository})
      : super(const NotificationsState.initial()) {
    // _notificationsRepository =
    //     notificationsRepository ?? GetIt.I.get<NotificationsRepository>();
  }

  Future nextPage() async {
    emit(const NotificationsState.loadingMoreResult());
    await Future.delayed(const Duration(seconds: 1));
    emit(const NotificationsState.noMoreResult());
  }
}
