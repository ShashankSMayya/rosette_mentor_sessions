// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/api/api_client.dart' as _i7;
import '../data/data_source/local_data_source/auth_local_data_source.dart'
    as _i4;
import '../data/data_source/remote_data_source/auth_remote_data_source.dart'
    as _i8;
import '../data/data_source/remote_data_source/movie_remote_data_source.dart'
    as _i12;
import '../data/repositories/auth_repository_impl.dart' as _i10;
import '../data/repositories/movie_repository_impl.dart' as _i14;
import '../domain/repositories/auth_repository.dart' as _i9;
import '../domain/repositories/movie_repository.dart' as _i13;
import '../presentation/cubits/comments_cubit/comments_cubit.dart' as _i11;
import '../presentation/cubits/movie_cubit/movie_cubit.dart' as _i15;
import '../presentation/cubits/movie_filter_cubit/movie_filter_cubit.dart'
    as _i6;
import '../presentation/routes/app_router.dart' as _i3;
import 'di_module.dart' as _i16;

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
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.lazySingleton<_i4.AuthLocalDataSource>(
        () => _i4.AuthLocalDataSourceImpl());
    gh.lazySingleton<_i5.Dio>(() => injectionModule.dio());
    gh.factory<_i6.MovieFilterCubit>(() => _i6.MovieFilterCubit());
    gh.lazySingleton<_i7.ApiClient>(() => _i7.ApiClient(gh<_i5.Dio>()));
    gh.lazySingleton<_i8.AuthRemoteDataSource>(
        () => _i8.AuthRemoteDataSourceImpl(gh<_i7.ApiClient>()));
    gh.lazySingleton<_i9.AuthRepository>(() => _i10.AuthRepositoryImpl(
          gh<_i8.AuthRemoteDataSource>(),
          gh<_i4.AuthLocalDataSource>(),
        ));
    gh.factory<_i11.CommentsCubit>(
        () => _i11.CommentsCubit(gh<_i7.ApiClient>()));
    gh.lazySingleton<_i12.MovieRemoteDataSource>(
        () => _i12.MovieRemoteDataSourceImpl(gh<_i7.ApiClient>()));
    gh.lazySingleton<_i13.MovieRepository>(
        () => _i14.MovieRepositoryImpl(gh<_i12.MovieRemoteDataSource>()));
    gh.factory<_i15.MovieCubit>(
        () => _i15.MovieCubit(gh<_i13.MovieRepository>()));
    return this;
  }
}

class _$InjectionModule extends _i16.InjectionModule {}
