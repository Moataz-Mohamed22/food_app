import 'package:injectable/injectable.dart';

import '../data_source/firebase_auth_service.dart';
import '../models/user_model.dart';
@injectable
class AuthRepository {
  final FirebaseAuthService firebaseAuthService;

  AuthRepository(this.firebaseAuthService);

  Future<UserModel> login(String email, String password) async {
    final user = await firebaseAuthService.login(email, password);
    return UserModel.fromFirebase(user);
  }

  Future<UserModel> register(String name, String email, String password) async {
    final user = await firebaseAuthService.register(email, password );
    return UserModel.fromFirebase(user);
  }

  Future<void> logout() async {
    await firebaseAuthService.signOut();
  }
}
