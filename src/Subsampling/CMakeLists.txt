### CMakeLists.txt ---

project(Subsampling
VERSION   "${GUDHI_MAJOR_VERSION}.${GUDHI_MINOR_VERSION}"
LANGUAGES CXX
)

## #################################################################
## Sources
## #################################################################

set(${PROJECT_NAME}_HEADERS
  include/gudhi/choose_n_farthest_points.h
  include/gudhi/pick_n_random_points.h
  include/gudhi/sparsify_point_set.h
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
target_link_libraries(${PROJECT_NAME} INTERFACE GUDHI::SpatialSearching)
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
