// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zekr_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ZekrModelAdapter extends TypeAdapter<ZekrModel> {
  @override
  final int typeId = 1;

  @override
  ZekrModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ZekrModel(
      fields[0] as String,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ZekrModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.zekr)
      ..writeByte(1)
      ..write(obj.numberOfTimes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ZekrModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
