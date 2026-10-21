#include "app/research_text.hpp"

namespace outpost::app {

const char* topicBlurb(uint16_t topic) {
    switch (topic) {
        case 1: return "Science for its own sake, with no single goal. It can be studied again and again.";
        case 2: return "Science put to work on the colony's needs. Its fields are open from the start.";
        case 3: return "The sky above the new world: its star, its neighbours and the rocks that cross its path.";
        case 4: return "The physics of stars and of the space between them, the groundwork for a voyage.";
        case 5: return "A survey of the sky that tracks the rocks crossing the planet's path.";
        case 6: return "A closer look at this world and its neighbours as planets.";
        case 7: return "The local star's cycles, its spots and its flares.";
        case 8: return "The life sciences: medicine, crops and the planet's own life.";
        case 9: return "Keeping colonists alive far from Earth's hospitals.";
        case 10: return "Medicines the colony can make for itself.";
        case 11: return "Medicines from the planet's own compounds, against the planet's own diseases.";
        case 12: return "The study of alien life, and what it means for the colony's food.";
        case 13: return "How Earth's crops behave under a foreign sun, in a foreign soil.";
        case 14: return "Crop strains bred for the colony's domes.";
        case 15: return "How human bodies cope with a different gravity, air and day.";
        case 16: return "Better surgery and better care for the injured.";
        case 17: return "Colonists born here compared with those born on Earth.";
        case 18: return "Safer pregnancies and births.";
        case 19: return "Defences against the planet's microbes.";
        case 20: return "The small creatures of the new world, and what they eat.";
        case 21: return "How living things depend on each other, on Earth and here.";
        case 22: return "Ecology applied to the planet's own life.";
        case 23: return "The life of the planet's air.";
        case 24: return "The life of the planet's land.";
        case 25: return "The life of the planet's waters.";
        case 26: return "The chemistry of materials, of life and of the planet itself.";
        case 27: return "The chemistry of living things.";
        case 28: return "Heat, pressure and reactions: the basis of industry.";
        case 29: return "Working the metals the mines bring up.";
        case 30: return "Better ways to turn ore into usable material.";
        case 31: return "Chemistry at the scale of single atoms.";
        case 32: return "The planet as a whole: its weather, its land and its rock.";
        case 33: return "The planet's weather and how to foresee it.";
        case 34: return "Mapping the planet's surface.";
        case 35: return "The rock the colony stands on.";
        case 36: return "How this world's crust is built and how it moves.";
        case 37: return "Plate movement and the earthquakes it brings.";
        case 38: return "Telling one ore from another.";
        case 39: return "Volcanoes, and how to see an eruption coming.";
        case 40: return "Where the useful ores lie.";
        case 41: return "Better ways to work the planet's mines.";
        case 42: return "Mining moons and asteroids.";
        case 43: return "Building safely on the local ground.";
        case 44: return "The language every other science is written in.";
        case 45: return "Computing for a colony far from Earth's networks.";
        case 46: return "Thinking machines. The shortest way to the Hot Laboratory.";
        case 47: return "Artificial intelligences that can run a colony.";
        case 48: return "Keeping artificial personalities stable.";
        case 49: return "Probes that think for themselves.";
        case 50: return "General-purpose robots for the colony's work.";
        case 51: return "Robots that fly.";
        case 52: return "Robots that repair other machines.";
        case 53: return "Robots that can do a colonist's work.";
        case 54: return "Faster computers.";
        case 55: return "How the colony's systems work together.";
        case 56: return "Time-and-motion studies of the colony's work.";
        case 57: return "A second round of studies that raises the colony's whole technology level.";
        case 58: return "Matter, energy, space and motion.";
        case 59: return "Flight in this world's air and beyond it.";
        case 60: return "Testing shapes for flight.";
        case 61: return "Proving a craft before trusting lives to it.";
        case 62: return "Building in orbit.";
        case 63: return "Designs for the machines the colony can put in orbit.";
        case 64: return "A satellite that watches for incoming meteors.";
        case 65: return "Satellites for communication and navigation.";
        case 66: return "Collecting sunlight in orbit and beaming it down.";
        case 67: return "A probe that drives into the ground and reports what lies beneath.";
        case 68: return "Satellites that watch the planet's weather.";
        case 69: return "A satellite that watches the planet's surface.";
        case 70: return "A probe sent past the system's other worlds.";
        case 71: return "Ultra-long baseline interferometry: a probe far out, working with a telescope at home.";
        case 72: return "Sending signals over long distances.";
        case 73: return "Clear signals through this planet's interference.";
        case 74: return "Listening for other minds among the stars.";
        case 75: return "The paths of things in orbit.";
        case 76: return "Power and circuits for the colony.";
        case 77: return "The next generation of robots.";
        case 78: return "Lenses, lasers and light.";
        case 79: return "More power for a growing colony.";
        case 80: return "Power from sources other than fusion and the sun.";
        case 81: return "Engines for spaceflight.";
        case 82: return "Conventional craft for work around the planet.";
        case 83: return "A craft that mines asteroids.";
        case 84: return "A craft that lifts heavy loads into orbit.";
        case 85: return "A cargo craft for low orbit.";
        case 86: return "The deep rules of matter and energy.";
        case 87: return "The most energetic fuel there is.";
        case 88: return "The physics of the atomic nucleus.";
        case 89: return "Matter hotter than any flame.";
        case 90: return "Current without loss.";
        case 91: return "The physics of the very small.";
        case 92: return "The study of the colonists themselves.";
        case 93: return "Making the most of what the colony has.";
        case 94: return "How the colony governs itself.";
        case 95: return "The colonists' minds, far from home.";
        case 96: return "Getting a better deal.";
        case 97: return "Better schooling.";
        case 98: return "How the colonists live together.";
        case 99: return "Handling unrest without making it worse.";
        case 100: return "Making work less of a grind.";
        case 101: return "How classes form in a small society.";
        case 102: return "Helping a new culture take shape.";
        case 103: return "How a town grows.";
        case 104: return "Laying the colony out well.";
        case 105: return "Better policing.";
        case 106: return "The arts and ideas that make life worth living.";
        case 107: return "Theatre for the colony.";
        case 108: return "Painting and sculpture.";
        case 109: return "Remembering where the colonists came from.";
        case 110: return "Music for the colony.";
        case 111: return "Thinking about what the colony is for.";
        case 116: return "Heredity, studied with materials too dangerous for an ordinary lab.";
        case 117: return "Changing living things on purpose.";
        case 118: return "Crops engineered for this planet.";
        case 120: return "Machines built atom by atom.";
        case 122: return "Nanomachines that can work on their own.";
        case 123: return "Working nanomachines.";
        case 124: return "Nanomachines that build things.";
        case 125: return "Nanomachines that copy themselves.";
        case 126: return "Nanomachines that build structures.";
        case 127: return "Nanomachines that mine.";
        case 128: return "Nanomachines that heal.";
        case 129: return "Nanomachines that remake the planet.";
        case 130: return "Nanomachines that make food.";
        default: return nullptr;
    }
}

const char* topicEffect(uint16_t topic) {
    switch (topic) {
        case 1: return "When finished, every topic already started needs 5 fewer points (not below 25).";
        case 10: case 16: case 17: case 19: return "Every age group's death chance drops by 1.";
        case 18: return "The infants' death chance drops by 25.";
        case 12: case 14: case 118: return "Every Agri Dome grows one more unit of food.";
        case 95: case 101: case 102: case 107: case 108: case 109: case 110: case 111:
            return "Colony morale rises by 25.";
        case 97: return "Universities finished from now on get 200 teaching turns instead of 100 (the original counts "
                        "them down but never stops a University).";
        case 99: return "Hostile police no longer lower morale.";
        case 128: return "With a working Nanotechnology Facility, colonists stop dying.";
        case 130: return "With a working Nanotechnology Facility, nobody needs food.";
        default: return nullptr;
    }
}

const char* discoveryEffect(uint16_t discovery) {
    switch (discovery) {
        case 7: return "factories can make Alien Virus Cure";
        case 10: case 12: return "Agri Domes upgrade";
        case 16: return "the Terraforming Facility can be built";
        case 18: return "monorail tiles can be built";
        case 19: return "Smelters upgrade";
        case 26: return "the SpacePort can be built";
        case 28: return "the Mass Driver can be built";
        case 29: case 36: return "Factories upgrade";
        case 30: return "five AI managers; priority topics get a point more";
        case 31: return "the AI managers stay stable";
        case 34: return "factories can make Repair Robots";
        case 35: return "factories can make Humanoid Workers";
        case 37: return "most buildings upgrade";
        case 41: return "Communications Towers upgrade";
        case 42: return "factories can make the Meteor Defense System";
        case 43: return "Geothermal Power Plants can be built";
        case 48: return "Underground Universities upgrade";
        case 51: return "Police upgrade";
        case 54: return "factories can make Weather Satellites";
        case 55: return "the Nanotechnology Facility can be built";
        case 56: return "the Hot Laboratory can be built";
        case 57: return "factories can make Comm./Nav. satellites";
        case 58: return "factories can make Solar Power Satellites";
        case 59: return "factories can make Orbital Observers";
        case 60: return "Tokamaks upgrade";
        case 61: return "the Administration Facility can be built";
        case 62: return "Underground Laboratories upgrade";
        case 63: return "SPEW Facilities upgrade";
        case 64: return "Underground Commercial upgrades";
        case 65: return "Underground Residences upgrade";
        default: return nullptr;
    }
}

bool victoryTopic(uint16_t topic) {
    switch (topic) {
        case 4: case 42: case 44: case 60: case 61: case 75: case 84: return true;
        default: return false;
    }
}

} // namespace outpost::app
