
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/dashboard/dahsboard_cubit.dart';
import 'package:login/bloc/dashboard/dashboard_state.dart';
import 'package:login/screens/components/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DashboardCubit(),
        child: BlocConsumer<DashboardCubit, DashboardState>(
            listener: (BuildContext context, DashboardState state) {
          if (state.isStartAnimation) {
            context.read<DashboardCubit>().resetAnimation();
          }
        }, builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Bagian Card di bawah
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: const [
                      DashboardCard(
                        icon: Icons.pie_chart,
                        title: 'Asset & ATK',
                        subtitle: 'View all statistics',
                        color: Colors.orangeAccent,
                      ),
                      DashboardCard(
                        icon: Icons.people,
                        title: 'ATK Permintaan',
                        subtitle: 'Manage users',
                        color: Colors.greenAccent,
                      ),
                      DashboardCard(
                        icon: Icons.shopping_cart,
                        title: 'CA',
                        subtitle: 'Track your orders',
                        color: Colors.blueAccent,
                      ),
                      DashboardCard(
                        icon: Icons.attach_money,
                        title: 'DAR',
                        subtitle: 'Check earnings',
                        color: Colors.purpleAccent,
                      ),
                      DashboardCard(
                        icon: Icons.attach_money,
                        title: 'Event',
                        subtitle: 'Check earnings',
                        color: Colors.purpleAccent,
                      ),
                      DashboardCard(
                        icon: Icons.attach_money,
                        title: 'Form Izin',
                        subtitle: 'Check earnings',
                        color: Colors.purpleAccent,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
