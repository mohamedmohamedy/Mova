part of 'caching_user_data_bloc.dart';

abstract class CachingUserDataEvent extends Equatable {
  const CachingUserDataEvent();

  @override
  List<Object> get props => [];
}
class CacheUserDataEvent extends CachingUserDataEvent {
  final String userEmail;
  const CacheUserDataEvent({required this.userEmail});
}

class GetCachedUserDataEvent extends CachingUserDataEvent {}

class DeleteCachedUserDataEvent extends CachingUserDataEvent {}
