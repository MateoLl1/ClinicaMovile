import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medi_meet/domain/domain.dart';
import 'package:medi_meet/presentation/providers/providers.dart';

final getNoticiasProvider = StateNotifierProvider<NoticiasNotifier,List<Noticia>>((ref) {
  final repository = ref.watch(clinicaRepositoryProvider);
  return NoticiasNotifier(repository: repository);
});

class NoticiasNotifier extends StateNotifier<List<Noticia>> {
  final ClinicaRepository repository;
  NoticiasNotifier({required this.repository}): super([]);

  Future<void> loadNoticias()async{
    final newNoticias = await repository.getNoticias();
    if (newNoticias.isEmpty) return;
    state = [...newNoticias];
  }

  
}