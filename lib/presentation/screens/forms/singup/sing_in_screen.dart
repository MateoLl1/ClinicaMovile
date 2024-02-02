// ignore_for_file: unused_element, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_meet/domain/domain.dart';
import 'package:medi_meet/presentation/painters/painters.dart';
import 'package:medi_meet/presentation/providers/auth/usuario_provider.dart';
import 'package:medi_meet/presentation/widgets/widgets.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomPaint(
        size: Size(size.width, size.height),
        painter: RegisterPainter(
          color: colors.primary,
          color2: colors.onSurface,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    IconButton(
                      color: colors.background,
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 40,
                      ),
                      onPressed: () => context.pop(),
                    ),
                    Text(
                      'Registro',
                      style: textStyle.titleLarge!
                          .copyWith(color: colors.background),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: size.height * .15),
                  child: const SingInFormView())
            ],
          ),
        ),
      ),
    );
  }
}

class SingInFormView extends ConsumerStatefulWidget {
  const SingInFormView({
    super.key,
  });

  @override
  SingInFormViewState createState() => SingInFormViewState();
}

enum SexoEnum { hombre, mujer }

final _formKey = GlobalKey<FormState>();
SexoEnum genero = SexoEnum.hombre;
String _names = '';
String _cedula = '';
String _email = '';
String _dateFn = '';
String _sexo = '';

class SingInFormViewState extends ConsumerState<SingInFormView> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Divider(),
          CustomTextFormField(
            label: 'Nombre y apellido',
            hintText: 'Mateo Llerena',
            icon: Icons.person,
            onChanged: (value) {
              _names = value.trim();
              _formKey.currentState!.validate();
            },
            validator: (value) {
              if (value == null) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              final nameRegex = RegExp(r'^[a-zA-Z]+\s[a-zA-Z]+$');
              if (!nameRegex.hasMatch(value.trim())){
                return 'Debe contener nombre y apellido';
              }
              if (value.trim().length < 7) return 'Al menos 7 caracteres';
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Cedula',
            keyboardTypeNumber: true,
            icon: Icons.credit_card,
            onChanged: (value) {
              _cedula = value.trim();
              _formKey.currentState!.validate();
            },
            validator: (value) {
              if (value == null) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              if (!validarCedula(value.trim())) return 'Cedula invalida';
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            label: 'Correo electronico',
            icon: Icons.email,
            hintText: 'ejemplo@gmail.com',
            onChanged: (value) {
              _email = value.trim();
              _formKey.currentState!.validate();
            },
            validator: (value) {
              if (value == null) return 'Campo requerido';
              if (value.trim().isEmpty) return 'Campo requerido';
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if (!emailRegExp.hasMatch(value.trim())) return 'Email invalido';
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomDateForm(
            label: 'Fecha de nacimiento',
            mode: DateTimeFieldPickerMode.date,
            onChanged: (value) {
              _dateFn = value.toString();
              _formKey.currentState!.validate();
            },
            validator: (value) {
              if (value == null) return 'Escoja una fecha';
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ExpansionTile(
            leading: const Icon(Icons.wc),
            title: const Text('Sexo'),
            subtitle: Text(genero.name),
            children: [
              RadioListTile(
                title: const Text('Femenino'),
                value: SexoEnum.mujer,
                groupValue: genero,
                onChanged: (value) {
                  genero = SexoEnum.mujer;
                  setState(() {});
                },
              ),
              RadioListTile(
                title: const Text('Masculino'),
                value: SexoEnum.hombre,
                groupValue: genero,
                onChanged: (value) {
                  genero = SexoEnum.hombre;
                  setState(() {});
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: double.infinity,
              child: CustomFilledButton(
                label: 'Registrarme',
                onPressed: ()async {
                  final isValidForm = _formKey.currentState?.validate();
                  if (!isValidForm!) return;
                  final user = Usuario(
                    names: _names, 
                    email: _email, 
                    cedula: _cedula, 
                    fechaN: _dateFn, 
                    sexo: (genero == SexoEnum.hombre)
                    ? Genero.masculino : Genero.femenino
                  );
                  
                  final result = await ref.read(userFuntionsProvider.notifier).register(user);
                  if (result) {
                    scaffoldMessage(context, 'Registrado');
                    context.go('/home');
                  }else{
                    scaffoldMessage(context, 'Usuario ya exite');
                  }

                },
              )),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
