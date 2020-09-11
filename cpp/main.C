#include "qlat-setup.h"

namespace qlat
{  //

// -----------------------------------------------------------------------------------

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

inline std::vector<int> get_all_trajs(const std::string& job_tag)
{
  TIMER_VERBOSE("get_all_trajs");
  std::vector<int> ret;
  if (job_tag.substr(0, 5) == "free-") {
    for (int traj = 1000; traj < 1020; traj += 10) {
      ret.push_back(traj);
    }
  } else if (job_tag.substr(0, 5) == "test-") {
    for (int traj = 1000; traj < 1020; traj += 10) {
      ret.push_back(traj);
    }
  } else if (job_tag == "16I-0.01") {
    for (int traj = 1000; traj <= 4000; traj += 100) {
      ret.push_back(traj);
    }
  } else if (job_tag == "24I-0.01") {
    for (int traj = 2700; traj <= 8500; traj += 100) {
      ret.push_back(traj);
    }
  } else if (job_tag == "48I") {
    for (int traj = 500; traj <= 3000; traj += 10) {
      ret.push_back(traj);
    }
  } else if (job_tag == "64I-0.000678") {
    for (int traj = 1000; traj <= 3000; traj += 10) {
      ret.push_back(traj);
    }
  } else if (job_tag == "24D") {
    for (int traj = 1000; traj <= 4000; traj += 10) {
      ret.push_back(traj);
    }
  } else if (job_tag == "24D-0.0174") {
    for (int traj = 1000; traj >= 200; traj -= 10) {
      ret.push_back(traj);
    }
  } else if (job_tag == "32D-0.00107") {
    for (int traj = 680; traj <= 2000; traj += 10) {
      ret.push_back(traj);
    }
  } else if (job_tag == "32Dfine-0.0001") {
    for (int traj = 2000; traj >= 200; traj -= 10) {
      ret.push_back(traj);
    }
  } else {
    qassert(false);
  }
  return ret;
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
  std::vector<std::string> job_tags;
  job_tags.push_back("24D");
  std::vector<Coordinate> size_node_list;
  size_node_list.push_back(Coordinate(1,1,1,1));
  begin(&argc, &argv, size_node_list);
  setup_log_idx();
  setup();
  for (int k = 0; k < (int)job_tags.size(); ++k) {
    const std::string& job_tag = job_tags[k];
    if (not compute(job_tag)) {
      displayln_info(ssprintf("program finished successfully for '%s'.", job_tag.c_str()));
    }
  }
  end();
  return 0;
}
