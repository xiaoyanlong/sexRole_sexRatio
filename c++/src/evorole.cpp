/*========================================================================================================
A life-history perspective on the evolutionary interplay of sex ratios and parental sex roles
==========================================================================================================

Written by:
Xiaoyan Long
Program version
18/01/2024

=========================================================================================================*/

#include <filesystem>
#include "evorole.h"
#include "simulation.h"
#include "recorder.h"


namespace evorole {

  void Parameter::sanity_check(const Parameter& param)
  {
    // ToDo: test test test, throw if something seems fishy
  }


  void run_simulation(const Parameter& param, const std::filesystem::path& out, bool verbose)
  {
    auto recorder = std::make_unique<Recorder>(param, out, verbose);
    Simulation(param, std::move(recorder)).run();
  }

}
