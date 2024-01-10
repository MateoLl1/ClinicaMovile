import 'package:flutter/material.dart';

class InfoHomeCard {
  final String title;
  final String caption;
  final String url;
  final String image;
  final Color color;

  InfoHomeCard({
    required this.title,
    required this.caption,
    required this.url,
    required this.image,
    required this.color
  });
}


final List<InfoHomeCard> appHomeCard = [

  InfoHomeCard(
    title: 'Agendar una cita', 
    caption: 'Genera tu propia', 
    url: '/cita', 
    image: 'assets/images/cita.png', 
    color: Colors.blue
  ),

  InfoHomeCard(
    title: 'Mi historial', 
    caption: 'Consulta tu historial medico', 
    url: '/cita', 
    image: 'assets/images/historial.png', 
    color: Colors.green
  ),
  InfoHomeCard(
    title: 'Especilidades', 
    caption: 'Nuestras especialidades medicas', 
    url: '/especiliadad', 
    image: 'assets/images/doctor.png', 
    color: Colors.purple
  ),
  InfoHomeCard(
    title: 'Curiosidades', 
    caption: 'Habitos de vida', 
    url: '/habitos', 
    image: 'assets/images/vida.png', 
    color: Colors.redAccent
  ),

];
