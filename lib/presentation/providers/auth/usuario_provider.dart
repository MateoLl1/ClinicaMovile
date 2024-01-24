
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medi_meet/domain/domain.dart';

final userFuntionsProvider = StateNotifierProvider<UsuarioNotifier,List<Usuario>>((ref) {
  return UsuarioNotifier();
});


typedef UserCallback = Future<List<Usuario>> Function(String email,String password);

class UsuarioNotifier extends StateNotifier<List<Usuario>> {
  UsuarioNotifier(): super([]);

  
  guardarUsuario(Usuario user){
    state = [user];
  }

}