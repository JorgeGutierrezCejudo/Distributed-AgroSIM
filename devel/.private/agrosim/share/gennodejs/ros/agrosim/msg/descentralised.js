// Auto-generated. Do not edit!

// (in-package agrosim.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let neighbour = require('./neighbour.js');

//-----------------------------------------------------------

class descentralised {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Id = null;
      this.pos_x = null;
      this.pos_y = null;
      this.task = null;
      this.cost = null;
      this.taskdone = null;
      this.others = null;
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
      if (initObj.hasOwnProperty('task')) {
        this.task = initObj.task
      }
      else {
        this.task = 0;
      }
      if (initObj.hasOwnProperty('cost')) {
        this.cost = initObj.cost
      }
      else {
        this.cost = 0.0;
      }
      if (initObj.hasOwnProperty('taskdone')) {
        this.taskdone = initObj.taskdone
      }
      else {
        this.taskdone = [];
      }
      if (initObj.hasOwnProperty('others')) {
        this.others = initObj.others
      }
      else {
        this.others = new neighbour();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type descentralised
    // Serialize message field [Id]
    bufferOffset = _serializer.int32(obj.Id, buffer, bufferOffset);
    // Serialize message field [pos_x]
    bufferOffset = _serializer.float64(obj.pos_x, buffer, bufferOffset);
    // Serialize message field [pos_y]
    bufferOffset = _serializer.float64(obj.pos_y, buffer, bufferOffset);
    // Serialize message field [task]
    bufferOffset = _serializer.int32(obj.task, buffer, bufferOffset);
    // Serialize message field [cost]
    bufferOffset = _serializer.float64(obj.cost, buffer, bufferOffset);
    // Serialize message field [taskdone]
    bufferOffset = _arraySerializer.int32(obj.taskdone, buffer, bufferOffset, null);
    // Serialize message field [others]
    bufferOffset = neighbour.serialize(obj.others, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type descentralised
    let len;
    let data = new descentralised(null);
    // Deserialize message field [Id]
    data.Id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pos_x]
    data.pos_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pos_y]
    data.pos_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [task]
    data.task = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [cost]
    data.cost = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [taskdone]
    data.taskdone = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [others]
    data.others = neighbour.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.taskdone.length;
    length += neighbour.getMessageSize(object.others);
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'agrosim/descentralised';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '26872adb2b4262c73d17f57e4c48e1dc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 Id
    float64 pos_x
    float64 pos_y
    int32 task
    float64 cost
    int32[] taskdone
    agrosim/neighbour others
    
    
    ================================================================================
    MSG: agrosim/neighbour
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
    const resolved = new descentralised(null);
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

    if (msg.task !== undefined) {
      resolved.task = msg.task;
    }
    else {
      resolved.task = 0
    }

    if (msg.cost !== undefined) {
      resolved.cost = msg.cost;
    }
    else {
      resolved.cost = 0.0
    }

    if (msg.taskdone !== undefined) {
      resolved.taskdone = msg.taskdone;
    }
    else {
      resolved.taskdone = []
    }

    if (msg.others !== undefined) {
      resolved.others = neighbour.Resolve(msg.others)
    }
    else {
      resolved.others = new neighbour()
    }

    return resolved;
    }
};

module.exports = descentralised;
