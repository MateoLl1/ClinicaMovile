
bool validarCedula(String cedula) {
  final cedulaRegExp = RegExp(r'^[0-9]{10}$');
  
  if (!cedulaRegExp.hasMatch(cedula)) {
    return false;
  }

  final List<int> coefficients = [2, 1, 2, 1, 2, 1, 2, 1, 2, 1];
  int sum = 0;

  for (int i = 0; i < 10; i++) {
    int digit = int.parse(cedula[i]);
    int product = digit * coefficients[i];
    sum += (product > 9) ? product - 9 : product;
  }

  return sum % 10 == 0;
}

