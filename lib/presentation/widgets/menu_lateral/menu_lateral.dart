import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_meet/presentation/widgets/widgets.dart';

class MenuLateral extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const MenuLateral({
    super.key, 
    required this.scaffoldKey
  });

  @override
  State<MenuLateral> createState() => _MenuLateralState();
}
final routes = <String>[
  '/setting',
  '/cuenta',
  '/help',
  '/tutorialApp',
];

class _MenuLateralState extends State<MenuLateral> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        selectedIndex = value;
        context.push(routes[value]);
        widget.scaffoldKey.currentState?.closeDrawer();
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
          icon: Icon(Icons.settings), 
          label: Text('Configuración'),
        ),
        const SizedBox(height: 10,),

        const NavigationDrawerDestination(
          icon: Icon(Icons.account_circle), 
          label: Text('Cuenta'),
        ),
        const SizedBox(height: 10,),

        const NavigationDrawerDestination(
          icon: Icon(Icons.help), 
          label: Text('Ayuda'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.help), 
          label: Text('Tutorial app'),
        ),
        const SizedBox(height: 10,),

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
              context.push('/login');
              widget.scaffoldKey.currentState!.closeDrawer();
            },
          ),
        )

      ],
    );
  }
}