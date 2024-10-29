import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:login/bloc/login/login_cubit.dart';
import 'package:login/bloc/login/login_state.dart';
import 'package:login/screens/components/custom_snackbar.dart';
import 'package:login/utils/constants/colors.dart';

import 'components/text_input.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.isSuccess) {
              // Navigasi ke layar lain jika login berhasil
              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(
              //     content: Text('Login berhasil!'),
              //     behavior: SnackBarBehavior.floating,
              //     margin: EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
              //   ),
              // );
              cShowTopSnackBar(context, 'Login Berhasil!!!');
            }
            if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                // Background Gradient Abstrak
                SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    child: Image.asset(
                      'assets/images/bg_login.jpg',
                      fit: BoxFit.contain,
                    )),
                // Container(
                //   decoration: const BoxDecoration(
                //     gradient: LinearGradient(
                //       begin: Alignment.topLeft,
                //       end: Alignment.bottomRight,
                //       colors: [
                //         Color(0xFF0093E9), // Warna biru muda
                //         Color(0xFF80D0C7), // Warna hijau kebiruan
                //       ],
                //     ),
                //   ),
                // ),

                // Garis Melengkung di Kiri Atas dengan ClipPath
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClipPath(
                      clipper: CustomClipPathTop(),
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.yellow,
                      )),
                ),

                // Garis Melengkung di Atas dengan CustomPainter
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: CustomPaint(
                    size: Size(
                        MediaQuery.of(context).size.width, 150), // Tinggi kurva
                    painter: CurvePainter(),
                  ),
                ),
                // Form Login
                Center(
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black.withOpacity(0.1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: ColorApp.appNameColor,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 45,
                                    child: InputText(
                                      controller: _usernameController, icon: Icons.person_2_rounded,
                                    )),
                                const Gap(20),
                                SizedBox(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 45,
                                    child: InputText(
                                      controller: _passwordController,
                                      isPassword: true,
                                      icon: Icons.visibility_off,
                                    )),
                                const SizedBox(height: 20),
                                state.isLoading
                                    ? const CircularProgressIndicator()
                                    : SizedBox(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 45,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            final username =
                                                _usernameController.text;
                                            final password =
                                                _passwordController.text;
                                            context.read<LoginCubit>().login(
                                                context, username, password);
                                            // Aksi login
                                          },
                                          style: ElevatedButton.styleFrom(
                                            // padding: const EdgeInsets.symmetric(
                                            //     horizontal: 50, vertical: 15),
                                            backgroundColor:
                                                ColorApp.materialDark,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ), // Warna hijau kebiruan
                                          ),
                                          child: const Text(
                                            'Login', style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}

// CustomPainter untuk menggambar kurva melengkung di bagian atas layar
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue // Warna kurva
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
        size.width * 0.5, size.height - 100, size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CurvePainterCustom extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue // Warna kurva
      ..strokeWidth = 4.0
      ..strokeWidth = 4.0 // Ketebalan garis
      ..style = PaintingStyle.stroke; // Menggambar garis (bukan mengisi)
    // ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height / 2); // Mulai dari titik kiri tengah
    // Menggambar kurva dengan titik kontrol
    path.quadraticBezierTo(
      size.width * 0.25, // Titik kontrol (tengah horizontal)
      size.height / 10, // Titik kontrol (vertikal - lebih tinggi)
      size.width * 0.5, // Titik akhir (kanan)
      size.height / 2, // Titik akhir (tengah vertikal)
    );
    // path.quadraticBezierTo(
    //     size.width * 0.5, size.height - 100, size.width, size.height * 0.5);
    // path.lineTo(
    //     size.width, size.height / 2); // Menggambar garis lurus ke kanan tengah
    // path.moveTo(0, size.height);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);
    // path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// CustomClipper untuk membuat bentuk melengkung
class CustomClipPathTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 200);
    path.lineTo(200, size.width);
    path.quadraticBezierTo(
        size.width, size.height - 100, size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CustomClipPathBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width * 0.5, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
