// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/api/api_client.dart' as _i4;
import '../data/data_source/remote_data_source/auth_remote_data_source.dart'
    as _i5;
import '../presentation/cubits/comments_cubit/comments_cubit.dart' as _i6;
import 'di_module.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.lazySingleton<_i3.Dio>(() => injectionModule.dio());
    gh.lazySingleton<_i4.ApiClient>(() => _i4.ApiClient(dio: gh<_i3.Dio>()));
    gh.lazySingleton<_i5.AuthRemoteDataSource>(
        () => _i5.AuthRemoteDataSourceImpl(gh<_i4.ApiClient>()));
    gh.factory<_i6.CommentsCubit>(() => _i6.CommentsCubit(gh<_i4.ApiClient>()));
    return this;
  }
}

class _$InjectionModule extends _i7.InjectionModule {}
