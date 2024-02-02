
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medi_meet/domain/domain.dart';
import 'package:medi_meet/presentation/providers/providers.dart';

final userFuntionsProvider = StateNotifierProvider<UsuarioNotifier,List<Usuario>>((ref) {
  final repository = ref.watch(clinicaRepositoryProvider);
  return UsuarioNotifier(repository: repository);
});


typedef UserCallback = Future<List<Usuario>> Function(String email,String password);

class UsuarioNotifier extends StateNotifier<List<Usuario>> {
  final ClinicaRepository repository;
  UsuarioNotifier({required this.repository}): super([]);

  Future<bool> loggin(String email,String password)async{
    final result = await repository.validarCredenciales(email, password);
    if (result == null) return false;
    state = [result];
    return true;
  }

  Future<bool> register(Usuario user)async{
    final result = await repository.registarUsuario(user);
    if (result == null) return false;
    state = [result];
    return true;
  }
}