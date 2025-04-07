### CMakeLists.txt ---

include(GUDHI_boost_test)

add_executable_with_targets(Witness_complex_test_simple_witness_complex test_simple_witness_complex.cpp GUDHI::WitnessComplex GUDHI::SimplexTree)
gudhi_add_boost_test(Witness_complex_test_simple_witness_complex)

add_executable_with_targets(Witness_complex_test_euclidean_simple_witness_complex test_euclidean_simple_witness_complex.cpp GUDHI::WitnessComplex GUDHI::SimplexTree)
gudhi_add_boost_test(Witness_complex_test_euclidean_simple_witness_complex)

######################################################################
### CMakeLists.txt ends here
