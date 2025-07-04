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
import '../data/data_source/local_data_source/auth/auth_local_data_source_contract.dart'
    as _i69;
import '../data/data_source/local_data_source/auth/auth_local_data_source_contract_impl.dart'
    as _i767;
import '../data/data_source/remote_data_source/auth/auth_remote_data_source_contract.dart'
    as _i121;
import '../data/data_source/remote_data_source/auth/auth_remote_data_source_contract_impl.dart'
    as _i570;
import '../data/repositories/auth_repository_impl.dart' as _i74;
import '../domain/repositories/auth_repository.dart' as _i800;
import '../domain/use_cases/auth/login_use_case.dart' as _i132;
import '../domain/use_cases/auth/register_use_case.dart' as _i961;
import '../presentation/ui/clinics/managers/clinics_page_view_model.dart'
    as _i735;
import '../presentation/ui/dash_board/manager/dash_board_page_view_model.dart'
    as _i977;
import '../presentation/ui/doctors/managers/doctors_page_view_model.dart'
    as _i756;
import '../presentation/ui/home/managers/home_screen_view_model.dart' as _i835;
import '../presentation/ui/login/managers/login_screen_view_model.dart'
    as _i139;
import '../presentation/ui/login/managers/login_text_controllers_manager.dart'
    as _i256;
import '../presentation/ui/patients/managers/patients_page_view_model.dart'
    as _i823;
import '../presentation/ui/profile/managers/profile_page_view_model.dart'
    as _i78;
import '../presentation/ui/register/manager/register_page_view_model.dart'
    as _i96;
import '../presentation/ui/reports/managers/reports_page_view_model.dart'
    as _i384;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.factory<_i835.HomeScreenViewModel>(() => _i835.HomeScreenViewModel());
    gh.factory<_i823.PatientsPageViewModel>(
      () => _i823.PatientsPageViewModel(),
    );
    gh.factory<_i977.DashBoardPageViewModel>(
      () => _i977.DashBoardPageViewModel(),
    );
    gh.factory<_i735.ClinicsPageViewModel>(() => _i735.ClinicsPageViewModel());
    gh.factory<_i78.ProfilePageViewModel>(() => _i78.ProfilePageViewModel());
    gh.factory<_i756.DoctorsPageViewModel>(() => _i756.DoctorsPageViewModel());
    gh.factory<_i384.ReportsScreeViewModel>(
      () => _i384.ReportsScreeViewModel(),
    );
    gh.singleton<_i891.LanguageProvider>(() => _i891.LanguageProvider());
    gh.singleton<_i578.ThemeProvider>(() => _i578.ThemeProvider());
    gh.singleton<_i256.LoginTextControllerManager>(
      () => _i256.LoginTextControllerManager(),
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dioProvider());
    gh.factory<_i69.AuthLocalDataSourceContract>(
      () => _i767.AuthLocalDataSourceImpl(),
    );
    gh.factory<_i121.AuthRemoteDataSourceContract>(
      () => _i570.AuthRemoteDataSourceContractImpl(gh<_i93.ApiManager>()),
    );
    gh.factory<_i96.RegisterPageViewModel>(
      () => _i96.RegisterPageViewModel(gh<_i961.RegisterUseCase>()),
    );
    gh.factory<_i800.AuthRepository>(
      () => _i74.AuthRepositoryImpl(
        gh<_i121.AuthRemoteDataSourceContract>(),
        gh<_i69.AuthLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i132.LoginUseCase>(
      () => _i132.LoginUseCase(gh<_i800.AuthRepository>()),
    );
    gh.factory<_i139.LoginScreenViewModel>(
      () => _i139.LoginScreenViewModel(gh<_i132.LoginUseCase>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i228.NetworkModule {}
