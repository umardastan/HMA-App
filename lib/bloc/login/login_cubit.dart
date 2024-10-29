

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:login/bloc/login/login_state.dart';
import 'package:login/router/app_routes.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> login(
      BuildContext context, String username, String password) async {
    emit(state.copyWith(isLoading: true));
    // Simulasi login API call
    // Map body = {
    //   "nip": username,
    //   "password": password,
    // };
    // var response =
    //     await RequestApi().postRaw(ConstantVar.login, null, body, '');
    // var result = json.decode(response!.body);
    // print(response.statusCode);
    // print('ini hasilnya =>> $result');

    // await Future.delayed(const Duration(seconds: 2));
    // final Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    // final SharedPreferences prefs = await prefs0;
    // response.statusCode == 200
    if (username == '123456' && password == '123') {
      // Helper().saveToken(result['token']);
      // Helper().saveDataUser(jsonEncode(result['user']));
      // Helper().saveInitialLocation(Routes.MAINPAGE);

      emit(state.copyWith(isLoading: false, isSuccess: true));
      context.go(Routes.MAINPAGE);
    } else {
      emit(state.copyWith(
          isLoading: false,
          errorMessage: 'Login gagal. Username atau password salah.'));
      emit(state.copyWith(errorMessage: ''));
    }
  }
}
