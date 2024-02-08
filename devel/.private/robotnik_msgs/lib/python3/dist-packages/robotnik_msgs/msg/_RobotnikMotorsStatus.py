# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from robotnik_msgs/RobotnikMotorsStatus.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import robotnik_msgs.msg

class RobotnikMotorsStatus(genpy.Message):
  _md5sum = "a6f76b778bb6c93074bf081a98ca69ac"
  _type = "robotnik_msgs/RobotnikMotorsStatus"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# Global state of the component
string state
# Status of the motor drive
robotnik_msgs/MotorStatus[] motor_status


================================================================================
MSG: robotnik_msgs/MotorStatus
uint8 can_id
string joint
string state
string status
string communicationstatus
string mode_of_operation
string[] activestatusword
string[] activedriveflags
bool[] digitaloutputs
bool[] digitalinputs
float32 current
float32[] analoginputs
string statusword
string driveflags


"""
  __slots__ = ['state','motor_status']
  _slot_types = ['string','robotnik_msgs/MotorStatus[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       state,motor_status

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(RobotnikMotorsStatus, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.state is None:
        self.state = ''
      if self.motor_status is None:
        self.motor_status = []
    else:
      self.state = ''
      self.motor_status = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self.state
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.motor_status)
      buff.write(_struct_I.pack(length))
      for val1 in self.motor_status:
        _x = val1.can_id
        buff.write(_get_struct_B().pack(_x))
        _x = val1.joint
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.state
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.status
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.communicationstatus
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.mode_of_operation
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        length = len(val1.activestatusword)
        buff.write(_struct_I.pack(length))
        for val2 in val1.activestatusword:
          length = len(val2)
          if python3 or type(val2) == unicode:
            val2 = val2.encode('utf-8')
            length = len(val2)
          buff.write(struct.Struct('<I%ss'%length).pack(length, val2))
        length = len(val1.activedriveflags)
        buff.write(_struct_I.pack(length))
        for val2 in val1.activedriveflags:
          length = len(val2)
          if python3 or type(val2) == unicode:
            val2 = val2.encode('utf-8')
            length = len(val2)
          buff.write(struct.Struct('<I%ss'%length).pack(length, val2))
        length = len(val1.digitaloutputs)
        buff.write(_struct_I.pack(length))
        pattern = '<%sB'%length
        buff.write(struct.Struct(pattern).pack(*val1.digitaloutputs))
        length = len(val1.digitalinputs)
        buff.write(_struct_I.pack(length))
        pattern = '<%sB'%length
        buff.write(struct.Struct(pattern).pack(*val1.digitalinputs))
        _x = val1.current
        buff.write(_get_struct_f().pack(_x))
        length = len(val1.analoginputs)
        buff.write(_struct_I.pack(length))
        pattern = '<%sf'%length
        buff.write(struct.Struct(pattern).pack(*val1.analoginputs))
        _x = val1.statusword
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.driveflags
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.motor_status is None:
        self.motor_status = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.state = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.state = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.motor_status = []
      for i in range(0, length):
        val1 = robotnik_msgs.msg.MotorStatus()
        start = end
        end += 1
        (val1.can_id,) = _get_struct_B().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.joint = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.joint = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.state = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.state = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.status = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.status = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.communicationstatus = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.communicationstatus = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.mode_of_operation = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.mode_of_operation = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.activestatusword = []
        for i in range(0, length):
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            val2 = str[start:end].decode('utf-8', 'rosmsg')
          else:
            val2 = str[start:end]
          val1.activestatusword.append(val2)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.activedriveflags = []
        for i in range(0, length):
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            val2 = str[start:end].decode('utf-8', 'rosmsg')
          else:
            val2 = str[start:end]
          val1.activedriveflags.append(val2)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sB'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.digitaloutputs = s.unpack(str[start:end])
        val1.digitaloutputs = list(map(bool, val1.digitaloutputs))
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sB'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.digitalinputs = s.unpack(str[start:end])
        val1.digitalinputs = list(map(bool, val1.digitalinputs))
        start = end
        end += 4
        (val1.current,) = _get_struct_f().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sf'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.analoginputs = s.unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.statusword = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.statusword = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.driveflags = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.driveflags = str[start:end]
        self.motor_status.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self.state
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      length = len(self.motor_status)
      buff.write(_struct_I.pack(length))
      for val1 in self.motor_status:
        _x = val1.can_id
        buff.write(_get_struct_B().pack(_x))
        _x = val1.joint
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.state
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.status
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.communicationstatus
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.mode_of_operation
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        length = len(val1.activestatusword)
        buff.write(_struct_I.pack(length))
        for val2 in val1.activestatusword:
          length = len(val2)
          if python3 or type(val2) == unicode:
            val2 = val2.encode('utf-8')
            length = len(val2)
          buff.write(struct.Struct('<I%ss'%length).pack(length, val2))
        length = len(val1.activedriveflags)
        buff.write(_struct_I.pack(length))
        for val2 in val1.activedriveflags:
          length = len(val2)
          if python3 or type(val2) == unicode:
            val2 = val2.encode('utf-8')
            length = len(val2)
          buff.write(struct.Struct('<I%ss'%length).pack(length, val2))
        length = len(val1.digitaloutputs)
        buff.write(_struct_I.pack(length))
        pattern = '<%sB'%length
        buff.write(val1.digitaloutputs.tostring())
        length = len(val1.digitalinputs)
        buff.write(_struct_I.pack(length))
        pattern = '<%sB'%length
        buff.write(val1.digitalinputs.tostring())
        _x = val1.current
        buff.write(_get_struct_f().pack(_x))
        length = len(val1.analoginputs)
        buff.write(_struct_I.pack(length))
        pattern = '<%sf'%length
        buff.write(val1.analoginputs.tostring())
        _x = val1.statusword
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _x = val1.driveflags
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.motor_status is None:
        self.motor_status = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.state = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.state = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.motor_status = []
      for i in range(0, length):
        val1 = robotnik_msgs.msg.MotorStatus()
        start = end
        end += 1
        (val1.can_id,) = _get_struct_B().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.joint = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.joint = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.state = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.state = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.status = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.status = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.communicationstatus = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.communicationstatus = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.mode_of_operation = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.mode_of_operation = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.activestatusword = []
        for i in range(0, length):
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            val2 = str[start:end].decode('utf-8', 'rosmsg')
          else:
            val2 = str[start:end]
          val1.activestatusword.append(val2)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        val1.activedriveflags = []
        for i in range(0, length):
          start = end
          end += 4
          (length,) = _struct_I.unpack(str[start:end])
          start = end
          end += length
          if python3:
            val2 = str[start:end].decode('utf-8', 'rosmsg')
          else:
            val2 = str[start:end]
          val1.activedriveflags.append(val2)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sB'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.digitaloutputs = numpy.frombuffer(str[start:end], dtype=numpy.bool, count=length)
        val1.digitaloutputs = list(map(bool, val1.digitaloutputs))
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sB'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.digitalinputs = numpy.frombuffer(str[start:end], dtype=numpy.bool, count=length)
        val1.digitalinputs = list(map(bool, val1.digitalinputs))
        start = end
        end += 4
        (val1.current,) = _get_struct_f().unpack(str[start:end])
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        pattern = '<%sf'%length
        start = end
        s = struct.Struct(pattern)
        end += s.size
        val1.analoginputs = numpy.frombuffer(str[start:end], dtype=numpy.float32, count=length)
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.statusword = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.statusword = str[start:end]
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.driveflags = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.driveflags = str[start:end]
        self.motor_status.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_B = None
def _get_struct_B():
    global _struct_B
    if _struct_B is None:
        _struct_B = struct.Struct("<B")
    return _struct_B
_struct_f = None
def _get_struct_f():
    global _struct_f
    if _struct_f is None:
        _struct_f = struct.Struct("<f")
    return _struct_f