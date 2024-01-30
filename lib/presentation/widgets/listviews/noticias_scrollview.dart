
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_meet/domain/domain.dart';
import 'package:medi_meet/presentation/providers/providers.dart';
import 'package:medi_meet/presentation/widgets/widgets.dart';

class NoticiasScrollView extends StatelessWidget {
  final List<Noticia> noticias;
  const NoticiasScrollView({super.key, required this.noticias});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Noticias',style: textStyle.bodyMedium,),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios,size: 15,),
          ],
        ),

        const SizedBox(height: 5,),

        SizedBox(
          width: double.infinity,
          height: 150,
          child: ListView.builder(
            itemCount: noticias.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final noticia = noticias[index];
              return InkWell(
                onTap: () => context.push('/noticias/$index'),
                child: _NoticiaCard(noticia)
              );
            },
          )
        ),

      ],
    );
  }
}

class _NoticiaCard extends ConsumerWidget {
  final Noticia noticia;
  const _NoticiaCard(this.noticia);

  @override
  Widget build(BuildContext context,ref) {
    final textStyle = Theme.of(context).textTheme;
    final darkTheme = ref.watch(darkThemeProvider);
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 200,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: darkTheme 
          ? Colors.white30
          : Colors.black45,
      ),
      child: Stack(
        children: [
    
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              noticia.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 170,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const SombraCard(
                    width: double.infinity, 
                    height: 170
                  );
                }
                return child;
              },
            ),
          ),
    
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26
                )
              ]
            ),
          ),
    
          Positioned(
            bottom: 0,
            right: 5,
            child: SizedBox(
              width: 190,
              child: Text(noticia.title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: textStyle.labelLarge,
              ),
            ),
          ),
    
    
        ],
      ),
    );
  }
}