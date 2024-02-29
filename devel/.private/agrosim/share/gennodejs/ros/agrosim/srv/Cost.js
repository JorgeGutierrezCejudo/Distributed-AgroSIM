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

class CostRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Id = null;
    }
    else {
      if (initObj.hasOwnProperty('Id')) {
        this.Id = initObj.Id
      }
      else {
        this.Id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CostRequest
    // Serialize message field [Id]
    bufferOffset = _serializer.int32(obj.Id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CostRequest
    let len;
    let data = new CostRequest(null);
    // Deserialize message field [Id]
    data.Id = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'agrosim/CostRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4c256f183ddb18ca1c8cac601691eb32';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 Id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CostRequest(null);
    if (msg.Id !== undefined) {
      resolved.Id = msg.Id;
    }
    else {
      resolved.Id = 0
    }

    return resolved;
    }
};

class CostResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Id = null;
      this.Cost = null;
    }
    else {
      if (initObj.hasOwnProperty('Id')) {
        this.Id = initObj.Id
      }
      else {
        this.Id = 0;
      }
      if (initObj.hasOwnProperty('Cost')) {
        this.Cost = initObj.Cost
      }
      else {
        this.Cost = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CostResponse
    // Serialize message field [Id]
    bufferOffset = _serializer.int32(obj.Id, buffer, bufferOffset);
    // Serialize message field [Cost]
    bufferOffset = _arraySerializer.float64(obj.Cost, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CostResponse
    let len;
    let data = new CostResponse(null);
    // Deserialize message field [Id]
    data.Id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Cost]
    data.Cost = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.Cost.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'agrosim/CostResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a654b5089c86fad5cea4a044ea2bd61f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 Id
    float64[] Cost
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CostResponse(null);
    if (msg.Id !== undefined) {
      resolved.Id = msg.Id;
    }
    else {
      resolved.Id = 0
    }

    if (msg.Cost !== undefined) {
      resolved.Cost = msg.Cost;
    }
    else {
      resolved.Cost = []
    }

    return resolved;
    }
};

module.exports = {
  Request: CostRequest,
  Response: CostResponse,
  md5sum() { return 'c231a7c7ef297dd0990c7c10eb4d3e0e'; },
  datatype() { return 'agrosim/Cost'; }
};
