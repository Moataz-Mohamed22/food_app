// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/auth/data/data_source/firebase_auth_service.dart'
    as _i576;
import '../../feature/auth/data/repositories/auth_repository.dart' as _i676;
import '../../feature/auth/presentation/manager/auth_cubit.dart' as _i25;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i576.FirebaseAuthService>(() => _i576.FirebaseAuthService());
    gh.factory<_i676.AuthRepository>(
      () => _i676.AuthRepository(gh<_i576.FirebaseAuthService>()),
    );
    gh.factory<_i25.AuthCubit>(
      () => _i25.AuthCubit(gh<_i676.AuthRepository>()),
    );
    return this;
  }
}
