#include <QtQml/qqmlprivate.h>
#include <QtCore/qdir.h>
#include <QtCore/qurl.h>
#include <QtCore/qhash.h>
#include <QtCore/qstring.h>

namespace QmlCacheGeneratedCode {
namespace _qt_qml_main_Base_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_main_RainbowGradient_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_main_RectangleEg_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_main_MyRectangle_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_main_AnchorsEg_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_main_WindowEg_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_main_DialogEg_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_main_ItemEg_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_main_RowLayoutEg_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_main_ColumnLyaoutEg_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_main_GridLayoutEg_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_main_StackLayoutEg_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_main_ButtonEg_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_main_TextFieldEg_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}

}
namespace {
struct Registry {
    Registry();
    ~Registry();
    QHash<QString, const QQmlPrivate::CachedQmlUnit*> resourcePathToCachedUnit;
    static const QQmlPrivate::CachedQmlUnit *lookupCachedUnit(const QUrl &url);
};

Q_GLOBAL_STATIC(Registry, unitRegistry)


Registry::Registry() {
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/main/Base.qml"), &QmlCacheGeneratedCode::_qt_qml_main_Base_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/main/RainbowGradient.qml"), &QmlCacheGeneratedCode::_qt_qml_main_RainbowGradient_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/main/RectangleEg.qml"), &QmlCacheGeneratedCode::_qt_qml_main_RectangleEg_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/main/MyRectangle.qml"), &QmlCacheGeneratedCode::_qt_qml_main_MyRectangle_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/main/AnchorsEg.qml"), &QmlCacheGeneratedCode::_qt_qml_main_AnchorsEg_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/main/WindowEg.qml"), &QmlCacheGeneratedCode::_qt_qml_main_WindowEg_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/main/DialogEg.qml"), &QmlCacheGeneratedCode::_qt_qml_main_DialogEg_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/main/ItemEg.qml"), &QmlCacheGeneratedCode::_qt_qml_main_ItemEg_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/main/RowLayoutEg.qml"), &QmlCacheGeneratedCode::_qt_qml_main_RowLayoutEg_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/main/ColumnLyaoutEg.qml"), &QmlCacheGeneratedCode::_qt_qml_main_ColumnLyaoutEg_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/main/GridLayoutEg.qml"), &QmlCacheGeneratedCode::_qt_qml_main_GridLayoutEg_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/main/StackLayoutEg.qml"), &QmlCacheGeneratedCode::_qt_qml_main_StackLayoutEg_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/main/ButtonEg.qml"), &QmlCacheGeneratedCode::_qt_qml_main_ButtonEg_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/main/TextFieldEg.qml"), &QmlCacheGeneratedCode::_qt_qml_main_TextFieldEg_qml::unit);
    QQmlPrivate::RegisterQmlUnitCacheHook registration;
    registration.structVersion = 0;
    registration.lookupCachedQmlUnit = &lookupCachedUnit;
    QQmlPrivate::qmlregister(QQmlPrivate::QmlUnitCacheHookRegistration, &registration);
}

Registry::~Registry() {
    QQmlPrivate::qmlunregister(QQmlPrivate::QmlUnitCacheHookRegistration, quintptr(&lookupCachedUnit));
}

const QQmlPrivate::CachedQmlUnit *Registry::lookupCachedUnit(const QUrl &url) {
    if (url.scheme() != QLatin1String("qrc"))
        return nullptr;
    QString resourcePath = QDir::cleanPath(url.path());
    if (resourcePath.isEmpty())
        return nullptr;
    if (!resourcePath.startsWith(QLatin1Char('/')))
        resourcePath.prepend(QLatin1Char('/'));
    return unitRegistry()->resourcePathToCachedUnit.value(resourcePath, nullptr);
}
}
int QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appmain)() {
    ::unitRegistry();
    return 1;
}
Q_CONSTRUCTOR_FUNCTION(QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appmain))
int QT_MANGLE_NAMESPACE(qCleanupResources_qmlcache_appmain)() {
    return 1;
}
