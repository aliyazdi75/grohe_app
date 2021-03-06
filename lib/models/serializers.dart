library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'appliance.dart';
import 'location.dart';
import 'room.dart';

part 'serializers.g.dart';

@SerializersFor([
  Locations,
  Location,
  Room,
  Appliance,
  Data,
  Measurement,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
