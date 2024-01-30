
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medi_meet/domain/domain.dart';
import 'package:medi_meet/presentation/providers/providers.dart';

final especilidadesMedicasProvider = StateNotifierProvider<EspeciliadesMedicasNotifier,List<EspMedica>>((ref) {
  final repository = ref.watch(clinicaRepositoryProvider);
  return EspeciliadesMedicasNotifier(repository: repository);
});



class EspeciliadesMedicasNotifier extends StateNotifier<List<EspMedica>> {
  final ClinicaRepository repository;
  EspeciliadesMedicasNotifier({required this.repository}): super([]);
  
  Future<void> loadMoreEspMed()async{
    final espMedicas = await repository.getEspecMedicas();
    state = [...espMedicas];
  }


}