cmake_minimum_required(VERSION 3.15)

project(GUDHIdev)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/src/cmake/modules/")
include(CMakeGUDHIVersion.txt)
include(GUDHI_options)

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

# Add your new module in the list, order is not important
# include(GUDHI_modules)

# add_gudhi_module(common)
# add_gudhi_module(Alpha_complex)
# add_gudhi_module(Bitmap_cubical_complex)
# add_gudhi_module(Bottleneck_distance)
# add_gudhi_module(Collapse)
# add_gudhi_module(Contraction)
# add_gudhi_module(Coxeter_triangulation)
# add_gudhi_module(Cech_complex)
# add_gudhi_module(Hasse_complex)
# add_gudhi_module(Persistence_representations)
# add_gudhi_module(Persistent_cohomology)
# add_gudhi_module(Rips_complex)
# add_gudhi_module(Ripser)
# add_gudhi_module(Simplex_tree)
# add_gudhi_module(Skeleton_blocker)
# add_gudhi_module(Spatial_searching)
# add_gudhi_module(Subsampling)
# add_gudhi_module(Tangential_complex)
# add_gudhi_module(Toplex_map)
# add_gudhi_module(Witness_complex)
# add_gudhi_module(Nerve_GIC)
# add_gudhi_module(Persistence_matrix)
# add_gudhi_module(Zigzag_persistence)

# # Include module CMake subdirectories
# # GUDHI_SUB_DIRECTORIES is managed in CMAKE_MODULE_PATH/GUDHI_modules.cmake
# foreach(GUDHI_MODULE ${GUDHI_MODULES})
#   foreach(GUDHI_SUB_DIRECTORY ${GUDHI_SUB_DIRECTORIES})
#     if(EXISTS ${CMAKE_SOURCE_DIR}/src/${GUDHI_MODULE}/${GUDHI_SUB_DIRECTORY}/CMakeLists.txt)
#       add_subdirectory(src/${GUDHI_MODULE}/${GUDHI_SUB_DIRECTORY}/)
#     endif()
#   endforeach()
# endforeach()

# if (WITH_GUDHI_GUDHUI)
#   add_subdirectory(src/GudhUI)
# endif()

# if (WITH_GUDHI_PYTHON)
#   # specific for python module
#   add_subdirectory(${GUDHI_PYTHON_PATH})
# else()
#   message("++ Python module will not be compiled because WITH_GUDHI_PYTHON is set to OFF")
#   set(GUDHI_MISSING_MODULES ${GUDHI_MISSING_MODULES} "python")
# endif()

# # For "make user_version" - Requires GUDHI_modules to be performed
# include(GUDHI_user_version_target)
# set(GUDHI_BIBLIO_DIR ${CMAKE_CURRENT_BINARY_DIR})
# # For "make doxygen" - Requires GUDHI_USER_VERSION_DIR to be set - Done in GUDHI_user_version_target for dev version
# include(GUDHI_doxygen_target)

# configure_file(${CMAKE_SOURCE_DIR}/.github/for_maintainers/new_gudhi_version_creation.md "${CMAKE_CURRENT_BINARY_DIR}/" @ONLY)

# message("++ GUDHI_MODULES list is:\"${GUDHI_MODULES}\"")
# message("++ GUDHI_MISSING_MODULES list is:\"${GUDHI_MISSING_MODULES}\"")

## ###################################################################
## Output directory setup
## ###################################################################

include(GNUInstallDirs)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/${CMAKE_INSTALL_BINDIR})

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
# add_subdirectory(src/Persistence_representations)
add_subdirectory(src/Persistent_cohomology)
add_subdirectory(src/Ripser)
add_subdirectory(src/Rips_complex)
add_subdirectory(src/Simplex_tree)
# add_subdirectory(src/Skeleton_blocker)
add_subdirectory(src/Spatial_searching)
add_subdirectory(src/Subsampling)
add_subdirectory(src/Tangential_complex)
# add_subdirectory(src/Toplex_map)
add_subdirectory(src/Witness_complex)
# add_subdirectory(src/Zigzag_persistence)

## ###################################################################
## Exporting
## ###################################################################

include(GUDHIExport)

export(PACKAGE GUDHI)
