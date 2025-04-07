### CMakeLists.txt ---

include(GUDHI_boost_test)

add_executable_with_targets(Coxeter_triangulation_permutahedral_representation_test perm_rep_test.cpp GUDHI::CoxeterTriangulation)
add_executable_with_targets(Coxeter_triangulation_freudenthal_triangulation_test freud_triang_test.cpp GUDHI::CoxeterTriangulation)
add_executable_with_targets(Coxeter_triangulation_functions_test function_test.cpp GUDHI::CoxeterTriangulation)
add_executable_with_targets(Coxeter_triangulation_oracle_test oracle_test.cpp GUDHI::CoxeterTriangulation)
add_executable_with_targets(Coxeter_triangulation_manifold_tracing_test manifold_tracing_test.cpp GUDHI::CoxeterTriangulation)
add_executable_with_targets(Coxeter_triangulation_cell_complex_test cell_complex_test.cpp GUDHI::CoxeterTriangulation)
add_executable_with_targets(Coxeter_triangulation_random_orthogonal_matrix_function_test random_orthogonal_matrix_function_test.cpp GUDHI::CoxeterTriangulation)

gudhi_add_boost_test(Coxeter_triangulation_permutahedral_representation_test)
gudhi_add_boost_test(Coxeter_triangulation_freudenthal_triangulation_test)
gudhi_add_boost_test(Coxeter_triangulation_functions_test)
gudhi_add_boost_test(Coxeter_triangulation_oracle_test)
gudhi_add_boost_test(Coxeter_triangulation_manifold_tracing_test)
gudhi_add_boost_test(Coxeter_triangulation_cell_complex_test)
gudhi_add_boost_test(Coxeter_triangulation_random_orthogonal_matrix_function_test)

######################################################################
### CMakeLists.txt ends here
