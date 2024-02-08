
"use strict";

let PantiltStatusStamped = require('./PantiltStatusStamped.js');
let OdomManualCalibrationStatus = require('./OdomManualCalibrationStatus.js');
let PresenceSensorArray = require('./PresenceSensorArray.js');
let InverterStatus = require('./InverterStatus.js');
let BoolArray = require('./BoolArray.js');
let MotorCurrent = require('./MotorCurrent.js');
let named_inputs_outputs = require('./named_inputs_outputs.js');
let MotorStatus = require('./MotorStatus.js');
let BatteryDockingStatusStamped = require('./BatteryDockingStatusStamped.js');
let QueryAlarm = require('./QueryAlarm.js');
let ElevatorAction = require('./ElevatorAction.js');
let RecordStatus = require('./RecordStatus.js');
let Register = require('./Register.js');
let OdomCalibrationStatusStamped = require('./OdomCalibrationStatusStamped.js');
let OdomCalibrationStatus = require('./OdomCalibrationStatus.js');
let inputs_outputs = require('./inputs_outputs.js');
let BatteryStatusStamped = require('./BatteryStatusStamped.js');
let Registers = require('./Registers.js');
let ReturnMessage = require('./ReturnMessage.js');
let Alarms = require('./Alarms.js');
let StringArray = require('./StringArray.js');
let MotorsStatusDifferential = require('./MotorsStatusDifferential.js');
let MotorHeadingOffset = require('./MotorHeadingOffset.js');
let WatchdogStatus = require('./WatchdogStatus.js');
let Cartesian_Euler_pose = require('./Cartesian_Euler_pose.js');
let BatteryStatus = require('./BatteryStatus.js');
let WatchdogStatusArray = require('./WatchdogStatusArray.js');
let StringStamped = require('./StringStamped.js');
let MotorPID = require('./MotorPID.js');
let AlarmSensor = require('./AlarmSensor.js');
let Pose2DArray = require('./Pose2DArray.js');
let RobotnikMotorsStatus = require('./RobotnikMotorsStatus.js');
let ArmStatus = require('./ArmStatus.js');
let PantiltStatus = require('./PantiltStatus.js');
let LaserMode = require('./LaserMode.js');
let SafetyModuleStatus = require('./SafetyModuleStatus.js');
let PresenceSensor = require('./PresenceSensor.js');
let MotorReferenceValueArray = require('./MotorReferenceValueArray.js');
let encoders = require('./encoders.js');
let Axis = require('./Axis.js');
let Pose2DStamped = require('./Pose2DStamped.js');
let Logger = require('./Logger.js');
let ptz = require('./ptz.js');
let alarmmonitor = require('./alarmmonitor.js');
let named_input_output = require('./named_input_output.js');
let BatteryDockingStatus = require('./BatteryDockingStatus.js');
let Interfaces = require('./Interfaces.js');
let ElevatorStatus = require('./ElevatorStatus.js');
let MotorReferenceValue = require('./MotorReferenceValue.js');
let MotorsStatus = require('./MotorsStatus.js');
let alarmsmonitor = require('./alarmsmonitor.js');
let LaserStatus = require('./LaserStatus.js');
let Data = require('./Data.js');
let State = require('./State.js');
let SubState = require('./SubState.js');
let OdomManualCalibrationStatusStamped = require('./OdomManualCalibrationStatusStamped.js');
let SetElevatorGoal = require('./SetElevatorGoal.js');
let SetElevatorAction = require('./SetElevatorAction.js');
let SetElevatorActionFeedback = require('./SetElevatorActionFeedback.js');
let SetElevatorActionResult = require('./SetElevatorActionResult.js');
let SetElevatorFeedback = require('./SetElevatorFeedback.js');
let SetElevatorActionGoal = require('./SetElevatorActionGoal.js');
let SetElevatorResult = require('./SetElevatorResult.js');

module.exports = {
  PantiltStatusStamped: PantiltStatusStamped,
  OdomManualCalibrationStatus: OdomManualCalibrationStatus,
  PresenceSensorArray: PresenceSensorArray,
  InverterStatus: InverterStatus,
  BoolArray: BoolArray,
  MotorCurrent: MotorCurrent,
  named_inputs_outputs: named_inputs_outputs,
  MotorStatus: MotorStatus,
  BatteryDockingStatusStamped: BatteryDockingStatusStamped,
  QueryAlarm: QueryAlarm,
  ElevatorAction: ElevatorAction,
  RecordStatus: RecordStatus,
  Register: Register,
  OdomCalibrationStatusStamped: OdomCalibrationStatusStamped,
  OdomCalibrationStatus: OdomCalibrationStatus,
  inputs_outputs: inputs_outputs,
  BatteryStatusStamped: BatteryStatusStamped,
  Registers: Registers,
  ReturnMessage: ReturnMessage,
  Alarms: Alarms,
  StringArray: StringArray,
  MotorsStatusDifferential: MotorsStatusDifferential,
  MotorHeadingOffset: MotorHeadingOffset,
  WatchdogStatus: WatchdogStatus,
  Cartesian_Euler_pose: Cartesian_Euler_pose,
  BatteryStatus: BatteryStatus,
  WatchdogStatusArray: WatchdogStatusArray,
  StringStamped: StringStamped,
  MotorPID: MotorPID,
  AlarmSensor: AlarmSensor,
  Pose2DArray: Pose2DArray,
  RobotnikMotorsStatus: RobotnikMotorsStatus,
  ArmStatus: ArmStatus,
  PantiltStatus: PantiltStatus,
  LaserMode: LaserMode,
  SafetyModuleStatus: SafetyModuleStatus,
  PresenceSensor: PresenceSensor,
  MotorReferenceValueArray: MotorReferenceValueArray,
  encoders: encoders,
  Axis: Axis,
  Pose2DStamped: Pose2DStamped,
  Logger: Logger,
  ptz: ptz,
  alarmmonitor: alarmmonitor,
  named_input_output: named_input_output,
  BatteryDockingStatus: BatteryDockingStatus,
  Interfaces: Interfaces,
  ElevatorStatus: ElevatorStatus,
  MotorReferenceValue: MotorReferenceValue,
  MotorsStatus: MotorsStatus,
  alarmsmonitor: alarmsmonitor,
  LaserStatus: LaserStatus,
  Data: Data,
  State: State,
  SubState: SubState,
  OdomManualCalibrationStatusStamped: OdomManualCalibrationStatusStamped,
  SetElevatorGoal: SetElevatorGoal,
  SetElevatorAction: SetElevatorAction,
  SetElevatorActionFeedback: SetElevatorActionFeedback,
  SetElevatorActionResult: SetElevatorActionResult,
  SetElevatorFeedback: SetElevatorFeedback,
  SetElevatorActionGoal: SetElevatorActionGoal,
  SetElevatorResult: SetElevatorResult,
};
