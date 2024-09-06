import 'package:get_it/get_it.dart';
import 'package:spotify_app/core/usecases/auth/signup_usecase.dart';
import 'package:spotify_app/core/usecases/auth/singin_usecase.dart';
import 'package:spotify_app/data/repository/auth/auth_repo_impl.dart';
import 'package:spotify_app/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app/domain/repository/auth/auth_repo.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImplementation(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImplementation(),
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );
}
