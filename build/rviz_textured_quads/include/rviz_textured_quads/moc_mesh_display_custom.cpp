/****************************************************************************
** Meta object code from reading C++ file 'mesh_display_custom.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../src/rviz_textured_quads/include/rviz_textured_quads/mesh_display_custom.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mesh_display_custom.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_rviz__MeshDisplayCustom_t {
    QByteArrayData data[4];
    char stringdata0[66];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_rviz__MeshDisplayCustom_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_rviz__MeshDisplayCustom_t qt_meta_stringdata_rviz__MeshDisplayCustom = {
    {
QT_MOC_LITERAL(0, 0, 23), // "rviz::MeshDisplayCustom"
QT_MOC_LITERAL(1, 24, 20), // "updateMeshProperties"
QT_MOC_LITERAL(2, 45, 0), // ""
QT_MOC_LITERAL(3, 46, 19) // "updateDisplayImages"

    },
    "rviz::MeshDisplayCustom\0updateMeshProperties\0"
    "\0updateDisplayImages"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_rviz__MeshDisplayCustom[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   24,    2, 0x08 /* Private */,
       3,    0,   25,    2, 0x08 /* Private */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void rviz::MeshDisplayCustom::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<MeshDisplayCustom *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->updateMeshProperties(); break;
        case 1: _t->updateDisplayImages(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject rviz::MeshDisplayCustom::staticMetaObject = { {
    &rviz::Display::staticMetaObject,
    qt_meta_stringdata_rviz__MeshDisplayCustom.data,
    qt_meta_data_rviz__MeshDisplayCustom,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *rviz::MeshDisplayCustom::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *rviz::MeshDisplayCustom::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_rviz__MeshDisplayCustom.stringdata0))
        return static_cast<void*>(this);
    if (!strcmp(_clname, "Ogre::RenderTargetListener"))
        return static_cast< Ogre::RenderTargetListener*>(this);
    if (!strcmp(_clname, "Ogre::RenderQueueListener"))
        return static_cast< Ogre::RenderQueueListener*>(this);
    return rviz::Display::qt_metacast(_clname);
}

int rviz::MeshDisplayCustom::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = rviz::Display::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 2)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 2;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
