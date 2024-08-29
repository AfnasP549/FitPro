// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intermediateWorkout_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IntermediateWorkoutModelAdapter
    extends TypeAdapter<IntermediateWorkoutModel> {
  @override
  final int typeId = 2;

  @override
  IntermediateWorkoutModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IntermediateWorkoutModel(
      url: fields[1] as String,
      name: fields[2] as String,
      description: fields[3] as String,
      duration: fields[4] as String,
      isFavorite: fields[5] as bool,
    )..id = fields[0] as int?;
  }

  @override
  void write(BinaryWriter writer, IntermediateWorkoutModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IntermediateWorkoutModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
