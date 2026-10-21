#pragma once

#include <cstdint>
#include <memory>
#include <string_view>
#include <vector>

namespace outpost::sim {

class Simulation;

// A simulation step object (the original's SC* classes, base SCBase s6:D1DC).
// Vtable: 0 dtor, 1 calcMe, 2 shouldRun, 3 clone.
class Step {
public:
    virtual ~Step() = default;
    virtual std::string_view name() const = 0;
    // The base-ctor id; higher runs first (e.g. SCSetup 15999, SCEndSim 999).
    virtual uint16_t priority() const = 0;
    virtual bool shouldRun(Simulation&) { return true; }   // SCBase default s6:D228
    virtual void calcMe(Simulation& sim) = 0;
};

// The turn's step queue: a list kept in descending priority order
// (KeyedList::insertDescending s5:C872). A new step goes in front of steps
// with the same priority.
class StepQueue {
public:
    // StepQueue::enqueueIfShouldRun (s6:D566).
    void enqueue(Simulation& sim, std::unique_ptr<Step> step);
    // StepQueue::insertClone (s6:D742): insert without asking shouldRun
    // (steps released from the future list, s6:D6B2).
    void insert(std::unique_ptr<Step> step);
    // StepQueue::runAll (s6:D01A): pop the head, run calcMe, delete, repeat.
    // Steps may enqueue more steps while running.
    void runAll(Simulation& sim);
    bool empty() const { return m_steps.empty(); }
    size_t size() const { return m_steps.size(); }

private:
    std::vector<std::unique_ptr<Step>> m_steps;
};

} // namespace outpost::sim
