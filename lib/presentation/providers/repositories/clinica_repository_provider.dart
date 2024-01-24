
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medi_meet/infrastructure/infrastructure.dart';

final clinicaRepositoryProvider = Provider((ref) {
  return ClinicaRepositoryImpl(datasource: MediMeetDatasource());
});