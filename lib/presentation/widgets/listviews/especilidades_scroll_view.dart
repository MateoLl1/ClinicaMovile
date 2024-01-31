
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_meet/domain/domain.dart';
import 'package:medi_meet/presentation/widgets/widgets.dart';

class EspecialidadesScrollView extends StatelessWidget {
  final List<EspMedica> espMedicas;
  const EspecialidadesScrollView({
    super.key,
    required this.espMedicas
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      children: [

        Row(
          children: [

            Text('Especialidades medicas',style: textStyle.bodyMedium,),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios,size: 15,)

          ],
        ),const SizedBox(height: 10,),



        SizedBox(
          height: 80,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: espMedicas.length,
            itemBuilder: (context, index) {
              final especialidad = espMedicas[index];
              return InkWell(
                onTap: () => context.push('/especialidad/$index'),
                child: _Item(especialidad: especialidad,)
              );
            },
          ),
        ),
      ],
    );
  }
}


class _Item extends StatelessWidget {
  final EspMedica especialidad;
  const _Item({
    required this.especialidad
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 100,
      child:  Column(
        children: [
          
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Image.network(
                especialidad.iconUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const SombraCard(
                      width: 60,
                      height: 50,
                    );
                  }
                  return child;
                },
              ),
            ),
          ),
      
          Text(especialidad.name,overflow: TextOverflow.ellipsis,)
      
        ],
      ),
    );
  }
}

