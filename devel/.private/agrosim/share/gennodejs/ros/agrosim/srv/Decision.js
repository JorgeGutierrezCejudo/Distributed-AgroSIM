// Auto-generated. Do not edit!

// (in-package agrosim.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class DecisionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Ids = null;
      this.Task = null;
    }
    else {
      if (initObj.hasOwnProperty('Ids')) {
        this.Ids = initObj.Ids
      }
      else {
        this.Ids = [];
      }
      if (initObj.hasOwnProperty('Task')) {
        this.Task = initObj.Task
      }
      else {
        this.Task = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DecisionRequest
    // Serialize message field [Ids]
    bufferOffset = _arraySerializer.int32(obj.Ids, buffer, bufferOffset, null);
    // Serialize message field [Task]
    bufferOffset = _arraySerializer.int32(obj.Task, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DecisionRequest
    let len;
    let data = new DecisionRequest(null);
    // Deserialize message field [Ids]
    data.Ids = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [Task]
    data.Task = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.Ids.length;
    length += 4 * object.Task.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'agrosim/DecisionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1060026e4273e7465b845f8a5d52b9fb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[] Ids
    int32[] Task
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DecisionRequest(null);
    if (msg.Ids !== undefined) {
      resolved.Ids = msg.Ids;
    }
    else {
      resolved.Ids = []
    }

    if (msg.Task !== undefined) {
      resolved.Task = msg.Task;
    }
    else {
      resolved.Task = []
    }

    return resolved;
    }
};

class DecisionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Verification = null;
    }
    else {
      if (initObj.hasOwnProperty('Verification')) {
        this.Verification = initObj.Verification
      }
      else {
        this.Verification = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DecisionResponse
    // Serialize message field [Verification]
    bufferOffset = _serializer.bool(obj.Verification, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DecisionResponse
    let len;
    let data = new DecisionResponse(null);
    // Deserialize message field [Verification]
    data.Verification = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'agrosim/DecisionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'baaf30877b8ac9ad6ddd9e2b335d0855';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool Verification
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DecisionResponse(null);
    if (msg.Verification !== undefined) {
      resolved.Verification = msg.Verification;
    }
    else {
      resolved.Verification = false
    }

    return resolved;
    }
};

module.exports = {
  Request: DecisionRequest,
  Response: DecisionResponse,
  md5sum() { return '654ef0f93a4707fa911e286e21ab84e9'; },
  datatype() { return 'agrosim/Decision'; }
};
