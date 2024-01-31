
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medi_meet/domain/entities/noticia.dart';
import 'package:medi_meet/presentation/providers/providers.dart';

class NoticiaScreen extends ConsumerWidget {
  final String id;
  const NoticiaScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context,ref) {
    final noticia = ref.watch(getNoticiasProvider)[int.parse(id)];
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => _NoticiaDetails(noticia: noticia)
            )
          )
      
        ],
      ),
    );
  }
}

class _NoticiaDetails extends StatelessWidget {
  const _NoticiaDetails({
    required this.noticia,
  });

  final Noticia noticia;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      children: [
    
        Container(
          width: double.infinity,
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.black26
          ),
          child: Image.network(
            noticia.imageUrl,
            fit: BoxFit.cover,
            height: 300,
          )
        ),
    
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(noticia.title, style: textStyle.titleLarge,),
        ),
        
        const SizedBox(height: 10,),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(noticia.content,textAlign: TextAlign.justify,),
        ),
    
      ],
    );
  }
}