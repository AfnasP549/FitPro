// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_tracker_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DietTrackerModelAdapter extends TypeAdapter<DietTrackerModel> {
  @override
  final int typeId = 5;

  @override
  DietTrackerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DietTrackerModel(
      imagePath: fields[0] as String,
      note: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DietTrackerModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.imagePath)
      ..writeByte(1)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DietTrackerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
