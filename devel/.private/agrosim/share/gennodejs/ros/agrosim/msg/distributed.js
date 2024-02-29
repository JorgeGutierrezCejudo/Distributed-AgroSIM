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

class distributed {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Id = null;
      this.pos_x = null;
      this.pos_y = null;
      this.Costs = null;
      this.taskdone = null;
    }
    else {
      if (initObj.hasOwnProperty('Id')) {
        this.Id = initObj.Id
      }
      else {
        this.Id = 0;
      }
      if (initObj.hasOwnProperty('pos_x')) {
        this.pos_x = initObj.pos_x
      }
      else {
        this.pos_x = 0.0;
      }
      if (initObj.hasOwnProperty('pos_y')) {
        this.pos_y = initObj.pos_y
      }
      else {
        this.pos_y = 0.0;
      }
      if (initObj.hasOwnProperty('Costs')) {
        this.Costs = initObj.Costs
      }
      else {
        this.Costs = [];
      }
      if (initObj.hasOwnProperty('taskdone')) {
        this.taskdone = initObj.taskdone
      }
      else {
        this.taskdone = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type distributed
    // Serialize message field [Id]
    bufferOffset = _serializer.int32(obj.Id, buffer, bufferOffset);
    // Serialize message field [pos_x]
    bufferOffset = _serializer.float64(obj.pos_x, buffer, bufferOffset);
    // Serialize message field [pos_y]
    bufferOffset = _serializer.float64(obj.pos_y, buffer, bufferOffset);
    // Serialize message field [Costs]
    bufferOffset = _arraySerializer.float64(obj.Costs, buffer, bufferOffset, null);
    // Serialize message field [taskdone]
    bufferOffset = _arraySerializer.int32(obj.taskdone, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type distributed
    let len;
    let data = new distributed(null);
    // Deserialize message field [Id]
    data.Id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pos_x]
    data.pos_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pos_y]
    data.pos_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Costs]
    data.Costs = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [taskdone]
    data.taskdone = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.Costs.length;
    length += 4 * object.taskdone.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'agrosim/distributed';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c9bb0f30a8a9f957e8ed5112fb6abd78';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 Id
    float64 pos_x
    float64 pos_y
    float64[] Costs
    int32[] taskdone
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new distributed(null);
    if (msg.Id !== undefined) {
      resolved.Id = msg.Id;
    }
    else {
      resolved.Id = 0
    }

    if (msg.pos_x !== undefined) {
      resolved.pos_x = msg.pos_x;
    }
    else {
      resolved.pos_x = 0.0
    }

    if (msg.pos_y !== undefined) {
      resolved.pos_y = msg.pos_y;
    }
    else {
      resolved.pos_y = 0.0
    }

    if (msg.Costs !== undefined) {
      resolved.Costs = msg.Costs;
    }
    else {
      resolved.Costs = []
    }

    if (msg.taskdone !== undefined) {
      resolved.taskdone = msg.taskdone;
    }
    else {
      resolved.taskdone = []
    }

    return resolved;
    }
};

module.exports = distributed;
