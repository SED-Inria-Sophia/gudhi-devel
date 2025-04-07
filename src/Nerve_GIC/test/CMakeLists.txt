### CMakeLists.txt ---

file(COPY data DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/)

include(GUDHI_boost_test)

add_executable_with_targets(Nerve_GIC_test_unit test_GIC.cpp GUDHI::NerveGIC GUDHI::SpatialSearching)
gudhi_add_boost_test(Nerve_GIC_test_unit)

######################################################################
### CMakeLists.txt ends here
