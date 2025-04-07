### CMakeLists.txt ---

include(GUDHI_boost_test)

add_executable_with_targets(Bottleneck_distance_test_unit bottleneck_unit_test.cpp GUDHI::BottleneckDistance)
gudhi_add_boost_test(Bottleneck_distance_test_unit)

######################################################################
### CMakeLists.txt ends here
