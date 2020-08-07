// import 'dart:async';

// import 'package:bookingapp/app/data/repositories/groups_respository.dart';
// import 'package:bookingapp/app/data/sync_helpers/group_sync_helper.dart';
// import 'package:bookingapp/globals.dart';
// import 'package:bookingapp/utils/logger.dart';

// enum SynchronizationStatus { inProgress, completed }

// class SynchronizationHelper {
//   factory SynchronizationHelper() {
//     if (_this == null) _this = SynchronizationHelper._();
//     return _this;
//   }
//   final log = getLogger('Synchronisation helper');

//   static SynchronizationHelper _this;
//   SynchronizationHelper._();

//   SynchronizationStatus syncStatus;
//   bool isUserAuthenticated = false;
//   GroupsRepository groupsRepository = GroupsRepository();
//   GroupSynchronizer groupSynchronizer = GroupSynchronizer();

//   startSynchronization() async {
//     log.d("synchronization started");

//     isUserAuthenticated = Globals().currentUser.id != null ? true : false;
//     log.d("authenticated $isUserAuthenticated");
//     if (syncStatus == SynchronizationStatus.inProgress || !isUserAuthenticated)
//       return; //already in progress or not authenticated

//     syncStatus = SynchronizationStatus.inProgress;
//     await synchronize();
//     syncStatus = SynchronizationStatus.completed;
//   }

//   synchronize() async {
//     log.d("synchronization in progress");
//     await checkAndPushGroups();
//   }

//   checkAndPushGroups() async {
//     int unPushedGroupsCount = await groupsRepository.getUnpushedGroupsCount();
//     log.d("unpushed groups count $unPushedGroupsCount");
//     if (unPushedGroupsCount == null || unPushedGroupsCount == 0) return;
//     startPushingGroups();
//   }

//   startPushingGroups() async {
//     await groupSynchronizer.pushGroups();
//     log.d("pushing groups done");
//   }
// }
