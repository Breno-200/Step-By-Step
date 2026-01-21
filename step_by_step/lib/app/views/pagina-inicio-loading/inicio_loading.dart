import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class InicioLoading extends StatefulWidget {
  const InicioLoading({super.key});

  @override
  State<InicioLoading> createState() => _InicioLoadingState();
}

class _InicioLoadingState extends State<InicioLoading> {
  double opacidade = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        opacidade = 1.0;
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      context.go('/home');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: opacidade,
          duration: Duration(seconds: 3),
          child: Text(
            'Bem Vindo!',
            style: GoogleFonts.workSans(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
