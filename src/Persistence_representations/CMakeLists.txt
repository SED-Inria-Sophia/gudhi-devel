### CMakeLists.txt ---

project(PersistenceRepresentations
VERSION   "${GUDHI_MAJOR_VERSION}.${GUDHI_MINOR_VERSION}"
LANGUAGES CXX
)

## #################################################################
## Sources
## #################################################################

set(${PROJECT_NAME}_HEADERS
  include/gudhi/PSSK.h
  include/gudhi/Persistence_heat_maps.h
  include/gudhi/Persistence_intervals.h
  include/gudhi/Persistence_landscape.h
  include/gudhi/Persistence_landscape_on_grid.h
  include/gudhi/Persistence_vectors.h
  include/gudhi/Sliced_Wasserstein.h
  include/gudhi/common_persistence_representations.h
  include/gudhi/read_persistence_from_file.h
)

if (TARGET GUDHI::BottleneckDistance)
  set(${PROJECT_NAME}_HEADERS
    ${${PROJECT_NAME}_HEADERS}
    include/gudhi/Persistence_intervals_with_distances.h
  )
endif()

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
if (TARGET GUDHI::BottleneckDistance)
  target_link_libraries(${PROJECT_NAME} INTERFACE GUDHI::BottleneckDistance)
endif()
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
