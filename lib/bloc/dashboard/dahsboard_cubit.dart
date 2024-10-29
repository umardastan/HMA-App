

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/dashboard/dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());

  // Memanggil metode ini untuk memulai animasi
  void startAnimation() {
    emit(state.copyWith(isStartAnimation: true));
  }

  // Reset animasi jika diperlukan
  void resetAnimation() {
    emit(state.copyWith(isResetAnimation: true));
  }
}
