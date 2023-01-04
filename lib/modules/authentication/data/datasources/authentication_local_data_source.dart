import 'package:dartz/dartz.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/network/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../dependency_container.dart';

abstract class BaseLocalDataSource {
  Future<Unit> cacheUser(String userEmail);
  Future<Unit> getCachedUser();
  Future<Unit> deleteUserCachedData();
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

  @override
  Future<Unit> deleteUserCachedData() async {
      await sl<SharedPreferences>().remove(StringsManager.userCachedEmailKey);
      return Future.value(unit);    
  }
}
