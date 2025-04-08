### CMakeLists.txt ---

project(Contraction
VERSION   "${GUDHI_MAJOR_VERSION}.${GUDHI_MINOR_VERSION}"
LANGUAGES CXX
)

## #################################################################
## Sources
## #################################################################

set(${PROJECT_NAME}_HEADERS
  include/gudhi/Edge_contraction.h
  include/gudhi/Skeleton_blocker_contractor.h
  include/gudhi/Contraction/Edge_profile.h
  include/gudhi/Contraction/policies/Contraction_visitor.h
  include/gudhi/Contraction/policies/Cost_policy.h
  include/gudhi/Contraction/policies/Dummy_valid_contraction.h
  include/gudhi/Contraction/policies/Edge_length_cost.h
  include/gudhi/Contraction/policies/First_vertex_placement.h
  include/gudhi/Contraction/policies/Link_condition_valid_contraction.h
  include/gudhi/Contraction/policies/Middle_placement.h
  include/gudhi/Contraction/policies/Placement_policy.h
  include/gudhi/Contraction/policies/Valid_contraction_policy.h
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
target_link_libraries(${PROJECT_NAME} INTERFACE Boost::boost)

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
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/GUDHI
)

export(
  EXPORT    GUDHI${PROJECT_NAME}-targets
  NAMESPACE GUDHI::
  FILE      ${CMAKE_BINARY_DIR}/GUDHI${PROJECT_NAME}Targets.cmake
)

######################################################################
### CMakeLists.txt ends here
