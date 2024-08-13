// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advancedWorkout_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdvancedWorkoutModelAdapter extends TypeAdapter<AdvancedWorkoutModel> {
  @override
  final int typeId = 3;

  @override
  AdvancedWorkoutModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdvancedWorkoutModel(
      url: fields[1] as String,
      name: fields[2] as String,
      description: fields[3] as String,
      duration: fields[4] as String,
    )..id = fields[0] as int?;
  }

  @override
  void write(BinaryWriter writer, AdvancedWorkoutModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdvancedWorkoutModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
