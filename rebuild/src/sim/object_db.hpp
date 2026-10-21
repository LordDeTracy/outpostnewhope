#pragma once

#include <array>
#include <cstdint>
#include <map>
#include <memory>
#include <utility>
#include <vector>

namespace outpost::sim {

// Object types of the original's handle database (g_objectDb, DGROUP 0x65E2).
// The simulator saves tables 1..8 as chunks 0x0C..0x13 (s6:DCE2).
enum class ObjType : uint8_t {
    None = 0,
    Star = 1,      // chunk 0x0C holds the star name (TUTOR.OPS: "Sigma Draconis")
    Planet = 2,    // chunk 0x0D ("Sigma Draconis 4")
    Site = 3,      // chunk 0x0E ("Vulcan's Forge")
    Colony = 4,    // iterated by SCSetup / SCPrelimAlloc
    Tile = 5,      // building owners; one per building (inferred from counts)
    Unit = 6,      // robots and trucks linked to a tile (s7:7C50); 26 in TUTOR.OPS
    Building = 7,  // registered by Building::Building (s6:B39E)
    Player = 8,    // research state; colony+0x200 holds a player handle
};
constexpr size_t kObjTypeCount = 9;

// 32-bit object handle: (type << 24) | 24-bit index (Db::resolveHandle s6:E1EC).
struct Handle {
    uint32_t value{0};

    static constexpr Handle make(ObjType t, uint32_t index) {
        return Handle{(static_cast<uint32_t>(t) << 24) | (index & 0xFFFFFF)};
    }
    constexpr ObjType type() const { return static_cast<ObjType>(value >> 24); }
    constexpr uint32_t index() const { return value & 0xFFFFFF; }
    constexpr explicit operator bool() const { return value != 0; }
    constexpr bool operator==(const Handle&) const = default;
};

// Base of every database object (DbObj::DbObj, s7:165E):
//   +0x04 own handle, +0x08 owner handle.
class DbObject {
public:
    virtual ~DbObject() = default;
    Handle self;
    Handle owner;
};

class ObjectDb {
public:
    // Creates an object of class T in table `type`. Indices start at 1, so the
    // second player is handle 0x08000002 (inferred: the rebels).
    template <class T, class... Args>
    T& create(ObjType type, Handle owner, Args&&... args) {
        auto obj = std::make_unique<T>(std::forward<Args>(args)...);
        obj->self = Handle::make(type, ++m_next[static_cast<size_t>(type)]);
        obj->owner = owner;
        T& ref = *obj;
        table(type)[obj->self.index()] = std::move(obj);
        return ref;
    }

    // Same as create(), for an object built elsewhere (e.g. a class factory).
    template <class T>
    T& insert(ObjType type, Handle owner, std::unique_ptr<T> obj) {
        obj->self = Handle::make(type, ++m_next[static_cast<size_t>(type)]);
        obj->owner = owner;
        T& ref = *obj;
        table(type)[obj->self.index()] = std::move(obj);
        return ref;
    }

    // Loading a save: put an object under the handle it was saved with
    // (the reader s6:E628 registers it under its own handle, s7:14B4).
    template <class T>
    T& insertAt(Handle self, Handle owner, std::unique_ptr<T> obj) {
        obj->self = self;
        obj->owner = owner;
        T& ref = *obj;
        table(self.type())[self.index()] = std::move(obj);
        return ref;
    }
    // The handle allocator's last index per type (saved as chunk 0x09).
    uint32_t lastIndex(ObjType t) const { return m_next[static_cast<size_t>(t)]; }
    void setLastIndex(ObjType t, uint32_t index) { m_next[static_cast<size_t>(t)] = index; }

    DbObject* resolve(Handle h) const;
    template <class T>
    T* get(Handle h) const { return dynamic_cast<T*>(resolve(h)); }

    // All objects of a type, in index order (DbIter, s6:DC52 / s6:E4EC).
    std::vector<DbObject*> all(ObjType type) const;
    template <class T>
    std::vector<T*> allOf(ObjType type) const {
        std::vector<T*> out;
        for (DbObject* o : all(type))
            if (auto* t = dynamic_cast<T*>(o)) out.push_back(t);
        return out;
    }

    void destroy(Handle h);

private:
    using Table = std::map<uint32_t, std::unique_ptr<DbObject>>;
    Table& table(ObjType t) { return m_tables[static_cast<size_t>(t)]; }
    const Table& table(ObjType t) const { return m_tables[static_cast<size_t>(t)]; }

    std::array<Table, kObjTypeCount> m_tables;
    std::array<uint32_t, kObjTypeCount> m_next{};
};

} // namespace outpost::sim
