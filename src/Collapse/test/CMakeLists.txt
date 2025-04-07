### CMakeLists.txt ---

include(GUDHI_boost_test)
add_executable_with_targets(Collapse_test_unit collapse_unit_test.cpp GUDHI::Collapse)
gudhi_add_boost_test(Collapse_test_unit)

######################################################################
### CMakeLists.txt ends here
