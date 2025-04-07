### CMakeLists.txt ---

include(GUDHI_boost_test)
add_executable_with_targets(Tangential_complex_test_TC test_tangential_complex.cpp GUDHI::TangentialComplex GUDHI::Subsampling GUDHI::SimplexTree CGAL::CGAL)
gudhi_add_boost_test(Tangential_complex_test_TC)

######################################################################
### CMakeLists.txt ends here
