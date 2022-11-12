import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mova/core/resources/strings_manager.dart';
import 'package:mova/core/network/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../dependency_container.dart';

abstract class BaseLocalDataSource {
  Future<Unit> cacheUser(String userEmail);
  Future<Unit> getCachedUser();
}

class LocalDataSource implements BaseLocalDataSource {
  @override
  Future<Unit> cacheUser(String userEmail) async {
    await sl<SharedPreferences>()
        .setString(StringsManager.userCachedEmailKey, userEmail);
    return Future.value(unit);
  }

  @override
  Future<Unit> getCachedUser() async {
    final cachedData =
        sl<SharedPreferences>().getString(StringsManager.userCachedEmailKey);
    if (cachedData != null) {
      return Future.value(unit);
    } else {
      throw EmptyCacheException();
    }
  }
}
