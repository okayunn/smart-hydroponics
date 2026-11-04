// Code generation verification only. Not part of the product application.
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample.freezed.dart';
part 'sample.g.dart';

@freezed
abstract class SampleDto with _$SampleDto {
  const factory SampleDto({required String label}) = _SampleDto;

  factory SampleDto.fromJson(Map<String, dynamic> json) =>
      _$SampleDtoFromJson(json);
}

@freezed
sealed class SampleEvent with _$SampleEvent {
  const factory SampleEvent.requested() = SampleRequested;
}

@freezed
sealed class SampleState with _$SampleState {
  const factory SampleState.loading() = SampleLoading;
  const factory SampleState.success(SampleDto value) = SampleSuccess;
  const factory SampleState.error(String message) = SampleError;
}
