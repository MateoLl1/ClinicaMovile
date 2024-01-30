import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';

class SliderInfo {
  final String title;
  final String caption;
  final String image;

  SliderInfo({
    required this.title, 
    required this.caption, 
    required this.image
  });
}

final List<SliderInfo> appTutotialInfo = [
  SliderInfo(
    title: "Bienvenido a MediMeet",
    caption: "Tu compañero de confianza en el cuidado médico personalizado.",
    image: "assets/images/slider/1.jpg",
  ),
  SliderInfo(
    title: "Consulta Médica Virtual",
    caption: "Accede a consultas médicas desde la comodidad de tu hogar.",
    image: "assets/images/slider/2.jpg",
  ),
  SliderInfo(
    title: "Historial de Salud Digital",
    caption: "Mantén un seguimiento fácil de tu historial médico y citas.",
    image: "assets/images/slider/3.jpg",
  ),
];


class TutorialAppScreen extends StatefulWidget {
  const TutorialAppScreen({super.key});

  @override
  State<TutorialAppScreen> createState() => _TutorialAppScreenState();
}
class _TutorialAppScreenState extends State<TutorialAppScreen> {

final PageController controller = PageController();
bool inFinal = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      final page = controller.page ?? 0;
      if (page >= 1.8 ) {
        inFinal = true;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          PageView(
            controller: controller,
            children: [
          
              
              ...appTutotialInfo.map((e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _SliderView(slide: e),
              ))
          
            ],
          ),


          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.go('/home'), 
            )
          ),


          inFinal ? Positioned(
            bottom: 50,
            right: 30,
            child: FadeInRight(
              duration: const Duration(seconds: 2),
              from: 20,
              child: FilledButton(
                child: const Text('Comenzar'),
                onPressed: () => context.go('/home'), 
              ),
            )
          ): const SizedBox(),



        ],
      ),
    );
  }
}

class _SliderView extends StatelessWidget {
  final SliderInfo slide;
  const _SliderView({required this.slide});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: colors.background
            ),
            child: FadeIn(
              child: Image(
                image: AssetImage(slide.image),
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10,),

        Align(
          alignment: Alignment.centerLeft,
          child: Text(slide.title,style: textStyle.titleLarge,)
        ),
        Text(slide.caption,style: textStyle.bodyMedium,),

      ],
    );
  }
}

