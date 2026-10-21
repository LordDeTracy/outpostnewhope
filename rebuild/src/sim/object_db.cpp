#include "sim/object_db.hpp"

namespace outpost::sim {

DbObject* ObjectDb::resolve(Handle h) const {
    const auto t = static_cast<size_t>(h.type());
    if (t == 0 || t >= kObjTypeCount) return nullptr;
    auto it = m_tables[t].find(h.index());
    return it == m_tables[t].end() ? nullptr : it->second.get();
}

std::vector<DbObject*> ObjectDb::all(ObjType type) const {
    std::vector<DbObject*> out;
    for (const auto& [index, obj] : table(type)) out.push_back(obj.get());
    return out;
}

void ObjectDb::destroy(Handle h) {
    const auto t = static_cast<size_t>(h.type());
    if (t > 0 && t < kObjTypeCount) m_tables[t].erase(h.index());
}

} // namespace outpost::sim
