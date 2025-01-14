/*
    Copyright 2020-2021. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License")
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

import 'dart:typed_data';

class Message {
  static const int maxContentSize = 65536;
  static const int maxTypeLength = 16;
  static const String messageNamespaceReserved = "_reserved_namespace";
  static const String messageTypeEddystoneUid = "_eddystone_uid";
  static const String messageTypeIBeaconId = "_ibeacon_id";

  final Uint8List? content;
  final String? type;
  final String? namespace;

  Message({required this.content, this.type, this.namespace});

  factory Message.fromMap(Map<dynamic, dynamic> map) => Message(
      content: map['content'], type: map['type'], namespace: map['namespace']);

  Map<String, dynamic> toMap() =>
      {'content': content, 'type': type, 'namespace': namespace};

  @override
  String toString() {
    int? length = content?.length;
    return "Message{namespace='$namespace', type='$type', content[$length bytes]}";
  }

  bool equals(object) =>
      identical(this, object) ||
      (object is Message &&
          this.content == object.content &&
          this.type == object.type &&
          this.namespace == object.namespace);
}

class MessageOption {
  int permissions;

  MessageOption(this.permissions);
}
