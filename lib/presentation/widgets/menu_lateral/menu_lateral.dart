import 'package:flutter/material.dart';
import 'package:medi_meet/presentation/widgets/widgets.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({super.key});

  @override
  State<MenuLateral> createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        selectedIndex = value;
        setState(() {
          
        });
      },
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('MediMeet',style: textStyle.titleLarge,),
        ),
        
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(),
        ),

        const NavigationDrawerDestination(
          icon: Icon(Icons.abc_outlined), 
          label: Text('Inicio'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.abc_outlined), 
          label: Text('Inicio'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.abc_outlined), 
          label: Text('Inicio'),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Otras opciones'),
        ),

        const Divider(),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomFilledButton(
            label: 'Cerrar Session',
            onPressed: () {
          
            },
          ),
        )

      ],
    );
  }
}