#include "sim/step_queue.hpp"

#include "sim/simulation.hpp"

#include <algorithm>

namespace outpost::sim {

void StepQueue::enqueue(Simulation& sim, std::unique_ptr<Step> step) {
    if (!step || !step->shouldRun(sim)) return;
    insert(std::move(step));
}

void StepQueue::insert(std::unique_ptr<Step> step) {
    if (!step) return;
    const uint16_t p = step->priority();
    auto pos = std::find_if(m_steps.begin(), m_steps.end(),
                            [p](const auto& s) { return s->priority() <= p; });
    m_steps.insert(pos, std::move(step));
}

void StepQueue::runAll(Simulation& sim) {
    while (!m_steps.empty()) {
        std::unique_ptr<Step> step = std::move(m_steps.front());
        m_steps.erase(m_steps.begin());
        sim.noteStepRun(step->name());
        step->calcMe(sim);
    }
}

} // namespace outpost::sim
