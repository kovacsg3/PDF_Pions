#include "qlat-setup.h"

namespace qlat
{  //

// -----------------------------------------------------------------------------------

inline std::string get_data_path(const std::string& job_tag, const int traj)
{
  return ssprintf("../../collect-data/results/%s/results=%d", job_tag.c_str(),
                  traj);
}

inline std::vector<int> get_all_trajs(const std::string& job_tag)
{
  TIMER_VERBOSE("get_all_trajs");
  std::vector<int> ret;
  if (job_tag == "48I") {
    for (int traj = 500; traj <= 3000; traj += 10) {
      if (does_file_exist_sync_node(get_data_path(job_tag, traj))) {
        ret.push_back(traj);
      }
    }
  } else if (job_tag == "24D") {
    for (int traj = 1000; traj <= 4000; traj += 10) {
      if (does_file_exist_sync_node(get_data_path(job_tag, traj))) {
        ret.push_back(traj);
      }
    }
  } else {
    qassert(false);
  }
  return ret;
}

inline void compute_traj_do(const std::string& job_tag, const int traj)
{
  TIMER_VERBOSE("compute_traj_do");
  const std::string data_path = get_data_path(job_tag, traj);
  const std::vector<std::vector<double> > dt =
      qload_datatable(data_path + "/pion-corr/lmom=0.txt");
  for (int i = 0; i < (int)dt.size(); ++i) {
    displayln_info(ssprintf("%20lf %24.17E", dt[i][0], dt[i][1]));
  }
  LatData ld;
  ld.load(data_path + "/pion-qpdf-latio/lmom=0 ; tsep=4.lat");
  const Vector<Complex> ldv =
      lat_data_complex_get_const(ld, make_array<int>(0, 0, 0));
  for (int i = 0; i < ldv.size(); ++i) {
    displayln_info(ssprintf("%4d %24.17E %24.17E", i, ldv[i].real(), ldv[i].imag()));
  }
  displayln_info(show(ld));
}

inline void compute_traj(const std::string& job_tag, const int traj)
{
  TIMER_VERBOSE("compute_traj");
  compute_traj_do(job_tag, traj);
}

inline void compute(const std::string& job_tag)
{
  const std::vector<int> trajs = get_all_trajs(job_tag);
  for (int i = 0; i < (int)trajs.size(); ++i) {
    const int traj = trajs[i];
    compute_traj(job_tag, traj);
    if (get_total_time() > 1.0) {
      Timer::display();
    }
    Timer::reset();
  }
}

// -----------------------------------------------------------------------------------

}  // namespace qlat

int main(int argc, char* argv[])
{
  using namespace qlat;
  begin(&argc, &argv);
  std::vector<std::string> job_tags;
  job_tags.push_back("24D");
  for (int k = 0; k < (int)job_tags.size(); ++k) {
    const std::string& job_tag = job_tags[k];
    compute(job_tag);
  }
  end();
  return 0;
}
