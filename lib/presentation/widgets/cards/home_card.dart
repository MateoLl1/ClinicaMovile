
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String caption;
  final String url;
  final String image;
  final Color color;

  const HomeCard({
    super.key, 
    required this.title, 
    required this.caption, 
    required this.url, 
    required this.image, 
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        context.push(url);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        width: double.infinity,
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: color
        ),
        child:  Row(
          children: [
        
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,style: textStyle.labelLarge),
                  Text(
                    caption,
                    style: textStyle.labelMedium,
                  ),
                ],
              ),
            ),
      
            const SizedBox(width: 5,),
      
            Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}