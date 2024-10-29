

import 'package:equatable/equatable.dart';

class DashboardState extends Equatable {
  final bool isStartAnimation;
  final bool isResetAnimation;
  final List<ChartData> chartData;
  final List<User> userData;

  DashboardState({
    this.isStartAnimation = false,
    this.isResetAnimation = false,
    List<ChartData>? chartData, // Ubah chartData menjadi parameter opsional
    List<User>? userData,
  })  : chartData = chartData ??
            [
              ChartData(DateTime(2024, 1, 1), 35),
              ChartData(DateTime(2024, 2, 1), 28),
              ChartData(DateTime(2024, 3, 1), 34),
              ChartData(DateTime(2024, 4, 1), 32),
              ChartData(DateTime(2024, 5, 1), 40),
            ], // Beri nilai default di sini jika chartData null
        userData = userData ??
            [
              // Beri nilai default di sini jika userData null
              User('John Doe', 30),
              User('Jane Doe', 25),
            ];

  DashboardState copyWith({
    bool? isStartAnimation,
    bool? isResetAnimation,
    List<ChartData>?
        chartData, // Tambahkan chartData di sini jika ingin mengganti datanya
  }) {
    return DashboardState(
      isStartAnimation: isStartAnimation ?? this.isStartAnimation,
      isResetAnimation: isResetAnimation ?? this.isResetAnimation,
      chartData: chartData ?? this.chartData, // Tambahkan chartData ke copyWith
    );
  }

  @override
  List<Object> get props => [isStartAnimation, isResetAnimation, chartData];
}

class ChartData {
  const ChartData(this.x, this.y); // Tetapkan constructor sebagai const
  final DateTime x;
  final double y;
}

class User {
  const User(this.nama, this.umur);
  final String nama;
  final int umur;
}
