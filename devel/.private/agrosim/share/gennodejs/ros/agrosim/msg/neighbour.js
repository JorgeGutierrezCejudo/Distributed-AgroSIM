// Auto-generated. Do not edit!

// (in-package agrosim.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class neighbour {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Id = null;
      this.Task = null;
      this.row = null;
      this.column = null;
      this.costs = null;
    }
    else {
      if (initObj.hasOwnProperty('Id')) {
        this.Id = initObj.Id
      }
      else {
        this.Id = [];
      }
      if (initObj.hasOwnProperty('Task')) {
        this.Task = initObj.Task
      }
      else {
        this.Task = [];
      }
      if (initObj.hasOwnProperty('row')) {
        this.row = initObj.row
      }
      else {
        this.row = 0;
      }
      if (initObj.hasOwnProperty('column')) {
        this.column = initObj.column
      }
      else {
        this.column = 0;
      }
      if (initObj.hasOwnProperty('costs')) {
        this.costs = initObj.costs
      }
      else {
        this.costs = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type neighbour
    // Serialize message field [Id]
    bufferOffset = _arraySerializer.int32(obj.Id, buffer, bufferOffset, null);
    // Serialize message field [Task]
    bufferOffset = _arraySerializer.int32(obj.Task, buffer, bufferOffset, null);
    // Serialize message field [row]
    bufferOffset = _serializer.int32(obj.row, buffer, bufferOffset);
    // Serialize message field [column]
    bufferOffset = _serializer.int32(obj.column, buffer, bufferOffset);
    // Serialize message field [costs]
    bufferOffset = _arraySerializer.float64(obj.costs, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type neighbour
    let len;
    let data = new neighbour(null);
    // Deserialize message field [Id]
    data.Id = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [Task]
    data.Task = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [row]
    data.row = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [column]
    data.column = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [costs]
    data.costs = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.Id.length;
    length += 4 * object.Task.length;
    length += 8 * object.costs.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'agrosim/neighbour';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '056719dbb8917202f0bca8112a07cd79';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[] Id
    int32[] Task
    int32 row
    int32 column
    float64[]  costs
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new neighbour(null);
    if (msg.Id !== undefined) {
      resolved.Id = msg.Id;
    }
    else {
      resolved.Id = []
    }

    if (msg.Task !== undefined) {
      resolved.Task = msg.Task;
    }
    else {
      resolved.Task = []
    }

    if (msg.row !== undefined) {
      resolved.row = msg.row;
    }
    else {
      resolved.row = 0
    }

    if (msg.column !== undefined) {
      resolved.column = msg.column;
    }
    else {
      resolved.column = 0
    }

    if (msg.costs !== undefined) {
      resolved.costs = msg.costs;
    }
    else {
      resolved.costs = []
    }

    return resolved;
    }
};

module.exports = neighbour;
