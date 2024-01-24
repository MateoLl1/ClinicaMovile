
// ignore_for_file: unused_element, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_meet/infrastructure/datasources/medi_meet_datasource.dart';
import 'package:medi_meet/presentation/painters/painters.dart';
import 'package:medi_meet/presentation/widgets/widgets.dart';

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
          
              
          
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height*.3),
                child: const _LoginFormView(),
              )
          
          
            ]
          ),
        ),
      ),
    );
  }
}

class _LoginFormView extends ConsumerStatefulWidget {
  const _LoginFormView();

  @override
  _LoginFormViewState createState() => _LoginFormViewState();
}
final _formKey = GlobalKey<FormState>();
String _email = '';
String _password = '';
class _LoginFormViewState extends ConsumerState<_LoginFormView> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Iniciar sesión', style: textStyle.titleLarge,),
          const SizedBox(height: 10,),
      
          CustomTextFormField(
            label: 'Correo electronico',
            hintText: 'ejemplo@gmail.com',
            icon: Icons.person,
            onChanged: (value) {
              _email = value.trim();
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if ( value == null ) return 'Campo requerido';
              if ( value.trim().isEmpty ) return 'Campo requerido';
              final emailRegExp = RegExp(
              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if (!emailRegExp.hasMatch(value.trim())) return 'Email invalido';
              return null;
            },
          ),
          const SizedBox(height: 20,),
      
          CustomTextFormField(
            label: 'Contraseña',
            icon: Icons.key,
            obscureText: true,
            onChanged: (value) {
              _password = value.trim();
              _formKey.currentState?.validate();
            },
            validator: (value) {
              if ( value == null ) return 'Campo requerido';
              if ( value.trim().isEmpty ) return 'Campo requerido';
              return null;
            },
          ),
          const SizedBox(height: 5,),
      
          InkWell(
            onTap: () {
              context.push('/register');
            },
            child: const Text(
              'Crear una cuenta',
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
              onPressed: ()async {
                final isValidForm = _formKey.currentState?.validate();
                if ( !isValidForm! ) return;

                final response = await MediMeetDatasource().validarCredenciales(_email, _password);
                scaffoldMessage(context, response);
                if (response == 'Bienvenido') {
                  context.go('/dashboard');
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
