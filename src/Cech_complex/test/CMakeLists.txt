### CMakeLists.txt ---

include(GUDHI_boost_test)

# Do not forget to copy test files in current binary dir
file(COPY "${CMAKE_SOURCE_DIR}/data/points/alphacomplexdoc.off" DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/)

add_executable_with_targets(Cech_complex_test_unit test_cech_complex.cpp GUDHI::CechComplex GUDHI::SimplexTree)
gudhi_add_boost_test(Cech_complex_test_unit)

######################################################################
### CMakeLists.txt ends here
