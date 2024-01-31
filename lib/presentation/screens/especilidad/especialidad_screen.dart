import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medi_meet/domain/domain.dart';
import 'package:medi_meet/presentation/providers/providers.dart';

class EspecialidadScreen extends ConsumerWidget {
  final String id;
  const EspecialidadScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context,ref) {
    final especiliadad = ref.watch(especilidadesMedicasProvider)[int.parse(id)];
    return Scaffold(
      body: _EspecialidadView(espeliadidad: especiliadad),
    );
  }
}

class _EspecialidadView extends StatelessWidget {
  final EspMedica espeliadidad;
  const _EspecialidadView({required this.espeliadidad});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    return CustomScrollView(
      slivers: [
      
        _CustomSliverAppbar(
          size: size, 
          colors: colors, 
          espeliadidad: espeliadidad, 
          textStyle: textStyle,
        ),


        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) => _EspecilidadContent(espcialidad: espeliadidad,)
          )
        )
      
      ],
    );
  }
}

class _EspecilidadContent extends StatelessWidget {
  final EspMedica espcialidad;
  const _EspecilidadContent({required this.espcialidad});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  espcialidad.imagen2,
                  width: size.width*.4,
                  height: size.height*.3,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10,),

              SizedBox(
                width: size.width*.5,
                height: 270,
                child: SingleChildScrollView(
                  child: Text(
                    espcialidad.descripcion,
                  )
                )
              )
            ],
          ),
          const Divider(),
          const SizedBox(height: 10,),

          Text(espcialidad.subTitle,style: textStyle.titleMedium,),
          const SizedBox(height: 5,),
          Text(espcialidad.parrafo,style: textStyle.bodyMedium,),

          const SizedBox(height: 15,),

          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.tonalIcon(
              icon: const Icon(Icons.abc),
              label: Text('Agendar una cita',style: textStyle.bodyMedium,),
              onPressed: (){}, 
            ),
          )
        ],
      ),
    );
  }
}






class _CustomSliverAppbar extends StatelessWidget {
  const _CustomSliverAppbar({
    required this.size,
    required this.colors,
    required this.espeliadidad,
    required this.textStyle,
  });

  final Size size;
  final ColorScheme colors;
  final EspMedica espeliadidad;
  final TextTheme textStyle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: size.height*.3,
      backgroundColor: colors.onBackground,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 30,
          ),
          onPressed: (){}, 
        )
      
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        background: Stack(
          children: [
        
            SizedBox.expand(
              child: Image.network(
                espeliadidad.imagen1,
                fit: BoxFit.cover,
              )
            ),
    
           const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.black26),
                    BoxShadow(color: Colors.white10),
                  ]
                ),
              ),
            ),
    
            Positioned(
              bottom: 10,
              right: 10,
              child: Text(espeliadidad.name,
                style: textStyle.titleLarge?.copyWith(
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 40
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}