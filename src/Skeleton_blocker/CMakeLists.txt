### CMakeLists.txt ---

project(SkeletonBlocker
VERSION   "${GUDHI_MAJOR_VERSION}.${GUDHI_MINOR_VERSION}"
LANGUAGES CXX
)

## #################################################################
## Sources
## #################################################################

set(${PROJECT_NAME}_HEADERS
  include/gudhi/Skeleton_blocker.h
  include/gudhi/Skeleton_blocker_complex.h
  include/gudhi/Skeleton_blocker_geometric_complex.h
  include/gudhi/Skeleton_blocker_link_complex.h
  include/gudhi/Skeleton_blocker_simplifiable_complex.h
  include/gudhi/Skeleton_blocker/Skeleton_blocker_complex_visitor.h
  include/gudhi/Skeleton_blocker/Skeleton_blocker_link_superior.h
  include/gudhi/Skeleton_blocker/Skeleton_blocker_off_io.h
  include/gudhi/Skeleton_blocker/Skeleton_blocker_simplex.h
  include/gudhi/Skeleton_blocker/Skeleton_blocker_simple_geometric_traits.h
  include/gudhi/Skeleton_blocker/Skeleton_blocker_simple_traits.h
  include/gudhi/Skeleton_blocker/Skeleton_blocker_sub_complex.h
  include/gudhi/Skeleton_blocker/internal/Top_faces.h
  include/gudhi/Skeleton_blocker/internal/Trie.h
  include/gudhi/Skeleton_blocker/iterators/Skeleton_blockers_blockers_iterators.h
  include/gudhi/Skeleton_blocker/iterators/Skeleton_blockers_edges_iterators.h
  include/gudhi/Skeleton_blocker/iterators/Skeleton_blockers_iterators.h
  include/gudhi/Skeleton_blocker/iterators/Skeleton_blockers_simplices_iterators.h
  include/gudhi/Skeleton_blocker/iterators/Skeleton_blockers_triangles_iterators.h
  include/gudhi/Skeleton_blocker/iterators/Skeleton_blockers_vertices_iterators.h
)

set(${PROJECT_NAME}_SOURCES
)

## #############################################################################
## Build rules
## #############################################################################

add_library(${PROJECT_NAME} INTERFACE
  ${${PROJECT_NAME}_SOURCES}
  ${${PROJECT_NAME}_HEADERS})

target_include_directories(${PROJECT_NAME} INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>)
target_link_libraries(${PROJECT_NAME} INTERFACE GUDHI::Common)
target_link_libraries(${PROJECT_NAME} INTERFACE ${Boost_LIBRARIES})

add_library(GUDHI::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

## #################################################################
## Target properties
## #################################################################

set_target_properties(${PROJECT_NAME} PROPERTIES VERSION   ${${PROJECT_NAME}_VERSION}
                                                 SOVERSION ${${PROJECT_NAME}_VERSION_MAJOR})

## ###################################################################
## Install rules - files
## ###################################################################

foreach ( file ${${PROJECT_NAME}_HEADERS} )
  get_filename_component( dir ${file} DIRECTORY )
  install(
    FILES       ${file}
    DESTINATION ${dir}
  )
endforeach()

## ###################################################################
## Install rules - targets
## ###################################################################

install(
  TARGETS ${PROJECT_NAME}
  EXPORT  GUDHI${PROJECT_NAME}-targets
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

install(
  EXPORT      GUDHI${PROJECT_NAME}-targets
  FILE        GUDHI${PROJECT_NAME}Targets.cmake
  NAMESPACE   GUDHI::
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/gudhi
)

export(
  EXPORT GUDHI${PROJECT_NAME}-targets
  FILE   ${CMAKE_BINARY_DIR}/GUDHI${PROJECT_NAME}Targets.cmake
)

## #############################################################################
## Testing the module
## #############################################################################

add_subdirectory(test)

######################################################################
### CMakeLists.txt ends here
