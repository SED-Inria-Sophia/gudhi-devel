### CMakeLists.txt ---

project(PersistenceMatrix
VERSION   "${GUDHI_MAJOR_VERSION}.${GUDHI_MINOR_VERSION}"
LANGUAGES CXX
)

## #################################################################
## Sources
## #################################################################

set(${PROJECT_NAME}_HEADERS
  include/gudhi/Matrix.h
  include/gudhi/persistence_interval.h
  include/gudhi/persistence_matrix_options.h

  include/gudhi/Persistence_matrix/Base_matrix.h
  include/gudhi/Persistence_matrix/Base_matrix_with_column_compression.h
  include/gudhi/Persistence_matrix/Boundary_matrix.h
  include/gudhi/Persistence_matrix/Chain_matrix.h
  include/gudhi/Persistence_matrix/Id_to_index_overlay.h
  include/gudhi/Persistence_matrix/Position_to_index_overlay.h
  include/gudhi/Persistence_matrix/RU_matrix.h
  include/gudhi/Persistence_matrix/base_pairing.h
  include/gudhi/Persistence_matrix/base_swap.h
  include/gudhi/Persistence_matrix/boundary_cell_position_to_id_mapper.h
  include/gudhi/Persistence_matrix/chain_pairing.h
  include/gudhi/Persistence_matrix/chain_rep_cycles.h
  include/gudhi/Persistence_matrix/chain_vine_swap.h
  include/gudhi/Persistence_matrix/matrix_dimension_holders.h
  include/gudhi/Persistence_matrix/matrix_row_access.h
  include/gudhi/Persistence_matrix/ru_pairing.h
  include/gudhi/Persistence_matrix/ru_rep_cycles.h
  include/gudhi/Persistence_matrix/ru_vine_swap.h

  include/gudhi/Persistence_matrix/allocators/entry_constructors.h

  include/gudhi/Persistence_matrix/columns/chain_column_extra_properties.h
  include/gudhi/Persistence_matrix/columns/column_dimension_holder.h
  include/gudhi/Persistence_matrix/columns/column_utilities.h
  include/gudhi/Persistence_matrix/columns/entry_types.h
  include/gudhi/Persistence_matrix/columns/heap_column.h
  include/gudhi/Persistence_matrix/columns/intrusive_list_column.h
  include/gudhi/Persistence_matrix/columns/intrusive_set_column.h
  include/gudhi/Persistence_matrix/columns/list_column.h
  include/gudhi/Persistence_matrix/columns/naive_vector_column.h
  include/gudhi/Persistence_matrix/columns/row_access.h
  include/gudhi/Persistence_matrix/columns/set_column.h
  include/gudhi/Persistence_matrix/columns/unordered_set_column.h
  include/gudhi/Persistence_matrix/columns/vector_column.h

  include/gudhi/Fields/Multi_field.h
  include/gudhi/Fields/Multi_field_operators.h
  include/gudhi/Fields/Multi_field_shared.h
  include/gudhi/Fields/Multi_field_small.h
  include/gudhi/Fields/Multi_field_small_operators.h
  include/gudhi/Fields/Multi_field_small_shared.h
  include/gudhi/Fields/Z2_field.h
  include/gudhi/Fields/Z2_field_operators.h
  include/gudhi/Fields/Zp_field.h
  include/gudhi/Fields/Zp_field_operators.h
  include/gudhi/Fields/Zp_field_shared.h
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
  EXPORT    GUDHI${PROJECT_NAME}-targets
  NAMESPACE GUDHI::
  FILE      ${CMAKE_BINARY_DIR}/GUDHI${PROJECT_NAME}Targets.cmake
)

## #############################################################################
## Testing the module
## #############################################################################

add_subdirectory(test)

######################################################################
### CMakeLists.txt ends here
