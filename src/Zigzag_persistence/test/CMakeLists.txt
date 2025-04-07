### CMakeLists.txt ---

include(GUDHI_boost_test)

add_executable_with_targets(Zigzag_persistence_test_zigzag_persistence test_zigzag_persistence.cpp GUDHI::ZigzagPersistence)
gudhi_add_boost_test(Zigzag_persistence_test_zigzag_persistence)

add_executable_with_targets(Zigzag_persistence_test_filtered_zigzag_persistence test_filtered_zigzag_persistence.cpp GUDHI::ZigzagPersistence)
gudhi_add_boost_test(Zigzag_persistence_test_filtered_zigzag_persistence)

######################################################################
### CMakeLists.txt ends here
