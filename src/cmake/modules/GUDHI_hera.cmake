### GUDHI_hera.cmake ---

# For those who dislike bundled dependencies, this indicates where to find a preinstalled Hera.
set(HERA_INTERNAL_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/ext/hera)
set(HERA_INCLUDE_DIR ${HERA_INTERNAL_INCLUDE_DIR} CACHE PATH "Directory where one can find hera/{wasserstein.h,bottleneck.h}")

if (NOT EXISTS ${HERA_INCLUDE_DIR}/include/hera/wasserstein.h OR NOT EXISTS ${HERA_INCLUDE_DIR}/include/hera/bottleneck.h)
  message(WARNING "${HERA_INCLUDE_DIR}/hera/{wasserstein.h,bottleneck.h} are not found.\n\
  GUDHI requires this submodules, please consider to launch `git submodule update --init`.\n\
  If hera was installed in a specific directory, you can also consider to specify it to the cmake command with `cmake -DHERA_INCLUDE_DIR=... ...`")
else()

  # Custom target rules
  file(GLOB_RECURSE HERA_FILES "${HERA_INCLUDE_DIR}/include/hera/**")
  #message(${HERA_FILES})
  add_library(Hera INTERFACE ${HERA_FILES})
  target_include_directories(Hera INTERFACE
    $<BUILD_INTERFACE:${HERA_INCLUDE_DIR}/include>
    $<INSTALL_INTERFACE:include>)
  add_library(GUDHI::Hera ALIAS Hera)

  # Custom install rules
  foreach ( file ${HERA_FILES} )
    get_filename_component( dir ${file} DIRECTORY )
    string(REPLACE "${HERA_INCLUDE_DIR}/" "" odir ${dir})
    install(
      FILES       ${file}
      DESTINATION ${odir}
    )
  endforeach()

  install(
    TARGETS Hera
    EXPORT  GUDHIHera-targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  )

  install(
    EXPORT      GUDHIHera-targets
    FILE        GUDHIHeraTargets.cmake
    NAMESPACE   GUDHI::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/GUDHI
  )

  export(
    EXPORT    GUDHIHera-targets
    NAMESPACE GUDHI::
    FILE      ${CMAKE_BINARY_DIR}/GUDHIHeraTargets.cmake
  )

endif()

######################################################################
### GUDHI_hera.cmake ends here
