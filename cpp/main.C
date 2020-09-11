#include "qlat-setup.h"

namespace qlat
{  //

// -----------------------------------------------------------------------------------

inline std::vector<int> get_all_trajs(const std::string& job_tag)
{
  TIMER_VERBOSE("get_all_trajs");
  std::vector<int> ret;
  if (job_tag == "48I") {
    for (int traj = 500; traj <= 3000; traj += 10) {
      ret.push_back(traj);
    }
  } else if (job_tag == "24D") {
    for (int traj = 1000; traj <= 4000; traj += 10) {
      ret.push_back(traj);
    }
  } else {
    qassert(false);
  }
  return ret;
}

inline std::string get_data_path(const std::string& job_tag, const int traj)
{
  return ssprintf("../../collect-data/results/%s/results=%d", job_tag.c_str(),
                  traj);
}

inline bool compute_traj_do(const std::string& job_tag, const int traj)
{
  TIMER_VERBOSE("compute_traj_do");
  return false;
}

inline bool compute_traj(const std::string& job_tag, const int traj)
{
  setup(job_tag);
  TIMER_VERBOSE("compute_traj");
  displayln_info(fname + ssprintf(": Checking '%s'.",
                                  get_job_path(job_tag, traj).c_str()));
  if (does_file_exist_sync_node(get_job_path(job_tag, traj) +
                                "/checkpoint.txt")) {
    displayln_info(fname + ssprintf(": Finished '%s'.",
                                    get_job_path(job_tag, traj).c_str()));
    return false;
  }
  if (not does_file_exist_sync_node(get_data_path(job_tag, traj))) {
    displayln_info(fname + ssprintf(": No data '%s'.",
                                    get_data_path(job_tag, traj).c_str()));
    return false;
  }
  if (not obtain_lock(get_job_path(job_tag, traj) + "-lock")) {
    displayln_info(fname + ssprintf(": Cannot obtain lock '%s'.",
                                    get_job_path(job_tag, traj).c_str()));
    return true;
  }
  displayln_info(fname + ssprintf(": Start computing '%s'.",
                                  get_job_path(job_tag, traj).c_str()));
  setup(job_tag, traj);
  const bool is_failed = compute_traj_do(job_tag, traj);
  release_lock();
  return is_failed;
}

inline bool compute(const std::string& job_tag)
{
  bool is_failed = false;
  const std::vector<int> trajs = get_all_trajs(job_tag);
  for (int i = 0; i < (int)trajs.size(); ++i) {
    const int traj = trajs[i];
    is_failed = compute_traj(job_tag, traj) or is_failed;
    if (get_total_time() > 1.0) {
      Timer::display();
    }
    Timer::reset();
  }
  return is_failed;
}

// -----------------------------------------------------------------------------------

}  // namespace qlat

int main(int argc, char* argv[])
{
  using namespace qlat;
  std::vector<Coordinate> size_node_list;
  size_node_list.push_back(Coordinate(1,1,1,1));
  begin(&argc, &argv, size_node_list);
  setup_log_idx();
  setup();
  std::vector<std::string> job_tags;
  job_tags.push_back("24D");
  for (int k = 0; k < (int)job_tags.size(); ++k) {
    const std::string& job_tag = job_tags[k];
    if (not compute(job_tag)) {
      displayln_info(ssprintf("program finished successfully for '%s'.", job_tag.c_str()));
    }
  }
  end();
  return 0;
}
