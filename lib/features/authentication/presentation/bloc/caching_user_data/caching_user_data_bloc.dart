import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/global/base_use_case.dart';
import '../../../../../core/utils/request_state.dart';
import '../../../domain/usecases/cache_user_use_case.dart';
import '../../../domain/usecases/get_cached_user_use_case.dart';

part 'caching_user_data_event.dart';
part 'caching_user_data_state.dart';

class CachingUserDataBloc extends Bloc<CachingUserDataEvent, CachingUserDataState> {
   final CacheUserUseCase _cacheUser;
  final GetCachedUserUseCase _getCachedUser;
  CachingUserDataBloc( this._cacheUser,
    this._getCachedUser,) : super(const CachingUserDataState()) {
    on<CacheUserDataEvent>(_cacheUserMethod);
    on<GetCachedUserDataEvent>(_getCachedUserMethod);
  }
  
  //__________________________Cache user data event______________________________________
  FutureOr<void> _cacheUserMethod(
      CacheUserDataEvent event, Emitter<CachingUserDataState> emit) async {
    final result = await _cacheUser(event.userEmail);

    result.fold(
      (failure) => emit(state.copyWith(
        cacheUserDataState: RequestState.error,
        cacheUserDataMessage: failure.errorMessage,
      )),
      (_) => emit(state.copyWith(
        cacheUserDataState: RequestState.success,
      )),
    );
  }

  //__________________________Get cache user data event____________________________________
  FutureOr<void> _getCachedUserMethod(
      GetCachedUserDataEvent event, Emitter<CachingUserDataState> emit) async {
    final result = await _getCachedUser(const NoParameters());

    result.fold(
      (failure) => emit(state.copyWith(
        getCacheUserDataState: RequestState.error,
        getCacheUserDataMessage: failure.errorMessage,
      )),
      (_) => emit(state.copyWith(
        getCacheUserDataState: RequestState.success,
      )),
    );
  }
}
