import '../lib/domain/turno.dart';
import '../lib/infrastructure/turno_repository_memory.dart';

import '../lib/application/registrar_turno.dart';
import '../lib/application/listar_turno.dart';
import '../lib/application/buscar_turno.dart';
import '../lib/application/modificar_turno.dart';
import '../lib/application/eliminar_turno.dart';

void main() {
  var repository = TurnoRepositoryMemory();

  var registrar = RegistrarTurno(repository);
  var listar = ListarTurnos(repository);
  var buscar = BuscarTurno(repository);
  var modificar = ModificarTurno(repository);
  var eliminar = EliminarTurno(repository);

  registrar.ejecutar(
    Turno(1, "Gimena Guanca", "Dr. Perez", "24/06/2026", "09:00"),
  );

  registrar.ejecutar(
    Turno(2, "Juan Lopez", "Dra. Gomez", "25/06/2026", "11:00"),
  );

  print("LISTA DE TURNOS");

  for (var turno in listar.ejecutar()) {
    print(
      "${turno.id} - ${turno.paciente} - ${turno.medico} - ${turno.fecha}",
    );
  }

  var encontrado = buscar.ejecutar(1);

  if (encontrado != null) {
    print("\nEncontrado: ${encontrado.paciente}");
  }

  modificar.ejecutar(
    Turno(1, "Gimena Guanca", "Dr. Fernandez", "30/06/2026", "09.00"),
  );

  eliminar.ejecutar(2);

  print("\nLISTA FINAL");

  for (var turno in listar.ejecutar()) {
    print(
      "${turno.id} - ${turno.paciente} - ${turno.medico} - ${turno.fecha}",
    );
  }
}