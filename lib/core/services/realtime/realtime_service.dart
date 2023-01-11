import 'dart:async';

import 'package:auto_route_generator/utils.dart';
import 'package:firebase_database/firebase_database.dart';

class RealTimeDatabaseRepo {
  RealTimeDatabaseRepo();

  Future<bool> tryToLoginAccount(String userID, signOutFunction) async {
    final realtimeUserReference =
        FirebaseDatabase.instance.ref('users/$userID/');

    Stream checkUserCountStream = realtimeUserReference.onValue;

    realtimeUserReference.onValue.listen((DatabaseEvent event) async {
      if (event.snapshot.value == 0) {
        print(event.snapshot.value);
        print(event);
        await realtimeUserReference.set(ServerValue.increment(1))
            // ignore: void_checks
            .onError((error, stackTrace) {
          throwError(error.toString());
          return true;
        });
      } else if (event.snapshot.value == 1) {
        await realtimeUserReference.set(ServerValue.increment(-1));
        signOutFunction;
      }
    });

    return false;
  }

  void checkUserSubscription(String userID, signOut) async {
    final realtimeUserReference =
        FirebaseDatabase.instance.ref('users/$userID/');

    Stream checkUserCountStream = realtimeUserReference.onValue;

    checkUserCountStream.listen((event) {
      print(event);
      if (event == 1) {
        signOut;
      }
    });
  }
}
