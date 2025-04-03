### GUDHIExport.cmake ---

include(CMakePackageConfigHelpers)

configure_package_config_file(
  ${CMAKE_SOURCE_DIR}/src/cmake/modules/GUDHIConfig.cmake.in
  ${CMAKE_BINARY_DIR}/GUDHIConfig.cmake
  INSTALL_DESTINATION
  ${CMAKE_INSTALL_LIBDIR}/cmake/gudhi)

write_basic_package_version_file(
  ${CMAKE_BINARY_DIR}/GUDHIConfigVersion.cmake
  VERSION       ${GUDHI_VERSION}
  COMPATIBILITY AnyNewerVersion)

install(
  FILES       ${CMAKE_BINARY_DIR}/GUDHIConfig.cmake
              ${CMAKE_BINARY_DIR}/GUDHIConfigVersion.cmake
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/gudhi)
endif()

######################################################################
### GUDHIExport.cmake ends here
