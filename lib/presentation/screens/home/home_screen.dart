import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medi_meet/config/config.dart';
import 'package:medi_meet/domain/domain.dart';
import 'package:medi_meet/presentation/providers/providers.dart';
import 'package:medi_meet/presentation/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final themeProvider = ref.watch(darkThemeProvider);
    final usuario = ref.watch(userFuntionsProvider)[0];
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        actions: [

          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {
              
            }, 
          ),

          IconButton(
            icon: themeProvider 
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode),
            onPressed: (){
              ref.read(darkThemeProvider.notifier).update((state) => !state);
            }
          ),

           Padding(
             padding: const EdgeInsets.all(10),
             child: CircleAvatar(
                backgroundImage: NetworkImage(usuario.imageUrl),
             ),
           )

        ],
      ),

      drawer: MenuLateral(scaffoldKey: scaffoldKey),

      body: SingleChildScrollView(child: _HomeView(usuario: usuario,)),
    );
  }
}

class _HomeView extends StatelessWidget {
  final Usuario usuario;
  const _HomeView({
    required this.usuario
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
      
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('Hola, ',style: textStyle.titleLarge,),
                Text(usuario.names,style: textStyle.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600
                ),),
              ],
            ),
          ),
          
          const SizedBox(height: 10,),
          
          ...appHomeCard.map(
            (e) => HomeCard(
              title: e.title, 
              caption: e.caption, 
              url: e.url, 
              image: e.image, 
              color: e.color
            )
          )
      
        ],
      ),
    );
  }
}