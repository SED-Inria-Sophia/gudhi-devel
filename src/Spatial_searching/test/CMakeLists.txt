### CMakeLists.txt ---

include(GUDHI_boost_test)

add_executable_with_targets(Spatial_searching_test_Kd_tree_search test_Kd_tree_search.cpp GUDHI::SpatialSearching)
gudhi_add_boost_test(Spatial_searching_test_Kd_tree_search)

######################################################################
### CMakeLists.txt ends here
