import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../data/repositories/auth_repository.dart';
import 'auth_states.dart';
@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit(this.authRepository) : super(AuthInitial());

  final TextEditingController emailController = TextEditingController(text: "moataz@gmail.com");
  final TextEditingController passwordController = TextEditingController(text: "Moataz@1234");
  final TextEditingController nameController = TextEditingController(text: "Moataz Bellah");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  Future<void> login(String email,String password ) async {
    if (formKey.currentState!.validate() ==true) {
      emit(AuthLoading());
    }
    try {
      final user = await authRepository.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
Future<void>register (String name ,String email,String password  )async{
    if (formKey.currentState!.validate()) {
      emit(AuthLoading());
    } try {
      final user = await authRepository.register(
        nameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
}

  Future<void> logout() async {
    await authRepository.logout();
    emit(AuthInitial());
  }
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
