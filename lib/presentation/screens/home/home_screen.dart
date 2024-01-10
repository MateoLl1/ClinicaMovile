import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medi_meet/config/config.dart';
import 'package:medi_meet/presentation/providers/providers.dart';
import 'package:medi_meet/presentation/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final themeProvider = ref.watch(darkThemeProvider);
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

           const Padding(
             padding: EdgeInsets.all(10),
             child: CircleAvatar(),
           )

        ],
      ),

      drawer: MenuLateral(scaffoldKey: scaffoldKey),

      body: const SingleChildScrollView(child: _HomeView()),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

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
                Text('Mateo!',style: textStyle.titleLarge?.copyWith(
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