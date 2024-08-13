// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beginnerWorkout_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BeginnerWorkoutModelAdapter extends TypeAdapter<BeginnerWorkoutModel> {
  @override
  final int typeId = 1;

  @override
  BeginnerWorkoutModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BeginnerWorkoutModel(
      url: fields[1] as String,
      name: fields[2] as String,
      description: fields[3] as String,
      duration: fields[4] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, BeginnerWorkoutModel obj) {
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
      other is BeginnerWorkoutModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
