### CMakeLists.txt ---

# Do not forget to copy test files in current binary dir
file(COPY "test2.off" DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/)

include(GUDHI_boost_test)

add_executable_with_targets ( Skeleton_blocker_test_unit test_skeleton_blocker_complex.cpp GUDHI::SkeletonBlocker )
add_executable_with_targets ( Skeleton_blocker_test_geometric_complex test_skeleton_blocker_geometric_complex.cpp GUDHI::SkeletonBlocker )
add_executable_with_targets ( Skeleton_blocker_test_simplifiable test_skeleton_blocker_simplifiable.cpp GUDHI::SkeletonBlocker )

gudhi_add_boost_test(Skeleton_blocker_test_unit)
gudhi_add_boost_test(Skeleton_blocker_test_geometric_complex)
gudhi_add_boost_test(Skeleton_blocker_test_simplifiable)

######################################################################
### CMakeLists.txt ends here
