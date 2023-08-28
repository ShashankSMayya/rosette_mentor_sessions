// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/api/api_client.dart' as _i6;
import '../data/data_source/local_data_source/auth_local_data_source.dart'
    as _i3;
import '../data/data_source/remote_data_source/auth_remote_data_source.dart'
    as _i7;
import '../data/data_source/remote_data_source/movie_remote_data_source.dart'
    as _i11;
import '../data/repositories/auth_repository_impl.dart' as _i9;
import '../data/repositories/movie_repository_impl.dart' as _i13;
import '../domain/repositories/auth_repository.dart' as _i8;
import '../domain/repositories/movie_repository.dart' as _i12;
import '../presentation/cubits/comments_cubit/comments_cubit.dart' as _i10;
import '../presentation/cubits/movie_cubit/movie_cubit.dart' as _i14;
import '../presentation/cubits/movie_filter_cubit/movie_filter_cubit.dart'
    as _i5;
import 'di_module.dart' as _i15;

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
    gh.lazySingleton<_i3.AuthLocalDataSource>(
        () => _i3.AuthLocalDataSourceImpl());
    gh.lazySingleton<_i4.Dio>(() => injectionModule.dio());
    gh.factory<_i5.MovieFilterCubit>(() => _i5.MovieFilterCubit());
    gh.lazySingleton<_i6.ApiClient>(() => _i6.ApiClient(gh<_i4.Dio>()));
    gh.lazySingleton<_i7.AuthRemoteDataSource>(
        () => _i7.AuthRemoteDataSourceImpl(gh<_i6.ApiClient>()));
    gh.lazySingleton<_i8.AuthRepository>(() => _i9.AuthRepositoryImpl(
          gh<_i7.AuthRemoteDataSource>(),
          gh<_i3.AuthLocalDataSource>(),
        ));
    gh.factory<_i10.CommentsCubit>(
        () => _i10.CommentsCubit(gh<_i6.ApiClient>()));
    gh.lazySingleton<_i11.MovieRemoteDataSource>(
        () => _i11.MovieRemoteDataSourceImpl(gh<_i6.ApiClient>()));
    gh.lazySingleton<_i12.MovieRepository>(
        () => _i13.MovieRepositoryImpl(gh<_i11.MovieRemoteDataSource>()));
    gh.factory<_i14.MovieCubit>(
        () => _i14.MovieCubit(gh<_i12.MovieRepository>()));
    return this;
  }
}

class _$InjectionModule extends _i15.InjectionModule {}
