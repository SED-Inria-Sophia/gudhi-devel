### CMakeLists.txt ---

if(TARGET CGAL::CGAL)
  include(GUDHI_boost_test)

  add_executable_with_targets(Subsampling_test_pick_n_random_points test_pick_n_random_points.cpp GUDHI::Subsampling CGAL::CGAL)
  gudhi_add_boost_test(Subsampling_test_pick_n_random_points)

  add_executable_with_targets(Subsampling_test_choose_n_farthest_points test_choose_n_farthest_points.cpp GUDHI::Subsampling CGAL::CGAL)
  gudhi_add_boost_test(Subsampling_test_choose_n_farthest_points)

  add_executable_with_targets(Subsampling_test_sparsify_point_set test_sparsify_point_set.cpp GUDHI::Subsampling CGAL::CGAL)
  gudhi_add_boost_test(Subsampling_test_sparsify_point_set)
endif()

######################################################################
### CMakeLists.txt ends here
