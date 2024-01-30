import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medi_meet/config/config.dart';
import 'package:medi_meet/domain/domain.dart';
import 'package:medi_meet/presentation/providers/providers.dart';
import 'package:medi_meet/presentation/widgets/widgets.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(especilidadesMedicasProvider.notifier).loadMoreEspMed();
    ref.read(getNoticiasProvider.notifier).loadNoticias();
  }

  Future<void> recargarHome()async{
    await ref.read(getNoticiasProvider.notifier).loadNoticias();
    await ref.read(especilidadesMedicasProvider.notifier).loadMoreEspMed();
  }


  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final themeProvider = ref.watch(darkThemeProvider);
    final usuario = ref.watch(userFuntionsProvider)[0];
    final espMedicas = ref.watch(especilidadesMedicasProvider);
    final noticias = ref.watch(getNoticiasProvider);

    if (espMedicas.isEmpty || noticias.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(),),
      );
    }


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

      body: RefreshIndicator(
        onRefresh: () {
          return recargarHome();
        },
        child: ListView(
          children: [
            _HomeView(
              usuario: usuario,
              espMedicas: espMedicas,
              noticias: noticias,
            )
          ],
        )
      ),


    );
  }
}

class _HomeView extends StatelessWidget {
  final Usuario usuario;
  final List<EspMedica> espMedicas;
  final List<Noticia> noticias;
  const _HomeView({
    required this.usuario,
    required this.espMedicas,
    required this.noticias
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
      
          _Saludo(textStyle: textStyle, usuario: usuario),

          const SizedBox(height: 10,),

          NoticiasScrollView(noticias: noticias),
          
          const SizedBox(height: 10,),

          EspecialidadesScrollView(espMedicas: espMedicas),
          
          const SizedBox(height: 20,),
          
          
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

class _Saludo extends StatelessWidget {
  const _Saludo({
    required this.textStyle,
    required this.usuario,
  });

  final TextTheme textStyle;
  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Hola, ',style: textStyle.titleLarge,),
        Text(usuario.names,style: textStyle.titleLarge?.copyWith(
            fontWeight: FontWeight.w600
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}