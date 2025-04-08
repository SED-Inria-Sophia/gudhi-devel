### CMakeLists.txt ---

cmake_minimum_required(VERSION 3.15)

project(GUDHIdev)

## ###################################################################
## cmake modules folder
## ###################################################################

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/src/cmake/modules/")
include(GUDHI_options)

## ###################################################################
## Version setup
## ###################################################################

include(CMakeGUDHIVersion.txt)

## #############################################################################
##
## #############################################################################

# Reset cache
set(GUDHI_MODULES "" CACHE INTERNAL "GUDHI_MODULES")
set(GUDHI_MISSING_MODULES "" CACHE INTERNAL "GUDHI_MISSING_MODULES")

# This variable is used by Python CMakeLists.txt and by GUDHI_third_party_libraries to know its path
set(GUDHI_PYTHON_PATH "src/python")

if (WITH_GUDHI_THIRD_PARTY)
  # For third parties libraries management - To be done last as CGAL updates CMAKE_MODULE_PATH
  include(GUDHI_third_party_libraries NO_POLICY_SCOPE)
endif()

include(GUDHI_compilation_flags)

## ###################################################################
## Output directory setup
## ###################################################################

include(GNUInstallDirs)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_BINDIR})

## #################################################################
## Install prefix
## #################################################################

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  if (DEFINED ENV{CONDA_PREFIX})
    set(CMAKE_INSTALL_PREFIX "$ENV{CONDA_PREFIX}" CACHE PATH "${PROJECT_NAME} install prefix" FORCE)
  else()
    set(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}/install" CACHE PATH "${PROJECT_NAME} install prefix" FORCE)
  endif()
endif(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)

## ###################################################################
## Default build type (RelWithDebInfo)
## ###################################################################

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message(STATUS "Setting build type to 'Release' as none was specified.")
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose the type of build." FORCE)
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()

## #############################################################################
## Hera dependency
## #############################################################################

include(GUDHI_hera)

## #############################################################################
## GMP dependency
## #############################################################################

if (GMPXX_FOUND)
  add_library(GUDHI::GMPXX INTERFACE IMPORTED)
  set_target_properties(GUDHI::GMPXX PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${GMPXX_INCLUDE_DIR};${GMP_INCLUDE_DIR}"
    INTERFACE_LINK_LIBRARIES      "${GMPXX_LIBRARIES};${GMP_LIBRARIES}"
endif()

## #############################################################################
## Target cmake
## #############################################################################

set(CMAKE_INCLUDE_CURRENT_DIR OFF)

add_subdirectory(src/common)

add_subdirectory(src/Alpha_complex)
add_subdirectory(src/Bitmap_cubical_complex)
add_subdirectory(src/Bottleneck_distance)
add_subdirectory(src/Cech_complex)
add_subdirectory(src/Collapse)
add_subdirectory(src/Contraction)
add_subdirectory(src/Coxeter_triangulation)
add_subdirectory(src/Hasse_complex)
add_subdirectory(src/Nerve_GIC)
add_subdirectory(src/Persistence_matrix)
add_subdirectory(src/Persistence_representations)
add_subdirectory(src/Persistent_cohomology)
add_subdirectory(src/Ripser)
add_subdirectory(src/Rips_complex)
add_subdirectory(src/Simplex_tree)
add_subdirectory(src/Skeleton_blocker)
add_subdirectory(src/Spatial_searching)
add_subdirectory(src/Subsampling)
add_subdirectory(src/Tangential_complex)
add_subdirectory(src/Toplex_map)
add_subdirectory(src/Witness_complex)
add_subdirectory(src/Zigzag_persistence)

## ###################################################################
## Exporting
## ###################################################################

include(GUDHIExport)

export(PACKAGE GUDHI)

######################################################################
### CMakeLists.txt ends here
