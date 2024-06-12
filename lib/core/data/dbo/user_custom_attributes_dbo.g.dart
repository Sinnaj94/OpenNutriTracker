// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_custom_attributes_dbo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCustomAttributesDBOAdapter
    extends TypeAdapter<UserCustomAttributesDBO> {
  @override
  final int typeId = 16;

  @override
  UserCustomAttributesDBO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCustomAttributesDBO(
      customCalories: fields[0] as double?,
      customCarbs: fields[1] as double?,
      customFat: fields[2] as double?,
      customProteins: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, UserCustomAttributesDBO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.customCalories)
      ..writeByte(1)
      ..write(obj.customCarbs)
      ..writeByte(2)
      ..write(obj.customFat)
      ..writeByte(3)
      ..write(obj.customProteins);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCustomAttributesDBOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
