
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_meet/presentation/painters/painters.dart';
import 'package:medi_meet/presentation/widgets/custom_button/custom_filled_button.dart';
import 'package:medi_meet/presentation/widgets/custom_text_form/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorList = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomPaint(
        size: Size(size.width, size.height),
        painter: LoginPainter(
          color1: colorList.primary,
          color2: colorList.onSurface
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
          
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 40,
                    color: colorList.background,
                  ),
                  onPressed: () =>  context.pop(), 
                ),
              ),
          
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height*.22),
                child: const _LoginFormView(),
              )
          
          
            ]
          ),
        ),
      ),
    );
  }
}

class _LoginFormView extends StatelessWidget {
  const _LoginFormView();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Iniciar sesión', style: textStyle.titleLarge,),
        const SizedBox(height: 10,),

        const CustomTextFormField(
          label: 'Correo electronico',
          hintText: 'ejemplo@gmail.com',
          icon: Icons.person,

        ),
        const SizedBox(height: 20,),

        const CustomTextFormField(
          label: 'Contraseña',
          icon: Icons.key,
          obscureText: true,
        ),
        const SizedBox(height: 5,),

        InkWell(
          onTap: () {
            
          },
          child: const Text(
            'Crear una cuentas',
            style: TextStyle(
              decoration: TextDecoration.underline
            ),
          ),
        ),
        const SizedBox(height: 10,),

        SizedBox(
          width: double.infinity,
          child: CustomFilledButton(
            label: 'Iniciar',
            onPressed: () {
              
            },
          ),
        )
      ],
    );
  }
}
