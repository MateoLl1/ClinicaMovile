import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_meet/presentation/painters/painters.dart';
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
                      icon: const Icon(Icons.arrow_back_ios,size: 40,),
                      onPressed: () => context.pop(), 
                    ),
                    Text(
                      'Registro',
                      style: textStyle.titleLarge!.copyWith(
                        color: colors.background
                      ),
                    )
                  ],
                ),
              ),
              
              Padding(
                padding: EdgeInsets.only(top: size.height*.15),
                child: const SingInFormView()
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SingInFormView extends StatefulWidget {
  const SingInFormView({
    super.key,
  });

  @override
  State<SingInFormView> createState() => _SingInFormViewState();
}
enum SexoEnum { hombre , mujer }

SexoEnum genero = SexoEnum.hombre;
class _SingInFormViewState extends State<SingInFormView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const CustomTextFormField(
          label: 'Nombres',
          hintText: 'Daniel Noboa',
          icon: Icons.person
        ),const SizedBox(height: 20,),

        const CustomTextFormField(
          label: 'Cedula',
          keyboardTypeNumber: true,
          icon: Icons.credit_card
        ),const SizedBox(height: 20,),

        const CustomTextFormField(
          label: 'Correo electronico', 
          icon: Icons.email,
          hintText: 'ejemplo@gmail.com',
        ),const SizedBox(height: 20,),


        CustomDateForm(
          label: 'Fecha de nacimiento',
          mode: DateTimeFieldPickerMode.date,
          onChanged: (p0) {
            
          },
        ),const SizedBox(height: 10,),

        ExpansionTile(
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
        ),const SizedBox(height: 10,),

        SizedBox(
          width: double.infinity,
          child: CustomFilledButton(
            label: 'Registrarme',
            onPressed: (){},
          )
        ),

        const SizedBox(height: 30,),
      ],
    );
  }
}