import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medi_meet/presentation/providers/providers.dart';
import 'package:medi_meet/presentation/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final themeProvider = ref.watch(darkThemeProvider);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(

      appBar: AppBar(
        title: Text('MediMeet',style: textTheme.titleLarge,),
        actions: [
          IconButton(
            icon: themeProvider 
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode),
            onPressed: (){
              ref.read(darkThemeProvider.notifier).update((state) => !state);
            }
          )
        ],
      ),

      drawer: const MenuLateral(),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          Placeholder()

        ],
      ),
    );
  }
}