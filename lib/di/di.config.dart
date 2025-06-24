// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/providers/language_provider.dart' as _i891;
import '../core/providers/theme_provider.dart' as _i578;
import '../data/api/api_manager.dart' as _i93;
import '../data/api/core/network_module.dart' as _i228;
import '../data/repositories/auth_repository_impl.dart' as _i74;
import '../domain/repositories/auth_repository.dart' as _i800;
import '../presentation/ui/home/managers/home_screen_view_model.dart' as _i835;
import '../presentation/ui/login/managers/login_screen_view_model.dart'
    as _i139;
import '../presentation/ui/login/managers/login_text_controllers_manager.dart'
    as _i256;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.factory<_i139.LoginScreenViewModel>(() => _i139.LoginScreenViewModel());
    gh.factory<_i835.HomeScreenViewModel>(() => _i835.HomeScreenViewModel());
    gh.singleton<_i891.LanguageProvider>(() => _i891.LanguageProvider());
    gh.singleton<_i578.ThemeProvider>(() => _i578.ThemeProvider());
    gh.singleton<_i256.LoginTextControllerManager>(
      () => _i256.LoginTextControllerManager(),
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dioProvider());
    gh.singleton<_i93.ApiManager>(() => _i93.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i800.AuthRepository>(() => _i74.AuthRepositoryImpl());
    return this;
  }
}

class _$NetworkModule extends _i228.NetworkModule {}
