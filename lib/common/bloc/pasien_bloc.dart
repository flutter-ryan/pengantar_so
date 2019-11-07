import 'package:pengantar_so/common/functions/repository_pasien.dart';
import 'package:pengantar_so/model/pasien.dart';
import 'package:rxdart/rxdart.dart';

class PasienBloc {
  final _repositoryPasien = new RepositoryPasien();

  final _pasienGet = PublishSubject<Pasien>();

  Observable<Pasien> get pasien => _pasienGet.stream;

  dataPasien() async {
    Pasien pasienData = await _repositoryPasien.fetchPasien();

    _pasienGet.sink.add(pasienData);
  }

  dispose() {
    _pasienGet.close();
  }
}

final bloc = PasienBloc();
