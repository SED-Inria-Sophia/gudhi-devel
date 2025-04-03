### CMakeLists.txt ---

project(SimplexTree
VERSION   "${GUDHI_MAJOR_VERSION}.${GUDHI_MINOR_VERSION}"
LANGUAGES CXX
)

## #################################################################
## Sources
## #################################################################

set(${PROJECT_NAME}_HEADERS
  include/gudhi/Simplex_tree.h
  include/gudhi/Simplex_tree/Simplex_tree_iterators.h
  include/gudhi/Simplex_tree/Simplex_tree_node_explicit_storage.h
  include/gudhi/Simplex_tree/Simplex_tree_siblings.h
  include/gudhi/Simplex_tree/Simplex_tree_star_simplex_iterators.h
  include/gudhi/Simplex_tree/filtration_value_utils.h
  include/gudhi/Simplex_tree/hooks_simplex_base.h
  include/gudhi/Simplex_tree/indexing_tag.h
  include/gudhi/Simplex_tree/serialization_utils.h
  include/gudhi/Simplex_tree/simplex_tree_options.h
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

target_link_libraries(${PROJECT_NAME} INTERFACE ${Boost_LIBRARIES})

if(WITH_GUDHI_USE_TBB AND TARGET TBB::tbb)
  target_link_libraries(${PROJECT_NAME} INTERFACE TBB::tbb)
endif()

add_library(GUDHI::SimplexTree ALIAS ${PROJECT_NAME})

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
  FILE   ${CMAKE_BINARY_DIR}/${PROJECT_NAME}Targets.cmake
)

######################################################################
### CMakeLists.txt ends here
