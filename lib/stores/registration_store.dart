import 'package:mobx/mobx.dart';

part 'registration_store.g.dart';

class RegistrationStore = _RegistrationStore with _$RegistrationStore;

abstract class _RegistrationStore with Store {
  @observable
  double session = 1;

  @observable
  double duration = 1;

  @action
  void setSessions(value) {
    session = value;
  }

  @action
  void setDuration(value) {
    duration = value;
  }
}
