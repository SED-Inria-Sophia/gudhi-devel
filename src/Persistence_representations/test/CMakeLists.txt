### CMakeLists.txt ---

include(GUDHI_boost_test)

# copy data directory for tests purpose.
file(COPY data DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/)
add_executable_with_targets ( Persistence_intervals_test_unit persistence_intervals_test.cpp GUDHI::PersistenceRepresentations)
gudhi_add_boost_test(Persistence_intervals_test_unit)

add_executable_with_targets (Vector_representation_test_unit vector_representation_test.cpp GUDHI::PersistenceRepresentations)
gudhi_add_boost_test(Vector_representation_test_unit)

add_executable_with_targets (Persistence_lanscapes_test_unit persistence_lanscapes_test.cpp GUDHI::PersistenceRepresentations)
gudhi_add_boost_test(Persistence_lanscapes_test_unit)

add_executable_with_targets ( Persistence_lanscapes_on_grid_test_unit persistence_lanscapes_on_grid_test.cpp GUDHI::PersistenceRepresentations)
gudhi_add_boost_test(Persistence_lanscapes_on_grid_test_unit)

add_executable_with_targets (Persistence_heat_maps_test_unit persistence_heat_maps_test.cpp GUDHI::PersistenceRepresentations)
gudhi_add_boost_test(Persistence_heat_maps_test_unit)

add_executable_with_targets ( Read_persistence_from_file_test_unit read_persistence_from_file_test.cpp GUDHI::PersistenceRepresentations)
gudhi_add_boost_test(Read_persistence_from_file_test_unit)

add_executable_with_targets ( kernels_unit kernels.cpp GUDHI::PersistenceRepresentations)
gudhi_add_boost_test(kernels_unit)

if (TARGET GUDHI::BottleneckDistance)
  add_executable_with_targets(Persistence_intervals_with_distances_test_unit persistence_intervals_with_distances_test.cpp GUDHI::PersistenceRepresentations)
  gudhi_add_boost_test(Persistence_intervals_with_distances_test_unit)
endif()

######################################################################
### CMakeLists.txt ends here
