import 'package:flutter_test/flutter_test.dart';
import 'package:hydroponics_mobile/codegen_sample/sample.dart';

void main() {
  test('generated JSON, copyWith, equality and sealed variants work', () {
    final dto = SampleDto.fromJson({'label': 'sample'});
    expect(dto, const SampleDto(label: 'sample'));
    expect(dto.toJson(), {'label': 'sample'});
    expect(dto.copyWith(label: 'changed').label, 'changed');
    expect(dto.label, 'sample');
    expect(const SampleEvent.requested(), isA<SampleRequested>());
    final state = SampleState.success(dto);
    final result = switch (state) {
      SampleLoading() => 'loading',
      SampleSuccess(:final value) => value.label,
      SampleError(:final message) => message,
    };
    expect(result, 'sample');
  });
}
