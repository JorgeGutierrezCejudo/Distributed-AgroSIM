
"use strict";

let SetElevator = require('./SetElevator.js')
let SetInt16 = require('./SetInt16.js')
let get_digital_input = require('./get_digital_input.js')
let set_CartesianEuler_pose = require('./set_CartesianEuler_pose.js')
let home = require('./home.js')
let set_mode = require('./set_mode.js')
let get_modbus_register = require('./get_modbus_register.js')
let QueryAlarms = require('./QueryAlarms.js')
let GetPOI = require('./GetPOI.js')
let GetPTZ = require('./GetPTZ.js')
let GetMotorsHeadingOffset = require('./GetMotorsHeadingOffset.js')
let set_named_digital_output = require('./set_named_digital_output.js')
let LoggerQuery = require('./LoggerQuery.js')
let SetMotorPID = require('./SetMotorPID.js')
let enable_disable = require('./enable_disable.js')
let set_float_value = require('./set_float_value.js')
let set_modbus_register_bit = require('./set_modbus_register_bit.js')
let SetLaserMode = require('./SetLaserMode.js')
let SetTransform = require('./SetTransform.js')
let set_height = require('./set_height.js')
let Record = require('./Record.js')
let SetCurrent = require('./SetCurrent.js')
let get_mode = require('./get_mode.js')
let set_modbus_register = require('./set_modbus_register.js')
let GetBool = require('./GetBool.js')
let set_odometry = require('./set_odometry.js')
let SetMotorStatus = require('./SetMotorStatus.js')
let ResetFromSubState = require('./ResetFromSubState.js')
let SetByte = require('./SetByte.js')
let ack_alarm = require('./ack_alarm.js')
let SetMotorMode = require('./SetMotorMode.js')
let SetEncoderTurns = require('./SetEncoderTurns.js')
let get_alarms = require('./get_alarms.js')
let set_analog_output = require('./set_analog_output.js')
let InsertTask = require('./InsertTask.js')
let set_ptz = require('./set_ptz.js')
let set_digital_output = require('./set_digital_output.js')
let SetBuzzer = require('./SetBuzzer.js')
let SetString = require('./SetString.js')
let axis_record = require('./axis_record.js')
let SetNamedDigitalOutput = require('./SetNamedDigitalOutput.js')

module.exports = {
  SetElevator: SetElevator,
  SetInt16: SetInt16,
  get_digital_input: get_digital_input,
  set_CartesianEuler_pose: set_CartesianEuler_pose,
  home: home,
  set_mode: set_mode,
  get_modbus_register: get_modbus_register,
  QueryAlarms: QueryAlarms,
  GetPOI: GetPOI,
  GetPTZ: GetPTZ,
  GetMotorsHeadingOffset: GetMotorsHeadingOffset,
  set_named_digital_output: set_named_digital_output,
  LoggerQuery: LoggerQuery,
  SetMotorPID: SetMotorPID,
  enable_disable: enable_disable,
  set_float_value: set_float_value,
  set_modbus_register_bit: set_modbus_register_bit,
  SetLaserMode: SetLaserMode,
  SetTransform: SetTransform,
  set_height: set_height,
  Record: Record,
  SetCurrent: SetCurrent,
  get_mode: get_mode,
  set_modbus_register: set_modbus_register,
  GetBool: GetBool,
  set_odometry: set_odometry,
  SetMotorStatus: SetMotorStatus,
  ResetFromSubState: ResetFromSubState,
  SetByte: SetByte,
  ack_alarm: ack_alarm,
  SetMotorMode: SetMotorMode,
  SetEncoderTurns: SetEncoderTurns,
  get_alarms: get_alarms,
  set_analog_output: set_analog_output,
  InsertTask: InsertTask,
  set_ptz: set_ptz,
  set_digital_output: set_digital_output,
  SetBuzzer: SetBuzzer,
  SetString: SetString,
  axis_record: axis_record,
  SetNamedDigitalOutput: SetNamedDigitalOutput,
};
