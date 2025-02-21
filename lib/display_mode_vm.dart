import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomad_thread/display_mode_model.dart';
import 'package:nomad_thread/display_mode_repo.dart';

class DisplayModeViewModel extends Notifier<DisplayModeModel> {
  final DisplayModeRepository _repository;

  DisplayModeViewModel(this._repository);

  void setDisplayMode(bool value) {
    _repository.setDisplayMode(value);
    state = DisplayModeModel(displayMode: value);
  }

  @override
  DisplayModeModel build() {
    return DisplayModeModel(
      displayMode: _repository.isDisplayMode(),
    );
  }
}

final displayModeProvider =
    NotifierProvider<DisplayModeViewModel, DisplayModeModel>(
  () => throw UnimplementedError(),
);
