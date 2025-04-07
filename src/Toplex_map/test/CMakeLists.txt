### CMakeLists.txt ---

include(GUDHI_boost_test)

add_executable_with_targets( Toplex_map_unit_test toplex_map_unit_test.cpp GUDHI::ToplexMap )
gudhi_add_boost_test(Toplex_map_unit_test)

add_executable_with_targets ( Lazy_toplex_map_unit_test lazy_toplex_map_unit_test.cpp GUDHI::ToplexMap )
gudhi_add_boost_test(Lazy_toplex_map_unit_test)

######################################################################
### CMakeLists.txt ends here
